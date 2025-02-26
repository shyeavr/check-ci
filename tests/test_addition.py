from src.calculator import add
import pytest
import allure


@allure.tag("test add")
def test_add():
    result = add(3, 4)
    assert result == 7

@allure.tag("test add string")
def test_add_string():
    with pytest.raises(TypeError):
        add("string", 4)
