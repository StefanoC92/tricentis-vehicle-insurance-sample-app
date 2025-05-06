from robot.api.deco import keyword, not_keyword
from visual_comparison.utils import ImageComparisonUtil
import os
import cv2

reference_imgs_dir = "../reference_images/"
compare_imgs_dir = "../results/image_comparison/"

# Type the following command in the terminal to produce the related library documentation
# python -m robot.libdoc ../libraries/custom.py ../libraries/Documentation/custom.html
@not_keyword
def get_image(filename: str, root_folder = "../"):
    path_to_filename = ''

    for root, dirs, files in os.walk(root_folder):

        if filename in files:
            path_to_filename = os.path.join(root, filename)
    
    if not path_to_filename:
        raise FileNotFoundError(f"Image with name {filename} not found in {root_folder}")
    else:
        img = cv2.imread(path_to_filename)
    
    return img, path_to_filename

@keyword("Compare Images")
def comapre_images(filename1: str, filename2: str) -> None:
    actual_img, actual_img_path = get_image(filename1)
    expected_img, expected_img_path = get_image(filename2)

    similarity_idx = ImageComparisonUtil.compare_images(expected_img, actual_img)

    if similarity_idx < 1:
        #The images are different
        raise AssertionError(f"The actual image {compare_imgs_dir + filename1} and the expected one {reference_imgs_dir + filename2} are different with a similarity index of {similarity_idx:.2f} ")
    
    return similarity_idx

# if __name__ == "__main__":
#     #Calls for testing functions
#     comapre_images("actual_icon_eng_perf.png", "expected_valid_data_icon.png")