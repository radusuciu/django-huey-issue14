from django_huey import enqueue, task


@task()
def count_beans(num_beans: int):
    print(f'Counted {num_beans} beans.')

@task(queue='foo')
def count_foos(num_foos: int):
    print(f'Counted {num_foos} foos.')

@task()
def count_stuff():
    enqueue(count_beans.s(2).then(count_foos))
