# Troubleshooting Authentication Issues

If you see errors like "Invalid Grant" or "Authentication failed":

1.  **Re-authenticate locally:**
    ```bash
    gcloud auth application-default login
    ```

2.  **Check Service Account Key:**
    *   Ensure `gcp-key.json` exists in `iac/`.
    *   Ensure the service account has `Compute Admin` role in GCP Console.

3.  **Activate via Command Line:**
    ```bash
    gcloud auth activate-service-account --key-file=gcp-key.json
    ```
