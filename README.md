# AWS Cloud Resume Challenge

Since deciding to pursue a career in cloud computing, I have been eager to build a cloud-based project. I first came across this project through a YouTube channel and have planned to complete it from the start. The channel introduced me to The [The Cloud Resume Challenge](https://cloudresumechallenge.dev/) by Forrest Brazeal. After exploring the website, I knew it was the perfect challenge for me. This hands-on project integrates essential cloud skills and services, providing a deeper understanding of the development process.

## Architecture

![image](https://github.com/user-attachments/assets/78fdbc24-f2d8-41e1-b679-6f6ac7c4f9c7)

## Setting up the frontend website

First, you need to set up a website using HTML and CSS. I chose a simple template from [Start Bootstrap](https://startbootstrap.com/theme/resume#google_vignette) and customized it with my personal details. Since the goal of this project is to gain hands-on experience with AWS services rather than web development, using an easy-to-work-with template was ideal. Having some prior experience with HTML and CSS, this also served as a great refresher.

Next, I uploaded my files to an AWS S3 bucket for storage and website hosting. Since I didn’t have a domain name, I registered _nicklaus-sawatzke.com_ through Route 53. I then used AWS Certificate Manager to store and verify an SSL/TLS certificate for HTTPS.

To ensure fast and efficient content delivery, I created an AWS CloudFront distribution (CDN) to cache and serve my resume website from Edge locations, minimizing latency. Afterward, I mapped my domain name to the CloudFront distribution by creating a CNAME record in Route 53.

## Setting up the backend infrastructure

As part of this project, the website needed a visitor counter. To store the visitor count, I used DynamoDB. To read and update the count, I implemented an AWS Lambda function in Python. This function updates the visitor count each time its URL is called while ensuring security by whitelisting only my domain.

## CI/CD Integration

The next step was setting up Git and CI/CD for the frontend. First, I created a repository on GitHub, initialized it locally, and added my files to the repository. This provided a simple way to track changes and push updates to my code.

Next, I implemented GitHub Actions to automate deployments. By adding a ```yaml file in the workflow folder, I ensured that every push to the repository would automatically update my S3 bucket. I used two key GitHub Actions:

* [GitHub Action to Sync S3 Bucket](https://github.com/jakejarvis/s3-sync-action): This syncs the latest source code with the S3 bucket.
* [Invalidate AWS CloudFront action](https://github.com/marketplace/actions/invalidate-aws-cloudfront): This invalidates the CloudFront cache, ensuring that all new updates are immediately available on the CDN.

With this setup, any changes pushed to the repository automatically deploy to my hosted website, streamlining the update process.
