[CmdletBinding(SupportsShouldProcess)]
param (
    [Parameter()]
    [ValidateScript({
        if (-not (Test-Path -LiteralPath $_ -PathType Container)) {
        throw "Directory doesn't exist: $_"
        }
        $true
    })]
	[string]$Path = ".",
    [Parameter()]
    [ValidateSet("User", "Machine", IgnoreCase = $true)]
	[string]$Scope = "User"
)

try {
    $Path = (Resolve-Path -LiteralPath $Path -ErrorAction Stop).Path

    $oldPath = [Environment]::GetEnvironmentVariable("Path", $Scope)

    $paths = @(
        $oldPath -split ';' |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )

    if ($paths -contains $Path) {
        Write-Host "Directory is already in PATH: $path" -ForegroundColor Yellow
        return
    }

    $newPath = (@($paths) + $Path) -join ';'

    if ($PSCmdlet.ShouldProcess("$Scope PATH", "Add $PATH")) {
        [Environment]::SetEnvironmentVariable(
            "Path",
            $newPath,
            $Scope
        )
    }

} catch {
    Write-Error "Failed to update PATH: $_"
}
