import pytest, logging

from web import app, index

#Logging configurations
logging.basicConfig(level=logging.DEBUG)

@pytest.fixture
def app_inst():
    #Pytest fixture that returns an instance of application.
    app.debug = True
    return app

def test_index():
    index_str = index()
    assert index_str == "Hello, World!"

def test_index_200(app_inst):
    client = app_inst.test_client()
    response = client.get("/")
    assert response.status_code == 200

def test_index_405(app_inst):
    client = app_inst.test_client()
    response = client.post("/")
    assert response.status_code == 405

def test_index_endpoint(app_inst):
    client = app_inst.test_client()
    response = client.get("/")
    assert b'Hello, World!' in response.data