import turtle

# Create screen
screen = turtle.Screen()
screen.bgcolor("black")

# Create turtle
pen = turtle.Turtle()
pen.color("red")
pen.pensize(3)
pen.speed(2)

# Draw heart
pen.begin_fill()
pen.fillcolor("red")
pen.left(140)
pen.forward(180)
pen.circle(-90, 200)
pen.left(120)
pen.circle(-90, 200)
pen.forward(180)
pen.end_fill()

# Hide turtle
pen.hideturtle()

# Keep window open
turtle.done()
# Auto edit 1747733290
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733292
# Auto edit 1747733292
