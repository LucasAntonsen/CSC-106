#--------------------------------
#
# Student Name: Lucas Antonsen
# Student Number:
# Assignment 3: Guess
#
# Date Created: Mar. 6/19
# Python Version: 3.7.1
#--------------------------------

import os
import sys
import random
import string

def guessing_game(computer_number):

    #bounds will indicate valid input for the user as well as hint how close/far they are from the answer
    lower_bound = 1
    upper_bound = 100
    guesses = 1

    print("Welcome to Guess the Number! Please enter a guess.")
    while True:
        
        question = str(lower_bound) + ' - ' + str(upper_bound) + ' (guess #' + str(guesses) + '): '
        guessed_number = input(question)

        #checks if input is an integer, and prints invalid entry in any case where input is not an integer. If input is invalid then input is requested again
        if guessed_number.isdigit():
            #turns string integer into an actual integer
            guessed_number = int(guessed_number);

            #ensures input is within the correct range. If input is invalid then input is requested again
            if guessed_number < lower_bound or guessed_number > upper_bound:
                print('Out of range')
                
            #low bound < comp number < guess
            elif computer_number < guessed_number:
                #takes the guess out of the range since it's not the correct answer
                upper_bound = guessed_number - 1
                guesses += 1
                
            #guess < comp number < upper bound
            elif guessed_number < computer_number:
                #takes the guess out of the range since it's not the correct answer
                lower_bound = guessed_number + 1
                guesses += 1
                
            #correct answer
            else:
                print('You are correct! The computer selected the number',computer_number,'!')
                break
     
        else:
            print('Invalid entry')

    #performance comments
    if guesses == 1:
        comment = 'Wow, you are a real savant at this game!'
    elif guesses <= 3:
        comment = 'Hey, that is pretty good!'
    else:
        comment = 'Practice makes perfect!'
        
    print('You guessed in', guesses, 'tries!!', comment,'\n')

    print('Play again?\n')
    main()


def main():
    #main entry point

    #choose an integer from 1 - 100 at random:
    computer_number = random.randint(1,101)

    #start the game!
    guessing_game(computer_number)


if __name__ == '__main__':
    main()
