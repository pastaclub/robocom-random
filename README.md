# robocom-random

Random number generator for RoboCom - The Programming Game

robocom-random is a simple, predictable, deterministic Lehmer pseudo-random number generator based on the "minimum standard random number generator" algorithm by Stephen K. Park and Keith W. Miller. This package serves as a reference implementation for RoboCom interpreters, however it can be used in all kinds of projects.

## Installation

    npm install

## Building

    npm run build

## Test

    npm run test

## Usage

    # set the initial random seed
    seed = Math.floor(Math.random() * 16384)

    # create an instance of the random number generator
    Random = require('robocom-random')
    random = new Random(seed)

    # get new random number in range 0 <= number < 100
    number = random.int(100)

## Random in RoboCom

When a simulation is setup, the PRNG is invoked in the following order:

	for each program to be added to the simulation
	    $ID of program = randomInt(maxID - minID + 1) + minID
	    repeat
	        x = random.int(fieldsX)
	        y = random.int(fieldsY)
	    until field at x,y is free
	    direction = random.int(4)
