import glob
from PIL import Image
import numpy as np
import os
import sys

ratios = [ratio/10 for ratio in range(5, 10, 1)]
traditional_path = 'images/train/'
print(ratios)
output_path = [f'images/center/{ratio}/' for ratio in ratios]
print(output_path)

try:
	concurrency = int(sys.argv[1])
	section_number = int(sys.argv[2])
except Exception:
	concurrency = 1
	section_number = 0
###  Note that both traditional and segmentation images are resized to be 299x299. ###

for output in output_path:
	os.makedirs(output, exist_ok=True)

dir_list = glob.glob(traditional_path + '*.jpg')
dir_list.sort()
section_len = int(len(dir_list) / concurrency)
section_start = section_number * section_len
if section_number == concurrency - 1:
	section_end = len(dir_list)
else:
	section_end = (section_number + 1) * section_len
dir_list = dir_list[section_start:section_end]

for k, ratio in enumerate(ratios):
	ratio_column = f'inside {ratio}'
	length_ratio = ratio ** 0.5
	bbox_size = int(length_ratio * 1024)
	border_size = (1024 - bbox_size) / 2
	bbox_start = int(border_size)
	bbox_end = 1024 - int(border_size)

	for file in dir_list:
		name = file.split('/')[-1]
		try:
			new_image = Image.open(traditional_path + name[:-4] + '.jpg')
		except Exception:
			new_image = Image.open(traditional_path + name[:-4] + '.png')
		new_image = np.array(new_image)
		new_image[bbox_start:bbox_end, bbox_start:bbox_end] = 0
		new_image = Image.fromarray(new_image)
		new_image.save(output_path[k] + name[:-4] + '.png')
