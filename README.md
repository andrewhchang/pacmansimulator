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

5. Run unit tests with

    ```rspec```

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

## Test Data
Once in the simulator, the test suite can be run by entering the command:

```run test_suite```

The simulator will exit after the test suite has been run. The expected outputs can be found in `test_cases/expected_outputs.txt`.


***Acknowledgement of error:*** In my original submission, I made an error in calculating the grid size. The grid was instantiated to be of dimensions 5x5. Taking into account zero-based indexing, this would make the grid dimensions 6 units in length, not 5. I've amended my code and README as an acknowledgement of this change.
