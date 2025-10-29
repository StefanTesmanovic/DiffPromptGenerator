# this script generates a prompt for code review based on the git diff of a specified file ($1)
file=$1
diff=$(git diff $file)

touch .prompt_file.txt
echo "You are an expert code reviewer, known for concise and precise reviews. You work with exceptional engineers that understand instantly from concise bullet points.Your job is to analyze the code and inform about readability, complexity and differences with respect to readability and complexity.

Here is the diff of the changes:" > .prompt_file.txt
echo "$diff" >> .prompt_file.txt

cat .prompt_file.txt | ollama run llama3
