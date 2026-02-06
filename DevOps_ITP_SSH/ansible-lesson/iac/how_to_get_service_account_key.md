# How to Get GCP Service Account Key

1.  Go to **Google Cloud Console** > **IAM & Admin** > **Service Accounts**.
2.  Click on your service account (e.g., `ansible-automation@...`).
3.  Go to the **Keys** tab.
4.  Click **Add Key** > **Create new key**.
5.  Select **JSON** and click **Create**.
6.  The file will download to your computer.
7.  Rename it to `gcp-key.json` and upload it to `/home/kta/ansible-lesson/iac/`.
