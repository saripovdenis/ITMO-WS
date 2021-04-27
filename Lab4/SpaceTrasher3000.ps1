$name = 0
try {
    while($true) {
        $name ++
        $objFile = [io.file]::Create("Z:\$name.txt")
        $objFile.SetLength(1mb)
        $objFile.Close()
    }
} catch {
    $objFile.Close()
    Write-Error "Disk is full"
}
