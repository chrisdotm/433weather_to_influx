FROM centos:7
RUN yum install -y epel-release
RUN yum update -y
RUN yum install -y  libtool libusb-devel librtlsdr-devel rtl-sdr rtl-sdr-devel unzip cmake make python34 python34-setuptools python34-pip
RUN pip3.4 install influxdb
ADD https://github.com/merbanan/rtl_433/archive/master.zip /opt/rtl_433.zip
WORKDIR /opt
RUN unzip /opt/rtl_433.zip
RUN mkdir /opt/rtl_433-master/build
WORKDIR /opt/rtl_433-master/build
RUN cmake ../
RUN make
RUN make install
WORKDIR /opt
COPY sender.py /opt/sender.py
RUN chmod 07555 /opt/sender.py
ENV influxdb_host localhost
ENV influxdb_port 8086
CMD /opt/sender.py
