FROM debian:bookworm

RUN apt-get update

# Build requirements
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 python3-pip python3-venv

# Install the required dependencies
RUN apt-get install -y libevent-dev libboost-dev libsqlite3-dev libzmq3-dev systemtap-sdt-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools

# Install clang-format for consistent coding style
RUN apt-get install -y clang-format 

# Intall additional tooling
RUN apt-get install -y ccache lldb git

# Create a virtual environment and install Python dependencies
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt /
RUN pip install -r requirements.txt && rm requirements.txt

COPY scripts /scripts
RUN chmod +x -R ./scripts/

WORKDIR /workspace