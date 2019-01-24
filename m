Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH V3 0/4] add Tegra210 BPMP driver
Date: Thu, 24 Jan 2019 19:03:51 +0200
Message-ID: <1548349435-1086-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jonathanh@nvidia.com, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

This is a third version of "add Tegra210 BPMP driver" series. In additIt
incorporates the review feedback received from Jon Hunter for patches
2, 3, and 4.

This series adds a driver for Tegra210 BPMP firmware. The BPMP is a
specific processor in Tegra210 chip, which runs firmware for assisting
in entering deep low power states (suspend to ram), and offloading
DRAM memory clock scaling on some platforms.

The series consist of first refactoring the existing BPMP driver by
first renaming the terminology used for communication, then splitting
out the Tegra186 chip specific parts, and finally adding the needed
functionality for Tegra210.

Timo Alho (4):
  firmware: tegra: reword messaging terminology
  firmware: tegra: refactor bpmp driver
  firmware: tegra: add bpmp driver for Tegra210
  dt-bindings: firmware: Add bindings for Tegra210 BPMP

 .../bindings/firmware/nvidia,tegra210-bpmp.txt     |  36 ++
 drivers/firmware/tegra/Makefile                    |   2 +
 drivers/firmware/tegra/bpmp-private.h              |  29 ++
 drivers/firmware/tegra/bpmp-t186.c                 | 303 +++++++++++++++++
 drivers/firmware/tegra/bpmp-t210.c                 | 245 ++++++++++++++
 drivers/firmware/tegra/bpmp.c                      | 363 ++++++++-------------
 include/soc/tegra/bpmp.h                           |  13 +-
 7 files changed, 759 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
 create mode 100644 drivers/firmware/tegra/bpmp-private.h
 create mode 100644 drivers/firmware/tegra/bpmp-t186.c
 create mode 100644 drivers/firmware/tegra/bpmp-t210.c

-- 
2.7.4
