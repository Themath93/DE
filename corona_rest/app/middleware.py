from kafka import KafkaProducer
import json

class LogMiddleware:

    producer = KafkaProducer(bootstrap_servers='localhost:9092', value_serializer=lambda v: json.dumps(v).encode('utf-8'))

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        log_dict = {
            "user": str(request.user),
            "http_method": str(request.method),
            "url": str(request.path)
        }

        self.producer.send('corona-log', log_dict)
        response = self.get_response(request)
        return response
