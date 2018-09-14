Return-Path: <SRS0=AnC+=L4=nvidia.com=pdeschrijver@kernel.org>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [RFC 00/14] Tegra210 EMC scaling
Date: Fri, 14 Sep 2018 23:02:55 +0300
Message-ID: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: vkuruturi@nvidia.com, linux-tegra=linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, robh+dt@kernel.org
Cc: daniel@octaforge.org, a.heider@gmail.com, swtcr0@gmail.com, Peter De Schrijver <pdeschrijver@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This series introduces EMC scaling for Tegra210. It's a preliminary version
which hasn't been extensively tested so it may crash your system. The reason
I'm posting it anyway to start discussing the DT binding document. The
problem here is that this binding is also used by firmware which is already
in the field. The firmware needs the data in the DT to perform the initial
training and it also writes the results of this training in the DT which are
then used by this driver. Without this training higher OPPs cannot be used.

Peter De Schrijver (14):
  memory: tegra: mc: Add Tegra210 MC emem registers
  clk: tegra: rename emc timing functions
  clk: tegra: emc: simplify parent matching
  clk: tegra: emc: prepare for Tegra210 parent table
  memory: tegra: mc: Introduce helpers
  memory: tegra: mc: Add support for scaled LA
  memory: tegra: scaled LA register for Tegra210
  clk: tegra: clock changes for emc scaling
  memory: tegra: Add definitions shared by Tegra210 EMC scaling code
  memory: tegra: Add Tegra210 EMC scaling sequence
  memory: tegra: parse DT and costruct timing tables
  memory: tegra: Tegra210 EMC memory driver
  memory: tegra: enable Tegra210 EMC scaling driver
  dt-bindings: tegra: Add Tegra210 EMC binding

 .../memory-controllers/nvidia,tegra210-emc.txt     |  448 ++++
 drivers/clk/tegra/clk-emc.c                        |   88 +-
 drivers/clk/tegra/clk-tegra210.c                   |   53 +-
 drivers/memory/tegra/Kconfig                       |   10 +
 drivers/memory/tegra/Makefile                      |    1 +
 drivers/memory/tegra/mc.c                          |   84 +-
 drivers/memory/tegra/tegra124-emc.c                |    8 +-
 drivers/memory/tegra/tegra210-dt-parse.c           |  363 ++++
 drivers/memory/tegra/tegra210-emc-cc-r21021.c      | 1864 ++++++++++++++++
 drivers/memory/tegra/tegra210-emc-reg.h            | 1879 ++++++++++++++++
 drivers/memory/tegra/tegra210-emc.c                | 2268 ++++++++++++++++++++
 drivers/memory/tegra/tegra210.c                    |   99 +
 include/dt-bindings/clock/tegra210-car.h           |    2 +
 include/soc/tegra/emc.h                            |    8 +-
 include/soc/tegra/mc.h                             |    6 +
 15 files changed, 7119 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
 create mode 100644 drivers/memory/tegra/tegra210-dt-parse.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-cc-r21021.c
 create mode 100644 drivers/memory/tegra/tegra210-emc-reg.h
 create mode 100644 drivers/memory/tegra/tegra210-emc.c

-- 
1.9.1
