# Code based on medium: https://medium.com/@vivek8981/dicom-to-jpg-and-extract-all-patients-information-using-python-5e6dd1f1a07d
import pydicom as dicom
import os
import sys
from PIL import Image

# make it True if you want in PNG format
PNG = True
# Specify the .dcm folder path
folder_path = sys.argv[1]
# Specify the output jpg/png folder path
try:
    jpg_folder_path = sys.argv[2]
except:
    jpg_folder_path = sys.argv[1]

images_path = os.listdir(folder_path)
for n, image in enumerate(images_path):
    ds = dicom.dcmread(os.path.join(folder_path, image))
    pixel_array_numpy = ds.pixel_array
    if PNG is False:
        image = image.replace('.dcm', '.jpg')
    else:
        image = image.replace('.dcm', '.png')

    pil_image = Image.fromarray(pixel_array_numpy)
    pil_image.save(os.path.join(jpg_folder_path, image))
    if n % 50 == 0:
        print('{} image converted'.format(n))
