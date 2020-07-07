function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Title,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OwnerGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $PlanId,

        [Parameter()]
        [System.String]
        [ValidateSet("Present", "Absent")]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

        [Parameter()]
        [System.String]
        $ApplicationId
    )
    Write-Verbose -Message "Getting configuration of Planner Plan {$Title}"

    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'AzureAD' `
        -InboundParameters $PSBoundParameters

    $UsedID = $false
    $AllGroups = Get-AzureADGroup -ObjectId $OwnerGroup -ErrorAction 'SilentlyContinue'
    if ($AllGroups -eq $null)
    {
        Write-Verbose -Message "Could not get Azure AD Group {$OwnerGroup} by ID. `
             Trying by Name."
        [Array]$AllGroups = Get-AzureADGroup -SearchString $OwnerGroup
    }
    else
    {
        Write-Verbose -Message "Found group {$OwnerGroup} by ID"
        $UsedID = $true
    }

    if ($AllGroups -eq $null)
    {
        Write-Verbose -Message "No Azure AD Group found for {$OwnerGroup}"
    }
    elseif ($AllGroups.Length -gt 1)
    {
        Write-Verbose -Message "Multiple Groups with name {$OwnerGroup} found."
    }

    $plan = $null
    foreach ($group in $AllGroups)
    {
        try
        {
            Write-Verbose -Message "Scanning Group {$($group.DisplayName)} for plan {$Title}"
            if ([System.String]::IsNullOrEmpty($PlanId))
            {
                [array]$plan = Get-M365DSCPlannerPlansFromGroup -GroupId $group.ObjectId `
                            -ApplicationID $ApplicationId `
                            -GlobalAdminAccount $GlobalAdminAccount | Where-Object -FilterScript {$_.Title -eq $Title}
            }
            else
            {
                [array]$plan = Get-M365DSCPlannerPlansFromGroup -GroupId $group.ObjectId `
                            -ApplicationID $ApplicationId `
                            -GlobalAdminAccount $GlobalAdminAccount | Where-Object -FilterScript {$_.Id -eq $PlanId}
            }
            if ($null -ne $plan)
            {
                Write-Verbose -Message "Found Plan."
                if ($UsedID)
                {
                    $OwnerGroupValue = $group.ObjectId
                }
                else
                {
                    $OwnerGroupValue = $group.DisplayName
                }
                break;
            }
        }
        catch
        {
            Write-Verbose -Message $_
            New-M365DSCLogEntry -Error $_ `
                -Message "Couldn't get Planner plans for {$($group.DisplayName)}" `
                -Source $MyInvocation.MyCommand.ModuleName
        }
    }

    if ($null -eq $plan)
    {
        Write-Verbose -Message "Plan not found, returning Ensure = Absent"
        $results = @{
            Title                 = $Title
            PlanId                = $PlanId
            OwnerGroup            = $OwnerGroup
            Ensure                = 'Absent'
            CertificateThumbprint = $CertificateThumbprint
            ApplicationId         = $ApplicationId
            TenantID              = $TenantId
        }
    }
    else
    {
        Write-Verbose -Message "Plan found, returning Ensure = Present"
        $results = @{
            Title              = $plan.Title
            PlanId             = $plan.Id
            OwnerGroup         = $OwnerGroupValue
            Ensure             = 'Present'
            GlobalAdminAccount = $GlobalAdminAccount
            ApplicationId      = $ApplicationId
        }
    }
    Write-Verbose -Message "Get-TargetResource Result: `n $(Convert-M365DscHashtableToString -Hashtable $results)"
    return $results
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Title,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OwnerGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $PlanId,

        [Parameter()]
        [System.String]
        [ValidateSet("Present", "Absent")]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

        [Parameter()]
        [System.String]
        $ApplicationId
    )
    Write-Verbose -Message "Setting configuration of Planner Plan {$Title}"

    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $currentValues = Get-TargetResource @PSBoundParameters

    if ($Ensure -eq 'Present' -and $currentValues.Ensure -eq 'Absent')
    {
        Write-Verbose -Message "Planner Plan {$Title} doesn't already exist. Creating it."
        New-M365DSCPlannerPlan -GroupId $OwnerGroup `
            -Title $Title `
            -ApplicationId $ApplicationId `
            -GlobalAdminAccount $GlobalAdminAccount | Out-Null
    }
    elseif ($Ensure -eq 'Present' -and $currentValues.Ensure -eq 'Present')
    {
        Write-Verbose -Message "Planner Plan {$Title} already exists, but is not in the `
            Desired State. Updating it."
        <#[Array]$AllGroups = Get-AzureADGroup -ObjectId $OwnerGroup -ErrorAction 'SilentlyContinue'
        Write-Verbose -Message $AllGroups[0]
        if ($AllGroups -eq $null)
        {
            [Array]$AllGroups = Get-AzureADGroup -SearchString $OwnerGroup
        }
        $plan = Get-MGGroupPlannerPlan -GroupId $AllGroups[0].ObjectId | Where-Object -FilterScript {$_.Title -eq $Title}
        $SetParams.Add("PlannerPlanId", $plan.Id)
        $SetParams.Add("Owner", $AllGroups[0].ObjectId)
        $SetParams.Remove("OwnerGroup") | Out-Null
        Update-MGPlannerPlan @SetParams#>
    }
    elseif ($Ensure -eq 'Absent' -and $currentValues.Ensure -eq 'Present')
    {
        Write-Verbose -Message "This resource doesn't allow for removal of Planner plans."
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Title,

        [Parameter(Mandatory = $true)]
        [System.String]
        $OwnerGroup,

        [Parameter(Mandatory = $true)]
        [System.String]
        $PlanId,

        [Parameter()]
        [System.String]
        [ValidateSet("Present", "Absent")]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

        [Parameter()]
        [System.String]
        $ApplicationId
    )

    Write-Verbose -Message "Testing configuration of Planner Plan {$Title}"

    $CurrentValues = Get-TargetResource @PSBoundParameters
    Write-Verbose -Message "Target Values: $(Convert-M365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('ApplicationId') | Out-Null
    $ValuesToCheck.Remove('TenantId') | Out-Null
    $ValuesToCheck.Remove('CertificateThumbprint') | Out-Null
    $TestResult = Test-Microsoft365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck $ValuesToCheck.Keys

    Write-Verbose -Message "Test-TargetResource returned $TestResult"

    return $TestResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationId,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )
    $InformationPreference = 'Continue'
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-M365DSCTelemetryEvent -Data $data
    #endregion

    $ConnectionMode = New-M365DSCConnection -Platform 'AzureAD' `
        -InboundParameters $PSBoundParameters

    [array]$groups = Get-AzureADGroup -All:$true | Where-Object -FilterScript {$_.OnPremisesSyncEnabled -ne $True}

    $i = 1
    $content = ''
    foreach ($group in $groups)
    {
        Write-Information "    [$i/$($groups.Length)] $($group.DisplayName) - {$($group.ObjectID)}"
        try
        {
            [Array]$plans = Get-M365DSCPlannerPlansFromGroup -GroupId $group.ObjectId `
                                -ApplicationID $ApplicationID `
                                -GlobalAdminAccount $GlobalAdminAccount `
                                -ErrorAction 'SilentlyContinue'

            $j = 1
            foreach ($plan in $plans)
            {
                $params = @{
                    Title              = $plan.Title
                    PlanId             = $plan.Id
                    OwnerGroup         = $group.ObjectId
                    ApplicationId      = $ApplicationId
                    GlobalAdminAccount = $GlobalAdminAccount
                }
                Write-Information "        [$j/$($plans.Length)] $($plan.Title)"
                $result = Get-TargetResource @params
                $content += "        PlannerPlan " + (New-GUID).ToString() + "`r`n"
                $content += "        {`r`n"
                $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
                $content += $currentDSCBlock
                $content += "        }`r`n"
                $j++
            }
            $i++
        }
        catch
        {
            Write-Error $_
            Write-Verbose -Message $_
        }
    }
    return $content
}

function New-M365DSCPlannerPlan
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $Title,

        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupId,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationId
    )
    $uri = "https://graph.microsoft.com/v1.0/planner/plans"
    $body = [System.Text.StringBuilder]::new()
    $body.Append("{") | Out-Null
    $body.Append("`"owner`": `"$GroupId`",") | Out-Null
    $body.Append("`"title`": `"$Title`",") | Out-Null
    $body.Append("}") | Out-Null
    $taskResponse = Invoke-MSCloudLoginMicrosoftGraphAPI -CloudCredential $GlobalAdminAccount `
        -ApplicationId $ApplicationId `
        -Uri $uri `
        -Method "POST" `
        -Body $body.ToString()
}

function Get-M365DSCPlannerPlansFromGroup
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable[]])]
    Param(
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupId,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ApplicationId
    )
    $results = @()
    $uri = "https://graph.microsoft.com/v1.0/groups/$GroupId/planner/plans"
    $taskResponse = Invoke-MSCloudLoginMicrosoftGraphAPI -CloudCredential $GlobalAdminAccount `
        -ApplicationId $ApplicationId `
        -Uri $uri `
        -Method Get
    foreach ($plan in $taskResponse.value)
    {
        $results += @{
            Id    = $plan.id
            Title = $plan.title
        }
    }
    return $results
}

Export-ModuleMember -Function *-TargetResource
