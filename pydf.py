import pdfkit

path_to_wkhtmltopdf = '/data/data/com.termux/files/usr/bin/wkhtmltopdf'
config = pdfkit.configuration(wkhtmltopdf=path_to_wkhtmltopdf)

def convert_html_to_pdf(html_file_path, output_pdf_path):
    try:
        pdfkit.from_file(html_file_path, output_pdf_path, configuration=config)
        print(f'Successfully converted {html_file_path} to {output_pdf_path}')
    except Exception as e:
        print(f'An error occurred: {e}')
        
html_file = input("Enter the path to the input HTML file: ")
output_pdf = input("Enter the path to the output PDF file: ")

convert_html_to_pdf(html_file, output_pdf)
