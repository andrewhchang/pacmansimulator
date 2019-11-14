# Pacman Simulator

## Description
A command-line based pacman simulator written in Ruby v2.3+.

## Instructions
This project requires Ruby and bundler to be installed.
This has only been tested on Ruby 2.3, to check your version of Ruby, run:

`ruby -v`

Once you have Ruby 2.3+ installed, clone repo with the following:

**SSH**

`git clone git@github.com:andrewhchang/pacmansimulator.git`

**HTTPS**

`git clone https://github.com/andrewhchang/pacmansimulator.git`

## To run (some might require sudo):


1. Navigate into the directory with

    ```cd pacmansimulator```

2. Install bundler if not already installed, with

    ```gem install bundler```

3. Install gems with

    ```bundle install```

4. Run the program with

    ```ruby pacmansimulator.rb```

<<<<<<< HEAD
5. Run unit tests with

    ```rspec``
=======
**Run unit tests with** `rspec`
>>>>>>> 4b09aae... Update README.md

## Usage
There are 6 commands in total available.
- `PLACE X,Y,F(NORTH|SOUTH|EAST|WEST)` places the Pacman on the Grid, facing a direction.
```
# Example
PLACE 2,3,WEST

This will place the Pacman at x-coordinate 2, y-coordinate 3, facing WEST.
```
- `MOVE` will move the Pacman forward 1 unit on the table.
- `LEFT` will rotate the Pacman 90 degrees to face the direction on its left.
- `RIGHT` will rotate the Pacman 90 degrees to face the direction on its right.
- `REPORT` will return the Pacman's position in the format `X,Y,F`.
- `EXIT` will terminate the program.
