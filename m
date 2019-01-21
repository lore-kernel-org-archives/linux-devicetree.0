Return-Path: <SRS0=r4NE=P5=nvidia.com=talho@kernel.org>
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH V2 0/4] add Tegra210 BPMP driver
Date: Mon, 21 Jan 2019 14:28:47 +0200
Message-ID: <1548073731-6449-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

This is a second version of "add Tegra210 BPMP driver" series. It has
only some minor updates to original series based on feedback received
from Sivaram Nair and Rob Herring. The original cover letter of patch
series one is below.

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

 .../bindings/firmware/nvidia,tegra210-bpmp.txt     |  36 +++
 drivers/firmware/tegra/Makefile                    |   2 +
 drivers/firmware/tegra/bpmp-private.h              |  29 ++
 drivers/firmware/tegra/bpmp-t186.c                 | 303 +++++++++++++++++
 drivers/firmware/tegra/bpmp-t210.c                 | 241 ++++++++++++++
 drivers/firmware/tegra/bpmp.c                      | 359 ++++++++-------------
 include/soc/tegra/bpmp.h                           |  13 +-
 7 files changed, 751 insertions(+), 232 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
 create mode 100644 drivers/firmware/tegra/bpmp-private.h
 create mode 100644 drivers/firmware/tegra/bpmp-t186.c
 create mode 100644 drivers/firmware/tegra/bpmp-t210.c

-- 
2.7.4
