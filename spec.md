# Game Specification

## Game Title
Dodge the Mobs

## Genre
2D Arcade / Survival

## Overview
The game is a 2D arcade survival game where the player controls a character that must avoid randomly spawning enemies (mobs). The objective is to survive for as long as possible while the score increases over time.

## Core Mechanics
- Player movement using keyboard input
- Enemies spawn at random positions and move across the screen
- Collision between the player and enemies ends the game
- Score increases over time while the player survives
- Game can be restarted after game over

## Player
- Controlled using keyboard input
- Can move freely within the screen bounds
- Colliding with an enemy triggers a game over

## Enemies (Mobs)
- Spawn at random intervals and locations
- Move in random directions
- Automatically removed when leaving the screen

## User Interface
- Heads-up display (HUD) shows the current score
- Start button to begin the game
- Game over message displayed on player collision

## Game Flow
1. Player starts the game using the start button
2. Enemies spawn continuously
3. Score increases over time
4. Game ends when the player is hit by an enemy
5. Player can restart the game

## Purpose
The project demonstrates:
- Basic player movement
- Enemy spawning and simple AI motion
- Collision detection
- UI and game state management
- Score tracking over time
