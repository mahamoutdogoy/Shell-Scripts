#!/bin/bash

suite=(Clubs Diamonds Hearts Spades)
cards=(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

num_suites=${#suite[*]}
num_cards=${#cards[*]}

echo -n "${cards[$((RANDOM%num_cards))]} of "
echo ${suite[$((RANDOM%num_suites))]}

