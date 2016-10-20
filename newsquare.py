import random
import csv

squares = {}

#same basic idea as previous walk definitions, just now with variable boundaries between 1 and 50
#plug in powers of 2 to get get points for second graph that shows limit of efficiency

for i in range(1,51):
	for j in range(1,51):

		def dumbwalk(north, east):
			# set timer
			time=0

			# walks north until nothern boundary is reached, confronts stoplight (flip) before each block
			while north < i:
				flip = random.randint(0,1)
				if flip == 1:
					time += 1
				north += 1
				time += 1

			# then walks east until finish line, confronts stoplight (flip) before each block
			while east < j:
				flip = random.randint(0,1)
				if flip == 1:
					time += 1
				east += 1
				time += 1


			return time


		def smartwalk(north, east):
			# set timer
			time = 0

			# begins walk facing north
			direction = "north"
			
			# iterates until finish line achieved 
			while north < i or east < j:
				# walk approximates dumbwalk on either border
				if north == i:
					flip = random.randint(0,1)
					if flip == 1:
						time += 1
					east += 1
					time += 1
				
				elif east == j:
					flip=random.randint(0,1)
					if flip == 1:
						time += 1
					north += 1
					time += 1
					
				# otherwise walker will continue in direction if given greenlight and pivot for reds
				else:
					if direction == "north":
						flip = random.randint(0,1)
						if flip == 1:
							direction = "east"
							east += 1
							time += 1
						else:
							north += 1
							time += 1
					
					elif direction == "east":
						flip = random.randint(0,1)
						if flip == 1:
							direction = "north"
							north += 1
							time += 1
						else:
							east += 1
							time += 1

			return time

		dumb = 0
		smart = 0

		#thousand simulations for each
		for k in range(1000):
			dumb += dumbwalk (0,0)
			smart += smartwalk(0,0)


		#average dumb and smart walk recorded for each grid size, plus efficiency
		squares[i,j] = [dumb/float(1000), smart/float(1000), 1-smart/float(dumb)]

		print i, j


writer = csv.writer(open('allgrids.csv', 'wb'))
for key, value in squares.items():
	writer.writerow([key, value])







