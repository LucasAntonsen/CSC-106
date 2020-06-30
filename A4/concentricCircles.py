#By Lucas Antonsen
import turtle

tina = turtle.Turtle()
screen = turtle.Screen()
screen.bgcolor("white")
tina.shape("turtle")
tina.pencolor("blue")

SCALE = 20

# by prof. Celina Berg
# input: n
# output: a drawing of n concentric circles centered at 0,0
# this function is written using iteration (using a loop)
def concentric_loop(n):
    for size in range(1,n):
        tina.penup()
        tina.goto(0, -SCALE*size)
        tina.pendown()
        tina.circle(SCALE*size)
    
    tina.hideturtle()
    screen.exitonclick()

# input: n
# output: a drawing of n concentric circles centered at 0,0
# write concentric_recursive here...
def concentric_recursive(n):
    if n == 0:
        tina.hideturtle()
        screen.exitonclick()
    else:
        tina.penup()
        tina.goto(0, -SCALE*n)
        tina.pendown()
        tina.circle(SCALE*n)

        concentric_recursive(n-1)

# uncomment the following one at a time
# to see the output of the concentric_loop function:
#concentric_loop(0)
#concentric_loop(5)
#concentric_loop(10)


# uncomment the following one at a time
# to test your recursive function:
#concentric_recursive(0)
#concentric_recursive(5)
#concentric_recursive(10)

#screen.exitonclick()
# commented out because it was producing an error



