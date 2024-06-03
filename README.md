# Description
This is a simple web application for managing products. Users can add, view, update, and delete products through a user-friendly interface.

# Requirements
Make sure that you have the following installed:

-   [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04)
-   npm
-   [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

## Setup Instructions

1.  Clone the repository:  
    git@github.com:Meresia13/yolo.git
    
2.  Navigate to the client folder:  
    `cd client`
    
3.  Install dependencies:  
    `npm install`
    
4.  Start the client app:  
    `npm start`
    
5.  Open a new terminal and navigate to the backend folder:  
    `cd ../backend`
    
6.  Install backend dependencies:  
    `npm install`
    
7.  Start the backend server:  
    `npm start`
    
8.  Access the application at [http://localhost:3000](http://localhost:3000) in your web browser.
    

## Features

-   Add new products with name, description, and price
-   View a list of all products
-   Update existing products
-   Delete products

## Usage

-   Add a product: Fill out the form with the product details and click "Add Product".
-   View products: See the list of products displayed on the homepage.
-   Update a product: Click on the "Edit" button next to a product and make changes in the form.
-   Delete a product: Click on the "Delete" button next to a product to remove it from the list.

**Note:** The price field only accepts numeric input.

**Setting Up Kubernetes Deployment**

**Step 1: Activate Kubernetes Engine API**

Enable the Kubernetes Engine API

**Step 2: Create Google Kubernetes Engine (GKE) Cluster**

Generate a GKE Cluster with the following command:

gcloud container clusters create yolo-cluster --num-nodes=3 --zone europe-west1-b

## Folder Structure

-   **client/**: Contains the frontend code.
-   **backend/**: Contains the backend code.
