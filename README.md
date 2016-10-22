# Toy Robot Simulator

## Running app

ruby simulator.run

## Sample files

ruby simulator.run -f test/samples/route_1.txt

ruby simulator.run -f test/samples/route_2.txt

ruby simulator.run -f test/samples/route_3.txt

ruby simulator.run -f test/samples/route_4.txt

## Commands

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

## Constraints

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```


```
# Example c
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
# Output: 3,3,NORTH
```

## Acknowledgement

The Toy Robot Challenge was originally formulated by [Jon Eaves](https://twitter.com/joneaves)
