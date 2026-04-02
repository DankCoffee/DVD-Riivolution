# Patch banner_tmd.dat title ID from RIIV to DVDR
$data = [System.IO.File]::ReadAllBytes('banner_tmd.dat')

# Title ID at offset 0x184 (big-endian)
# RIIV: 0x0000000152494956
# DVDR: 0x0000000144564452
$data[0x184] = 0x00
$data[0x185] = 0x00
$data[0x186] = 0x00
$data[0x187] = 0x01
$data[0x188] = 0x44  # D
$data[0x189] = 0x56  # V
$data[0x18A] = 0x44  # D
$data[0x18B] = 0x52  # R

[System.IO.File]::WriteAllBytes('banner_tmd.dat', $data)
Write-Host "Patched banner_tmd.dat title ID to DVDR (0x44564452)"
