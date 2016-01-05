## How to Build
`docker build -t sshd-ansible .`

* you can change root password in line 6 of Dockerfile

## How to Run
`docker-compose up -d`

* you can mount your ansible playbook folder in line 5 of docker-compose.yml
* you can change sshd mapping port number in line 7 of docker-compose.yml

## How to Use
```bash
$ ssh root@localhost -p 10022
# change 10022 to what port number you set
$ ansible-playbook site.yml -k -K -i ./hosts
# change site.yml to your own playbook file
# change ./hosts to your own hosts inventory file
```

## known_hosts
to avoid ssh prompt known_hosts issue<br />
i `export ANSIBLE_HOST_KEY_CHECKING=False` environment variable in line 18 of Dockerfile<br />
see: [ansible ssh prompt known_hosts issue](http://stackoverflow.com/questions/30226113/ansible-ssh-prompt-known-hosts-issue)

## ref.
* [Dockerizing an SSH daemon service](https://docs.docker.com/engine/examples/running_ssh_service/)
* [stable-ubuntu14.04](https://github.com/ansible/ansible-docker-base/blob/master/stable-ubuntu14.04/Dockerfile)