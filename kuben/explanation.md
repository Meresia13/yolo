# **Explanation of Kubernetes Deployment**

In this stage of deploying the YOLO application on Kubernetes, we will walk through the Kubernetes manifests and their execution order. This explanation aligns with the steps outlined in the deployment playbook.

## Playbook Execution Order

1.  **Namespace Creation**: Begin by creating a Kubernetes Namespace named "yolo" to isolate our application's resources. This organization enhances resource management and clarity within the cluster.
2.  **Storage Class and Persistent Volume Claim (PVC) for MongoDB**: Define a Storage Class and PVC for MongoDB to ensure data persistence across pod restarts or rescheduling, maintaining data integrity.
3.  **StatefulSet for MongoDB**: Utilize a StatefulSet for MongoDB deployment, providing stable network identifiers for each pod. This choice ensures MongoDB's stateful nature is effectively managed within the Kubernetes environment.
4.  **Deployments for Backend and Client**: Deploy the backend and client applications using Deployment resources. These manage pod lifecycle, enabling scaling and handling updates seamlessly.
5.  **Services for Pod Exposure**: Expose backend and client pods internally using Service resources. These services facilitate communication between application components and, if needed, grant external access via LoadBalancer type services.

## Manifest Explanation

*   **backend-deployment.yaml**: Specifies Deployment for the backend application, defining replicas, container images, environment variables, and port configurations.
*   **backend-service.yaml**: Defines Service to expose the backend application within the cluster. Utilizes LoadBalancer type service for potential external access.
*   **client-deployment.yaml**: Deployment for the client application (assuming frontend), mirroring backend deployment with image, replicas, and configurations.
*   **client-service.yaml**: Service to expose the client application internally. Also uses LoadBalancer type for external access.
*   **storage-class.yaml** and **mongo-pvc.yaml**: Define PV and PVC for MongoDB, ensuring persistent storage for data.
*   **mongo-statefulset.yaml**: Specifies StatefulSet for MongoDB deployment, including volumeClaimTemplates for persistent storage.
*   **mongo-service.yaml**: Defines Service to expose the MongoDB pods internally within the cluster. This service enables communication with MongoDB from other components of the application.
*   **namespace.yaml**: Creates a Namespace named "yolo" to encapsulate application resources.

## Accessing the Application

Access the frontend client via http://34.77.222.244 on your web browser.
