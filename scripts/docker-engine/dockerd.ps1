[reflection.assembly]::LoadWithPartialName('System.Windows.Forms')
$MsgBox = [System.Windows.Forms.MessageBox]
$Dockerd = Get-Service Docker

$Dockerd
If ($Dockerd.Status -match "Running") {
    $isStop = $MsgBox::Show(
        "Docker Engine����������,�Ƿ�Ҫֹͣ?",
        "Dockerd",
        [System.Windows.Forms.MessageBoxButtons]::OKCancel,
        [System.Windows.Forms.MessageBoxIcon]::None)

    If ($isStop -eq [System.Windows.Forms.DialogResult]::OK) {
        Stop-Service Docker
        Write-Output "Docker Engine��ֹͣ"
    }
}
Else {
    Start-Service Docker
    Write-Output "Docker Engine������"
}