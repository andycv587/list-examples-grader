CPATH=".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

# Corrected if statement with proper spacing
if [ -f student-submission/ListExamples.java ]; then
    echo "File Existed"
else
    echo "ListExamples.java Doesn't exist"
    echo "grade: 0"
    exit 1
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area
javac -cp $CPATH ListExamples.java TestListExamples.java

echo "$?"
