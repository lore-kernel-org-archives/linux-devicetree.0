From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH 0/3] Add nvmem driver support for ZynqMP
Date: Fri, 19 Oct 2018 08:35:49 +0000 (UTC)
Message-ID: <20181020083603.27602-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 20 Oct 2018 14:06:00 +0530
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, jollys@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series of patches are created On top of the
below repo 
//git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
BRANCH: next/drivers

Nava kishore Manne (3):
  firmware: xilinx: Add zynqmp_pm_get_chipid() API
  dt-bindings: nvmem: Add bindings for ZynqMP nvmem driver
  nvmem: zynqmp: Added zynqmp nvmem firmware driver

 .../bindings/nvmem/xlnx,zynqmp-nvmem.txt           | 37 ++++++++++
 drivers/firmware/xilinx/zynqmp.c                   | 24 ++++++
 drivers/nvmem/Kconfig                              | 15 ++--
 drivers/nvmem/Makefile                             |  5 +-
 drivers/nvmem/zynqmp_nvmem.c                       | 86 ++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h               |  2 +
 6 files changed, 159 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.txt
 create mode 100644 drivers/nvmem/zynqmp_nvmem.c

-- 
2.7.4
