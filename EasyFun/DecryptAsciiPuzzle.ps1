$ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop
Set-StrictMode -Version latest

[System.String]$encryptedString = "106 113 108 119 104 104 80 35 105 82 35 104 107 87 35 118 103 113 108 80"

function Decrypt-String
{
    param (
        [System.String]$inputString
    )

    [System.Array]$decrypted = @()

    #Caesar Cipher: Shift down by 3
    [System.String]$shiftedEncryptedString = $encryptedString -split ' ' | ForEach-Object { [int]$_ - 3 }

    #Convert ASCII numbers to values
    [System.String]$letterString = -join ($shiftedEncryptedString -split ' ' | ForEach-Object { [char][int]$_ })

    #Split on spaces
    [System.Array]$words = $letterString -split ' '

    #Unflip each word
    foreach ($word in $words)
    {
        [System.String]$unflipped = -join ($word)[($word.Length - 1)..0]

        $decrypted += $unflipped
    }

    return $decrypted -join ' '
}

[System.String]$decrypted = Decrypt-String $encryptedString
Write-Host $decrypted