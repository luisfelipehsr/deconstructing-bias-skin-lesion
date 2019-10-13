# Code based on medium: https://medium.com/@vivek8981/dicom-to-jpg-and-extract-all-patients-information-using-python-5e6dd1f1a07d
import os
import sys
from PIL import Image

# make it True if you want in PNG format
PNG = True
# Specify the .dcm folder path
folder_path = sys.argv[1]

images_path = os.listdir(folder_path)
for n, image in enumerate(images_path):
    image = image[:-4]
    print(image)
