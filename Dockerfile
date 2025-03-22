# Base image for Morph Cloud
FROM public.ecr.aws/i1l4z0u0/morph-data:python3.10

# Set working directory
WORKDIR /var/task

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --target "${MORPH_PACKAGE_ROOT}"

# Copy source code and dependencies
COPY . .

# Command to run the Lambda function
CMD python "${MORPH_APP_FILE_PATH}"
