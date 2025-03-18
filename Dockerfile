FROM nvcr.io/nvidia/tritonserver:25.02-py3

WORKDIR /models/


RUN mkdir -p /models/manoj/1 && \
    curl -o /models/manoj/1/model.onnx  https://inferpubtest.s3.us-east-1.amazonaws.com/manoj/model.onnx

EXPOSE 8000
EXPOSE 8001
EXPOSE 8002

CMD ["tritonserver", "--model-repository=/models", "--log-verbose=1", "--allow-gpu-metrics=true", "--allow-cpu-metrics=true"]
