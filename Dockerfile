FROM python:3.6-slim
COPY . /check-ci
WORKDIR /python-test-calculator
RUN pip install --no-cache-dir -r requirements.txt
# RUN ["pytest", "-v", "--alluredir=reports/allure_results", "--junitxml=reports/result.xml"]
CMD pytest --alluredir=/python-test-calculator/reports/allure-results && \
    tail -f /dev/null
# CMD tail -f /dev/null
