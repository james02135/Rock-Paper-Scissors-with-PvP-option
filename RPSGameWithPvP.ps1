Clear-Host

$NewCompGame = "True" #This variable controls the game if vs computer
$NewPlayGame = "True" #This variable controls the game is vs another player
$GameChoice = "" #This is a placeholder for the users game choice
$UserReply = 0 #This is a placeholder for the user's turn
$UserChoice = "" #This variable will hold the letter choice of the user
$RanNum = 0 #This variable will be used to generate a random number for the computer's choice
$CompChoice = "" #This variable will be the converted integer to a letter representing the computer's choice
$AmountPlayed = 0 #Keeps track of how many games the user has played during the session
$Wins = 0 #Keeps track of the User's wins
$Losses = 0 #Keeps track of the User's losses
$Ties = 0 #Keeps track of the User's ties
$Player1Name = "" #This variable will hold Player 1 name
$Player2Name = "" #This variable will hold Player 2 name
$Player1Reply = 0 #This is a placeholder for Player 1 choice
$Player2Reply = 0 #This is a placeholder for Player 2 choice
$Player1Choice = 0 #This holds the value for Player 1 choice
$Player2Choice = 0 #This holds the value for Player 2 choice
$Player1Wins = 0 #Keeps track of Player 1 wins
$Player1Losses = 0 #Keeps track of Player 1 losses
$Player1Ties = 0 #Keeps track of Player 1 ties
$Player2Wins = 0 #Keeps track of Player 2 wins
$Player2Losses = 0 #Keeps track of Player 2 losses
$Player2Ties = 0 #Keeps track of Player 2 ties

Write-Host "     Welcome to the"
Write-Host "Rock, Paper, Scissors Game!" 
Write-Host "                          "
Write-Host "Press Enter to Continue"
 
Read-Host

Clear-Host

Write-Host "If you would like to play against the computer"
Write-Host "press C"
Write-Host "Or, if you would like to play against another player"
Write-Host "press P"

$GameChoice = Read-Host

if(($GameChoice -eq "C") -or ($GameChoice -eq "c")) { 

  while($NewCompGame -ne "False") {

    $RanNum = Get-Random -Minimum 1 -Maximum 4 #Generate a new number between 1 and 3
      if ($RanNum -eq 1) {
      $CompChoice = "Rock"
      }
      if ($RanNum -eq 2) {
      $CompChoice = "Paper"
      }
      if ($RanNum -eq 3) {
      $CompChoice = "Scissors"
      }
    
    While ($UserReply -eq "") {

    Clear-Host

    Write-Host "Enter one of the following options"
    Write-Host "-----------------------------------"
    Write-Host "                                   "
    Write-Host "R is for Rock"
    Write-Host "P is for Paper"
    Write-Host "S is for Scissors"  
    Write-Host "Q is for Quit"
    Write-Host "                                   "
    Write-Host "-----------------------------------"

    $UserReply = Read-Host "Make a move"
    }

    if(($UserReply -eq "Q") -and ($UserReply -eq "q")) {
    Clear-Host
    Write-Host "                                                       "
    Write-Host "Game over. Thanks for playing Rock, Paper Scissors."
    Write-Host "                                                       "
    Write-Host "Press enter to view game statistics and quit the game."
    Read-Host

    Clear-Host

    Write-Host "Game Statistics"
    Write-Host "------------------------------"
    Write-Host "Number of games played: $AmountPlayed"
    Write-Host "Number of games won: $Wins"
    Write-Host "Number of games lost: $Losses"
    Write-Host "Number of games tied: $Ties"
    Write-Host " ------------------------------"
    Write-Host "Press Enter to continue."

    Read-Host

    $NewCompGame = "False"
    continue
    }

    if(($UserReply -ne "R") -and ($UserReply -ne "P") -and ($UserReply -ne "S") -and ($UserReply -ne "D")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $UserReply = ""
      continue
    }

    if(($UserReply -ne "r") -and ($UserReply -ne "p") -and ($UserReply -ne "s") -and ($UserReply -ne "d")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $UserReply = ""
      continue
    }


    if (($UserReply -eq "R") -or ($UserReply -eq "r")) {
    $UserChoice = "Rock"
    }
    if (($UserReply -eq "P") -or ($UserReply -eq "p")){
    $UserChoice = "Paper"
    }
    if (($UserReply -eq "S") -or ($UserReply -eq "s")){
    $UserChoice = "Scissors"
    }
    if (($UserReply -eq "D") -or ($UserReply -eq "d")){
    $UserChoice = "Dynamite"
    }

    Clear-Host

    Write-Host "Results:"
    Write-Host "-----------------------------------"
    Write-Host "                                   "
    Write-Host "The computer picked: $CompChoice"
    Write-Host "You picked: $UserChoice"
    Write-Host "                                   "
    Write-Host "-----------------------------------"

    $AmountPlayed += 1

    Switch ($CompChoice) {

      "Rock" {
        if ($UserChoice -eq "Rock") {
          $Ties += 1
          Write-Host "Tie!"
        }
        if ($UserChoice -eq "Paper") {
          $Wins += 1
          Write-Host "You Win!"
        }
        if ($UserChoice -eq "Scissors") {
          $Losses += 1
          Write-Host "Computer Wins!"
        }
        if ($UserChoice -eq "Dynamite") {
          $Wins += 1
          Write-Host "You always win with DYNAMITE!!!"
        }
      }

      "Paper" {
        if ($UserChoice -eq "Paper") {
          $Ties += 1
          Write-Host "Tie!"
        }
        if ($UserChoice -eq "Rock") {
          $Losses += 1
          Write-Host "Computer Wins!"
        }
        if ($UserChoice -eq "Scissors") {
          $Wins += 1
          Write-Host "You Win!"
        }
        if ($UserChoice -eq "Dynamite") {
          $Wins += 1
          Write-Host "You always win with DYNAMITE!!!"
        }
      }

      "Scissors" {
        if ($UserChoice -eq "Scissors") {
          $Ties += 1
          Write-Host "Tie!"
        }
        if ($UserChoice -eq "Rock") {
          $Wins += 1
          Write-Host "You Win!"
        }
        if($UserChoice -eq "Paper") {
          $Losses += 1
          Write-Host "Computer Wins!"
        }
        if ($UserChoice -eq "Dynamite") {
          $Wins += 1
          Write-Host "You always win with DYNAMITE!!!"
        }
      }
    }

    Read-Host

    $UserReply = 0 #Reset all variables
    $UserChoice = "" 
    $RanNum = 0 
    $CompChoice = ""

    Clear-Host

  }
}

if(($GameChoice -eq "P") -or ($GameChoice -eq "p")) {

  while($NewPlayGame -ne "False") {

    While ($Player1Name -eq "") {

      Clear-Host
  
      Write-Host "Enter Player 1 Name"
  
      $Player1Name = Read-Host 
    }

    While ($Player2Name -eq "") {

      Clear-Host
  
      Write-Host "Enter Player 2 Name"
  
      $Player2Name = Read-Host 
    }

    While ($Player1Reply -eq "") {

      Clear-Host
  
      Write-Host "$Player1Name enter one of the following options"
      Write-Host "-----------------------------------"
      Write-Host "                                   "
      Write-Host "R is for Rock"
      Write-Host "P is for Paper"
      Write-Host "S is for Scissors"  
      Write-Host "Q is for Quit"
      Write-Host "                                   "
      Write-Host "-----------------------------------"
  
      $Player1Reply = Read-Host "Make a move"

      if($Player1Reply -eq "Q") {
        Clear-Host
        Write-Host "                                                       "
        Write-Host "Game over. Thanks for playing Rock, Paper Scissors."
        Write-Host "                                                       "
        Write-Host "Press enter to view game statistics and quit the game."
        Read-Host
    
        Clear-Host
    
        Write-Host "Game Statistics"
        Write-Host "------------------------------"
        Write-Host "Number of games played: $AmountPlayed"
        Write-Host "------------------------------"
        Write-Host "$Player1Name Statistics"
        Write-Host "------------------------------"
        Write-Host "Number of games won: $Player1Wins"
        Write-Host "Number of games lost: $Player1Losses"
        Write-Host "Number of games tied: $Player1Ties"
        Write-Host "------------------------------"
        Write-Host "$Player2Name Statistics"
        Write-Host "Number of games won: $Player2Wins"
        Write-Host "Number of games lost: $Player2Losses"
        Write-Host "Number of games tied: $Player2Ties"
        Write-Host " ------------------------------"
        Write-Host "Press Enter to continue."
    
        Read-Host
    
        $NewPlayGame = "False"
        continue
      }
    }

    While ($Player2Reply -eq "") {

      Clear-Host
  
      Write-Host "$Player2Name enter one of the following options"
      Write-Host "-----------------------------------"
      Write-Host "                                   "
      Write-Host "R is for Rock"
      Write-Host "P is for Paper"
      Write-Host "S is for Scissors"  
      Write-Host "Q is for Quit"
      Write-Host "                                   "
      Write-Host "-----------------------------------"
  
      $Player2Reply = Read-Host "Make a move"
    }

    if(($Player1Reply -ne "R") -and ($Player1Reply -ne "P") -and ($Player1Reply -ne "S") -and ($Player1Reply -ne "D")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $Player1Reply = ""
      continue
    }

    if(($Player1Reply -ne "r") -and ($Player1Reply -ne "p") -and ($Player1Reply -ne "s") -and ($Player1Reply -ne "d")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $Player1Reply = ""
      continue
    }

    if(($Player2Reply -ne "R") -and ($Player2Reply -ne "P") -and ($Player2Reply -ne "S") -and ($Player2Reply -ne "D")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $Player1Reply = ""
      continue
    }

    if(($Player2Reply -ne "r") -and ($Player2Reply -ne "p") -and ($Player2Reply -ne "s") -and ($Player2Reply -ne "d")) {
      Clear-Host
      Write-Host "Invalid input. Please try again."
      Read-Host
      $Player1Reply = ""
      continue
    }

    if (($Player1Reply -eq "R") -or ($Player1Reply -eq "r")) {
      $Player1Choice = "Rock"
      }
    if (($Player1Reply -eq "P") -or ($Player1Reply -eq "p")){
        $Player1Choice = "Paper"
      }
    if (($Player1Reply -eq "S") -or ($Player1Reply -eq "s")){
        $Player1Choice = "Scissors"
      }
    if (($Player1Reply -eq "D") -or ($Player1Reply -eq "d")){
        $Player1Choice = "Dynamite"
      }

    if (($Player2Reply -eq "R") -or ($Player2Reply -eq "r")) {
      $Player2Choice = "Rock"
      }
    if (($Player2Reply -eq "P") -or ($Player2Reply -eq "p")){
        $Player2Choice = "Paper"
      }
    if (($Player2Reply -eq "S") -or ($Player2Reply -eq "s")){
        $Player2Choice = "Scissors"
      }
    if (($Player2Reply -eq "D") -or ($Player2Reply -eq "d")){
        $Player2Choice = "Dynamite"
      }

    Clear-Host

    Write-Host "-----------------------------------"
    Write-Host "                                   "
    Write-Host "$Player1Name picked: $Player1Choice"
    Write-Host "                                   "
    Write-Host "$Player2Name picked: $Player2Choice"
    Write-Host "                                   "
    Write-Host "-----------------------------------"

    $AmountPlayed += 1

    Switch ($Player1Choice) {

      "Rock" {
        if ($Player2Choice -eq "Rock") {
          $Player1Ties += 1
          $Player2Ties += 1
          Write-Host "           "  
          Write-Host "It's a Tie!"
          Write-Host "            "
          Write-Host "Press Enter to Continue"
          Read-Host
        }

        if ($Player2Choice -eq "Paper") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Write-Host "                  "
          Write-Host "Press Enter to Continue"
          Read-Host
        }

        if ($Player2Choice -eq "Scissors") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Write-Host "                  "
          Write-Host "Press Enter to Continue"
          Read-Host
        }

        if ($Player2Choice -eq "Dynamite") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Write-Host "                  "
          Read-Host
        }
      }

      "Paper" {
        if ($Player2Choice -eq "Rock") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Read-Host
        }

        if ($Player2Choice -eq "Paper") {
          $Player1Ties += 1
          $Player2Ties += 1
          Write-Host "                  "
          Write-Host "It's a Tie!"
          Write-Host "                  "
          Read-Host
        }

        if ($Player2Choice -eq "Scissors") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Read-Host
        }

        if ($Player2Choice -eq "Dynamite") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Read-Host
        }
      }

      "Scissors" {
        if ($Player2Choice -eq "Rock") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Read-Host
        }

        if ($Player2Choice -eq "Paper") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Read-Host
        }

        if ($Player2Choice -eq "Scissors") {
          $Player1Ties += 1
          $Player2Ties += 1
          Write-Host "                  "
          Write-Host "It's a Tie!"
          Read-Host
        }

        if ($Player2Choice -eq "Dynamite") {
          $Player1Losses += 1
          $Player2Wins += 1
          Write-Host "                  "
          Write-Host "$Player1Name Lost!"
          Write-Host "                  "
          Write-Host "$Player2Name Won!"
          Read-Host
        }
      }

      "Dynamite" {
        if ($Player2Choice -eq "Rock") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Read-Host
        }

        if ($Player2Choice -eq "Paper") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Read-Host
        }

        if ($Player2Choice -eq "Scissors") {
          $Player1Wins += 1
          $Player2Losses += 1
          Write-Host "                  "
          Write-Host "$Player1Name Won!"
          Write-Host "                  "
          Write-Host "$Player2Name Lost!"
          Red-Host
        }

        if ($Player2Choice -eq "Dynamite") {
          $Player1Ties += 1
          $Player2Ties += 1
          Write-Host "                  "
          Write-Host "It's a Tie!"
          Read-Host
        }
      }
    }

    $Player1Reply = 0 #Reset all variables
    $Player2Reply = 0 #Reset all variables
    $Player1Choice = "" #Reset all variables
    $Player2Choice = "" #Reset all variables

  }
}

    























