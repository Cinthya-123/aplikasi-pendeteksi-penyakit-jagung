import os
import cv2
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from skimage.feature import local_binary_pattern

# Menentukan direktori dataset
dir = r'D:\Backup_H\Jagung\Training'

# Daftar kategori label
categories = ['Blight', 'Common_rust', 'Healthy']

# List untuk menyimpan fitur dan label
features = []
labels = []

# Memuat dan mengolah dataset
for category in categories:
    path = os.path.join(dir, category)
    label = categories.index(category)

    for img in os.listdir(path):
        imgpath = os.path.join(path, img)
        try:
            corn_img = cv2.imread(imgpath, 0)
            corn_img = cv2.resize(corn_img, (200, 200))

            # Ekstraksi fitur tekstur (LBP)
            lbp_image = local_binary_pattern(corn_img, 8, 3, method='uniform')
            lbp_features = np.array(lbp_image).flatten()

            # Ekstraksi fitur warna (Histogram)
            rgb_image = cv2.cvtColor(cv2.imread(imgpath), cv2.COLOR_BGR2RGB)
            r, g, b = cv2.split(rgb_image)
            hist_r, bins_r = np.histogram(r, bins=256, range=(0, 256))
            hist_g, bins_g = np.histogram(g, bins=256, range=(0, 256))
            hist_b, bins_b = np.histogram(b, bins=256, range=(0, 256))
            color_features = np.concatenate((hist_r, hist_g, hist_b))

            # Gabungkan fitur-fitur yang diekstraksi
            combined_features = np.concatenate((lbp_features, color_features))

            # Simpan fitur dan label ke dalam list
            features.append(combined_features)
            labels.append(label)
        except Exception as e:
            print('Error:', e)

# Konversi list fitur dan label menjadi array numpy
features = np.array(features)
labels = np.array(labels)

# Membagi data menjadi set pelatihan dan pengujian
xtrain, xtest, ytrain, ytest = train_test_split(features, labels, test_size=0.10)

# Membangun model klasifikasi (SVM)
model = SVC(C=1, kernel='poly', gamma='auto')

# Melatih model
model.fit(xtrain, ytrain)


# Melakukan prediksi menggunakan model
prediction = model.predict([combined_features])

# Menampilkan hasil prediksi
print('Prediction is:', categories[prediction[0]])

# Menghitung akurasi model
accuracy = model.score(xtest, ytest)
print('Accuracy:', accuracy)


