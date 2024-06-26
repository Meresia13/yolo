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

# **Setting Up Kubernetes Deployment**

## **Step 1: Activate Kubernetes Engine API**

*   Enable the Kubernetes Engine API

## **Step 2: Create Google Kubernetes Engine (GKE) Cluster**

*   Generate a GKE Cluster with the following command:

> \`gcloud container clusters create yolo-cluster --num-nodes=3 --zone europe-west1-b\`

*   Retrieve Cluster Credentials:

> \`gcloud container clusters get-credentials yolo-cluster --zone europe-west1-b\`

## **Step 3: Prepare Docker Images**

Build and push Docker images:

*   Navigate to the backend directory and run:

> \`docker build -t gcr.io/my-yolo-project-2024/yolomy-backend:latest .\`

> \`docker push gcr.io/my-yolo-project-2024/yolomy-backend:latest\`

*   Navigate to the client directory and execute:

> \`docker build -t gcr.io/my-yolo-project-2024/yolomy-client:latest . \`

> \`docker push gcr.io/my-yolo-project-2024/yolomy-client:latest\`

## **Step 4: Create Kubernetes Manifests**

*   **Create Namespace:**

Create a namespace.yaml file and apply it:

> \`apiVersion: v1\`

> \`kind: Namespace\`

> \`metadata:\`

>   \`name: yolo\`

Apply the namespace using:

> \`kubectl apply -f namespace.yaml\`

*   **Create Storage Class and Persistent Volume Claim for MongoDB:**

Create storage-class.yaml and mongo-pvc.yaml for Persistent Volume and Claim, respectively, and apply them:

> \`kubectl apply -f storage-class.yaml -n yolo\`

> \`kubectl apply -f mongo-pvc.yaml -n yolo\`

*   **Create StatefulSet for MongoDB:**

Create mongo-statefulset.yaml for StatefulSet and apply it:

> \`apiVersion: apps/v1\`

> \`kind: StatefulSet\`

> \`...\`

Apply the StatefulSet using:

> \`kubectl apply -f mongo-statefulset.yaml -n yolo\`

*   **Create Deployments for Backend and Client:**

Create backend-deployment.yaml and client-deployment.yaml for Deployments and apply them. Example backenddeployment.yaml:

> \`apiVersion: apps/v1\`

> \`kind: Deployment\`

> \`...\`

Apply the Deployment using:

> \`kubectl apply -f backend-deployment.yaml -n yolo\`

*   **Create Services to Expose the Pods:**

Create backend-service.yaml and frontend-service.yaml for Services and apply them. Example backend-service.yaml:

> \`apiVersion: v1\`

> \`kind: Service\`

> \`...\`

Apply the Service using:

> \`kubectl apply -f backend-service.yaml -n yolo\`

## **Step 5: Verify Deployment**

*   **Check Pod Status:**

> \`kubectl get pods -n yolo\`

*   **Obtain External IPs:**

> \`kubectl get svc -n yolo\`

**Accessing the Application**

*   Access the application externally via - http://34.77.222.244

**Features**

*   Add new products with name, description, and price.
*   View a list of all products.
*   Update existing products.
*   Delete products.

**Usage**

*   Add a product: Fill out the form with the product details and click "Add Product".
*   View products: See the list of products displayed on the homepage.
*   Update a product: Click on the "Edit" button next to a product and make changes in the form.
*   Delete a product: Click on the "Delete" button next to a product to remove it from the list.
