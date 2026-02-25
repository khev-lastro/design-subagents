$content = Get-Content 'C:\Users\khevi\.claude\projects\C--Users-khevi-Claude-Projects-design-subagents\4f275f0c-fe18-4859-a312-4b5c2307abf2\tool-results\mcp-plugin_figma_figma-desktop-get_design_context-1771994468436.txt' -Raw
$data = $content | ConvertFrom-Json
$count = $data.Count
Write-Output "Items: $count"
$item0type = $data[0].type
$item0len = $data[0].text.Length
Write-Output "Item 0 type=$item0type len=$item0len"
Write-Output $data[0].text.Substring(0, 800)
Write-Output "=== ITEM 1 ==="
$item1type = $data[1].type
$item1len = $data[1].text.Length
Write-Output "Item 1 type=$item1type len=$item1len"
Write-Output $data[1].text.Substring(0, 3000)
