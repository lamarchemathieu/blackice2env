# Docker image for Blackice II build environement

```
sudo apt-get install -y docker.io
sudo usermod -a -G docker $USER
<reboot computer>
./init_docker.sh
<wait for 10min>
./run_docker.sh
<now you are in the docker VM, and the current folder is mapped to /opt/workspace>
git clone https://github.com/mystorm-org/BlackIce-II.git
cd BlackIce-II/firmware/iceboot/
make clean
make -j`nproc` raw hex elf
ll output
cd ../../examples/hello_world/
make clean
make
make sim
gtkwave waves.vcd
make flash
```