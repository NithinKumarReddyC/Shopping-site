Add-Type -AssemblyName System.Drawing

function Create-BookGif {
    param(
        [string]$Path,
        [string]$Title,
        [string]$Author,
        [string]$Lang,
        [System.Drawing.Color]$BgColor1,
        [System.Drawing.Color]$BgColor2
    )

    $width = 400
    $height = 280
    $bmp = New-Object System.Drawing.Bitmap $width, $height
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    # Background gradient
    $rect = New-Object System.Drawing.Rectangle 0, 0, $width, $height
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush $rect, $BgColor1, $BgColor2, 45.0
    $g.FillRectangle($brush, $rect)
    $brush.Dispose()

    # Book shape (rectangle with spine)
    $bookBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(50, 255, 255, 255))
    $g.FillRectangle($bookBrush, 145, 20, 110, 145)
    $bookBrush.Dispose()

    # Spine line
    $spinePen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(80, 255, 255, 255)), 3
    $g.DrawLine($spinePen, 155, 20, 155, 165)
    $spinePen.Dispose()

    # Inner book decoration lines
    $lineBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(35, 255, 255, 255))
    $g.FillRectangle($lineBrush, 170, 50, 70, 3)
    $g.FillRectangle($lineBrush, 170, 60, 50, 3)
    $g.FillRectangle($lineBrush, 170, 70, 60, 3)
    $lineBrush.Dispose()

    $whiteBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = [System.Drawing.StringAlignment]::Center
    $sf.LineAlignment = [System.Drawing.StringAlignment]::Center

    # Dividing line
    $pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::FromArgb(60, 255, 255, 255)), 1
    $g.DrawLine($pen, 60, 185, 340, 185)
    $pen.Dispose()

    # Title
    $titleFont = New-Object System.Drawing.Font("Segoe UI", [float]14, [System.Drawing.FontStyle]::Bold)
    $titleRect = New-Object System.Drawing.RectangleF 20, 192, 360, 40
    $g.DrawString($Title, $titleFont, $whiteBrush, $titleRect, $sf)
    $titleFont.Dispose()

    # Author
    $authorFont = New-Object System.Drawing.Font("Segoe UI", [float]10, [System.Drawing.FontStyle]::Italic)
    $subBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(220, 255, 255, 255))
    $g.DrawString($Author, $authorFont, $subBrush, 200, 237, $sf)
    $authorFont.Dispose()

    # Language badge
    $langFont = New-Object System.Drawing.Font("Segoe UI", [float]9, [System.Drawing.FontStyle]::Bold)
    $langBrush = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::FromArgb(180, 255, 255, 255))
    $g.DrawString($Lang, $langFont, $langBrush, 200, 258, $sf)
    $langFont.Dispose()
    $langBrush.Dispose()

    $subBrush.Dispose()
    $sf.Dispose()
    $whiteBrush.Dispose()

    # Save as GIF
    $bmp.Save($Path, [System.Drawing.Imaging.ImageFormat]::Gif)
    $g.Dispose()
    $bmp.Dispose()
    Write-Output "Created: $Path"
}

$dir = "Shopping-site\src\main\webapp\images"
Create-BookGif "$dir\book-alchemist.gif" "The Alchemist" "Paulo Coelho" "English | Fiction" ([System.Drawing.Color]::FromArgb(180, 83, 9)) ([System.Drawing.Color]::FromArgb(217, 119, 6))
Create-BookGif "$dir\book-atomic-habits.gif" "Atomic Habits" "James Clear" "English | Self-Help" ([System.Drawing.Color]::FromArgb(21, 128, 61)) ([System.Drawing.Color]::FromArgb(22, 163, 74))
Create-BookGif "$dir\book-gone-girl.gif" "Gone Girl" "Gillian Flynn" "English | Psycho-Thriller" ([System.Drawing.Color]::FromArgb(127, 29, 29)) ([System.Drawing.Color]::FromArgb(185, 28, 28))
Create-BookGif "$dir\book-into-the-wild.gif" "Into the Wild" "Jon Krakauer" "English | Adventure" ([System.Drawing.Color]::FromArgb(5, 102, 141)) ([System.Drawing.Color]::FromArgb(14, 165, 233))
Create-BookGif "$dir\book-girl-on-train.gif" "The Girl on the Train" "Paula Hawkins" "English | Thriller" ([System.Drawing.Color]::FromArgb(88, 28, 135)) ([System.Drawing.Color]::FromArgb(126, 34, 206))
Create-BookGif "$dir\book-malgudi-days.gif" "Malgudi Days" "R.K. Narayan" "English | Indian Classic" ([System.Drawing.Color]::FromArgb(161, 98, 7)) ([System.Drawing.Color]::FromArgb(202, 138, 4))
Create-BookGif "$dir\book-kannada-prabha.gif" "Kannada Prabha" "Kuvempu" "Kannada | Literature" ([System.Drawing.Color]::FromArgb(190, 18, 60)) ([System.Drawing.Color]::FromArgb(225, 29, 72))
Create-BookGif "$dir\book-mookajjiya.gif" "Mookajjiya Kanasugalu" "K. Shivaram Karanth" "Kannada | Classic Fiction" ([System.Drawing.Color]::FromArgb(67, 56, 202)) ([System.Drawing.Color]::FromArgb(99, 102, 241))
Create-BookGif "$dir\book-veyi-padagalu.gif" "Veyi Padagalu" "Viswanatha Satyanarayana" "Telugu | Epic Novel" ([System.Drawing.Color]::FromArgb(101, 74, 56)) ([System.Drawing.Color]::FromArgb(160, 110, 70))
Create-BookGif "$dir\book-barrister.gif" "Barrister Parvateesam" "Mokkapati" "Telugu | Comedy" ([System.Drawing.Color]::FromArgb(234, 88, 12)) ([System.Drawing.Color]::FromArgb(249, 115, 22))
Create-BookGif "$dir\book-godan.gif" "Godan" "Munshi Premchand" "Hindi | Classic" ([System.Drawing.Color]::FromArgb(15, 118, 110)) ([System.Drawing.Color]::FromArgb(20, 184, 166))
Create-BookGif "$dir\book-jurassic-park.gif" "Jurassic Park" "Michael Crichton" "English | Sci-Fi Adventure" ([System.Drawing.Color]::FromArgb(22, 101, 52)) ([System.Drawing.Color]::FromArgb(34, 197, 94))
