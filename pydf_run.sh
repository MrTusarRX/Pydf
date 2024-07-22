#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
    pkg list-installed "$1" &> /dev/null
}

# Function to check if a Python package is installed
is_python_package_installed() {
    pip show "$1" &> /dev/null
}


pkg update -y
pkg upgrade -y


if ! is_package_installed "python"; then
    echo "Installing python..."
    pkg install -y python
else
    echo "Python is already installed."
fi


if ! is_package_installed "wkhtmltopdf"; then
    echo "Installing wkhtmltopdf..."
    pkg install -y wkhtmltopdf
else
    echo "wkhtmltopdf is already installed."
fi

if ! is_package_installed "libjpeg-turbo"; then
    echo "Installing libjpeg-turbo..."
    pkg install -y libjpeg-turbo
else
    echo "libjpeg-turbo is already installed."
fi

if ! is_python_package_installed "pdfkit"; then
    echo "Installing pdfkit..."
    pip install pdfkit
else
    echo "pdfkit is already installed."
fi

echo "Running the Python script..."
python3 pydf.py
