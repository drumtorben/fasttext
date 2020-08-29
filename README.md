# fastText Docker
Dockerfile and example for Facebook Research's [fastText](https://fasttext.cc/docs/en/support.html).

# Getting Started
The quickest way to classify with this fasttext docker container is:
```
git clone git@github.com:drumtorben/fasttext.git
cd fasttext
make build
```

Now the docker image is automatically created, this takes a while.

# Prepare the data
The data needs to be stored in a specific format. Each line of the text file contains a list of labels, followed by the corresponding document. All the labels start by the `__label__` prefix, which is how fastText recognize what is a label or what is a word.
An example for this format is given here:
```
__label__A example text 1
__label__B another example text
```

# Store the data in the correct location
In the fasttext directory there is a data folder. Split your data in `train.txt` and `test.txt` and put both files here.

# Train, test, predict
The processes are automated via the Makefile. Make sure you have stored the data in the right location and then just do:
```
make train
make test
make predict
```

# Extra
If you want to do other things with fasttext which are not automated yet, you can execute
```
make run
```
which results in direct access to the docker. You can now execute `./fasttext`, which allows you to interact with the complete fasttext library. You get the idea.
