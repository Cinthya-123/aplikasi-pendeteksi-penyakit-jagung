from PIL import Image
import matplotlib.pyplot as plt
import numpy as np
import cv2
from skimage.feature import local_binary_pattern
from io import BytesIO
import base64

def process_image(base64_image):
    # Decode base64 image string
    image_data = base64.b64decode(base64_image)
    image_array = np.frombuffer(image_data, np.uint8)
    img = cv2.imdecode(image_array, cv2.IMREAD_COLOR)

    # Convert to grayscale
    gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray_img = cv2.resize(gray_img, (200, 200))

    # Extract LBP features
    lbp_image = local_binary_pattern(gray_img, 8, 3, method='uniform')
    lbp_features = np.array(lbp_image).flatten()

    # Extract color histogram features
    r, g, b = cv2.split(img)
    hist_r, bins_r = np.histogram(r, bins=256, range=(0, 256))
    hist_g, bins_g = np.histogram(g, bins=256, range=(0, 256))
    hist_b, bins_b = np.histogram(b, bins=256, range=(0, 256))
    color_features = np.concatenate((hist_r, hist_g, hist_b))

    # Combine extracted features
    combined_features = np.concatenate((lbp_features, color_features))

    return combined_features

# Example usage
uploaded_image_base64 = "..."  # Base64 string of the uploaded image from Dart
combined_features = process_image(uploaded_image_base64)
prediction = model.predict([combined_features])
categories = ['Bercak daun', 'Karat daun', 'sehat', 'Hawar daun']
print('Prediction is: ', categories[prediction[0]])
