from src.calculator import subtract
import pytest

@allure.tag("test subtract positive")
def test_subtract_positive():
    result = subtract(4, 3)
    assert result == 1

@allure.tag("test subtract negative")
def test_subtract_negative():
    result = subtract(3, 4)
    assert result == -1

@allure.tag("subtract_string")
def test_subtract_string():
    with pytest.raises(TypeError):
        subtract("string", 4)
