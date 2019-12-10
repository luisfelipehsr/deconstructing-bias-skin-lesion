import glob
from PIL import Image
import numpy as np
import os
import sys

traditional_path = 'images/train/'
segmentation_path = ['images/only_masks/single_box/', 'images/only_masks/double_box/']
output_path = ['images/masks_combined/', 'images/masks/']

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

for k in range(len(segmentation_path)):
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
		mask = image_np == 255
		try:
			new_image = Image.open(traditional_path + name[:-4] + '.jpg')
		except Exception:
			new_image = Image.open(traditional_path + name[:-4] + '.png')
		new_image = np.array(new_image)
		print('original')
		print(new_image.shape)
		new_image[mask] = 0

		print('saving image')
		new_image = Image.fromarray(new_image)
		new_image.save(output_path[k] + name)
