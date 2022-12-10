# 🎰 SLOT MACHINE
> This program is one of the requirements for fulfilling assignments in the Digital Systems Design practicum, Department of Computer Engineering, University of Indonesia
---
## About
This slot machine program is a program that implements VHDL language and made by group B10 which consists of : 

- Rezki Muhammad - 2106731516
- Muhammad Suhaili - 2106731535
- Mikhael Morris Hapataran Siallagan - 2106731491
- Nevanda Fairuz Pahlevi - 2106731541
---
## Description
This slot machine program consists of 3 reels, each of which has 7 numbers. When played, the reels will generate random numbers that will be displayed. When the numbers are generated and displayed, the program will display a text message corresponding to the results obtained. Players can continue to play the slot machine until the coins they have run out.

---
## Features
- Top Up and Balance service

This program has a feature that allows players to top up at a price of 1000 per coin before playing a slot machine. Then from the coins obtained, players can use the slot machine with 1 coin per 1 play. If the coins they have run out, a message will appear indicating that the player has finished playing the slot machine and could use whether they want to top up and play the slot machine again.

- Report message based on the player's profit

When a coin is inserted and the numbers come out, the program will issue a text message displaying the profit the player has gotten.

---
## Winning Mechanism
Each reels will generate a number from a range 1 to 7. As for the higher the number, the value will be even greater which will affects the profit that players get. 

> Profits that the player will get is  500 * multiplier.

If the number that appears 2 times is : 

- 1, 2 atau 3 : multiplier is equal to 1
- 4 atau 5    : multiplier is equal to 2
- 6 : multiplier is equal to 3
- 7 : multiplier is equal to 4

If the number that appears 3 times is : 
- 1 atau 2 : multiplier is equal to 2
- 3 atau 4 : multiplier is equal to 3
- 5 : multiplier is equal to 4
- 6 : multiplier is equal to 10
- 7 : multiplier is equal to 100

---
## State Diagram
![statediagram](https://user-images.githubusercontent.com/88538229/206861582-0e355f1c-9190-414b-b611-d4ab1b335801.jpg)

---
## Function Snippets
```function rand(seed1, seed2 : positive) return std_logic_vector;```
> Randomize the numbers that will be used for each reel

```function checking(sym1, sym2, sym3 : std_logic_vector(2 downto 0)) return integer;```
> Checks whether there are numbers that appears twice or thrice on the reels after the player plays the slot

```function conclusion(checker : integer) return positive;```
> Performs calculations of the player's profit based on the value that returned by the checking function and displays messages related to the player's profit.

---
