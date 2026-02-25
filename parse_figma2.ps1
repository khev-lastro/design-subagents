$content = Get-Content 'C:\Users\khevi\.claude\projects\C--Users-khevi-Claude-Projects-design-subagents\4f275f0c-fe18-4859-a312-4b5c2307abf2\tool-results\mcp-plugin_figma_figma-desktop-get_design_context-1771994468436.txt' -Raw
$data = $content | ConvertFrom-Json

# Get item 1 (small) fully
Write-Output "=== ITEM 1 FULL ==="
Write-Output $data[1].text

# Get item 0 - extract frame names to understand what notification types exist
Write-Output "=== ITEM 0 - FRAME NAMES ==="
$text = $data[0].text

# Find all name= attributes to understand structure
$matches = [regex]::Matches($text, 'name="([^"]+)"')
$names = $matches | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
Write-Output ($names -join "`n")
