$content = Get-Content 'C:\Users\khevi\.claude\projects\C--Users-khevi-Claude-Projects-design-subagents\4f275f0c-fe18-4859-a312-4b5c2307abf2\tool-results\mcp-plugin_figma_figma-desktop-get_design_context-1771994468436.txt' -Raw
$data = $content | ConvertFrom-Json
$text = $data[0].text

# Find notification-related frames with their IDs
$targets = @('whatsnew-popup', 'whatsnew-drawer', 'whatsnew / dialog', 'notification', 'tooltip-newfeature', 'tooltip-newfeature-skippable', 'header-noticia', 'menu-direita-cima', 'Novidades', 'tag-novo', 'whats-new')

foreach ($target in $targets) {
    $escaped = [regex]::Escape($target)
    $match = [regex]::Match($text, "id=""([^""]+)""\s+name=""$escaped""")
    if ($match.Success) {
        Write-Output "FOUND: name='$target' id='$($match.Groups[1].Value)'"
    } else {
        Write-Output "NOT FOUND: $target"
    }
}

# Also search for top-level frames (direct children of section)
Write-Output ""
Write-Output "=== TOP-LEVEL FRAME IDS ==="
$sectionContent = [regex]::Match($text, '<section[^>]+>([\s\S]*)')
if ($sectionContent.Success) {
    $inner = $sectionContent.Groups[1].Value
    # Get direct child frames
    $frames = [regex]::Matches($inner, '<frame id="([^"]+)"\s+name="([^"]+)"')
    foreach ($f in $frames) {
        Write-Output "Frame id=$($f.Groups[1].Value) name=$($f.Groups[2].Value)"
    }
}
