# Apple-Pie
The game is a Guided Project from the *App Development With Swift* book. It is based on MVC design pattern. I have refactor the original code I wrote to use MVVM instead.

## Description 
Apple Pie is a word game similar to Hangman except instead of body parts, Apples represent the number of guesses remaining. The player guesses letters until they are able to reveal the word or run out of guesses.



## How To Play

The goal of the game is to reveal the word by guessing letters. Each time a letter is guessed, if it's in the word, the letter is revealed. If the letter is not in the word, the player looses an Apple from the tree. If all letters in the word are guessed before the tree looses all of it's apples, the player wins otherwise the player losses. The total number of wins and losses are recorded.
