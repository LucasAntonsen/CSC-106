#By Lucas Antonsen
import math
import turtle

tina = turtle.Turtle()
tina.hideturtle()
tina.pencolor("black")
screen = turtle.Screen()
screen.bgcolor("white")

CUTOFF = 25

# by prof. Celina Berg
# input: sz, x, y
# output: draws an equalateral triangle with side length sz,
#   and bottom left corner at screen coordinates (x,y)
def triangle(sz, x, y):
    tina.penup()
    tina.goto(x,y)
    tina.pendown()
    for n in range(3):
        tina.forward(sz)
        tina.left(120)

# by prof. Celina Berg
# input: sz, x, y
# ouput: draws a serpinski triangle with side length sz,
#  with bottom left corner at screen coordinates (x,y) and
#  smallest triangle drawn when sz<=CUTOFF
def stri(sz, x, y):
  if sz <= CUTOFF:
    triangle(sz, x, y)

  else:
    triangle(sz, x, y)
    triangle_ht = math.sqrt(math.pow(sz,2) - math.pow(sz/2,2))
    nextsz = (sz)/2
    stri(nextsz, x, y)                              #bottom left triangle
    stri(nextsz, x + nextsz, y)                     #bottom right triangle
    stri(nextsz, x + nextsz/2, y + (triangle_ht/2)) #top triangle

# input: sz, x, y
# output: draws a square with side length sz,
#  bottom left corner at screen coordinates (x,y)
def square(sz, x, y):
    tina.penup()
    tina.goto(x,y)
    tina.pendown()
    for n in range(4):
        tina.forward(sz)
        tina.left(90)

# input: sz, x, y
# output: draws a serpinski carpet with side length sz,
#  bottom left corner at screen coordinates (x,y) and
#  smallest square drawn when sz<=CUTOFF
# write scarpet here...
def scarpet(sz, x, y):
    if sz <= CUTOFF:
        square(sz, x, y)
    
    else:
        square(sz, x, y)
        nextsz = (sz)/3
        scarpet(nextsz, x, y)                       #bottom left square
        scarpet(nextsz, x + nextsz, y)              #bottom middle square
        scarpet(nextsz, x + 2*nextsz, y)            #bottom right square
        scarpet(nextsz, x, y + nextsz)              #middle left square
        scarpet(nextsz, x + 2*nextsz, y + nextsz)   #middle right square
        scarpet(nextsz, x, y + 2*nextsz)            #top left square
        scarpet(nextsz, x + nextsz, y + 2*nextsz)   #top middle square
        scarpet(nextsz, x + 2*nextsz, y + 2*nextsz) #top right square




# uncomment the following, one at a time
# to see the output of the stri function:
#stri(24, 0, 0)
#stri(50, 0, 0)
#stri(100, 0, 0)
#stri(150, 0, 0)

# uncomment the following, one at a time
# to test your scarpet function:
#scarpet(24, 0, 0)
#scarpet(75, 0, 0)
scarpet(100, 0, 0)
#scarpet(400, -200, -200)

# if you want to see a more detail Serpinski carpet or triangle
# you can change the value of CUTOFF to a smaller number
# This can take hours to run if your CUTOFF is very small!

screen.exitonclick()

