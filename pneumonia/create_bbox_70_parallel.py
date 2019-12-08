import glob
from PIL import Image
import numpy as np
import os
import sys

traditional_path = 'images/train/'
segmentation_path = ['images/only_masks/double_box/']
output_path = ['images/bbox70/double_box/']

try:
	concurrency = int(sys.argv[1])
	section_number = int(sys.argv[2])
except Exception:
	concurrency = 1
	section_number = 0
###  Note that both traditional and segmentation images are resized to be 299x299. ###

for output in output_path:
	if not os.path.exists(output):
		os.makedirs(output)

for k in range(1):
	dir_list = glob.glob(segmentation_path[k] + '*.png')
	dir_list.sort()

	section_len = int(len(dir_list) / concurrency)
	section_start = section_number * section_len
	if section_number == concurrency - 1:
		section_end = len(dir_list)
	else:
		section_end = (section_number + 1) * section_len
	dir_list = dir_list[section_start:section_end]

	for file in dir_list:
		name = file.split('/')[-1]
		image = Image.open(file).convert('L')
		image_np = np.array(image)
		print(name)
		print('segmentation')
		print(image_np.shape)
		print(image_np.max())
		print(image_np.min())

		top = 100000
		bottom = 0
		left = 100000
		right = 0
		# Find the bounding box coordinates.
		for i in range(len(image_np)):
			for j in range(len(image_np[0])):
				pix = image_np[i, j]
				if pix == 255:
					if i < top:
						top = i
					if i > bottom:
						bottom = i
					if j < left:
						left = j
					if j > right:
						right = j

		middle_x = (right + left)/2
		middle_y = (top + bottom)/2

		# If the traditional bounding box occupy less than 70% of the image, place a 250x250 square in the middle of the lesion.
		# Else, return the traditional bounding box.
		new_image = Image.open(traditional_path + name[:-4] + '.jpg')
		new_image = np.array(new_image)
		print('original')
		print(new_image.shape)
		box_diameter = 1024
		if (right - left) * (bottom - top) < 0.7 * box_diameter * box_diameter:
			print('too small')
			for i in range(len(image_np)):
				for j in range(len(image_np[0])):
					box_radius = int((box_diameter / 2) * 0.7)
					#if i > middle_y - box_radius and i < middle_y + box_radius and j > middle_x - box_radius and j < middle_x + box_radius:
					#	new_image[i, j] = 0
					new_image[(middle_y - box_radius + 1):(middle_y + box_radius), (middle_x - box_radius + 1):(middle_x + box_radius)] = 0
			new_image = Image.fromarray(new_image)
			new_image.save(output_path[k] + name)
		else:
			# for i in range(len(image_np)):
			# 	for j in range(len(image_np[0])):
			# 		if i > top and i < bottom and j > left  and j < right:
			# 			new_image[i, j] = 0
			new_image[top+1:bottom, left+1:right] = 0
			new_image = Image.fromarray(new_image)
			new_image.save(output_path[k] + name)
