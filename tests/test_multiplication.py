from src.calculator import multiply
import pytest

@allure.tag("test multiply")
def test_multiply():
    result = multiply(3, 4)
    assert result == 12

@allure.tag("test multiply string")
def test_multiply_string():
    with pytest.raises(TypeError):
        multiply("string", 4)
