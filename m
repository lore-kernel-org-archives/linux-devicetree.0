From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [RFC PATCH v3 0/3] Add nvmem driver support for ZynqMP
Date: Fri, 21 Sep 2018 13:40:39 +0000 (UTC)
Message-ID: <20180922134149.5693-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Sat, 22 Sep 2018 19:11:46 +0530
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, srinivas.kandagatla@linaro.org, jollys@xilinx.com, rajanv@xilinx.com, sboyd@kernel.org, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series of patches are created On top of the
below series of patches.
https://lkml.org/lkml/2018/8/3/687 

Nava kishore Manne (3):
  firmware: xilinx: Add zynqmp_pm_get_chipid() API
  dt-bindings: fpga: Add bindings for ZynqMP nvmem driver
  nvmem: zynqmp: Added zynqmp nvmem firmware driver

 .../firmware/xilinx/xlnx,zynqmp-firmware.txt  | 35 ++++++++
 drivers/firmware/xilinx/zynqmp.c              | 24 ++++++
 drivers/nvmem/Kconfig                         | 10 +++
 drivers/nvmem/Makefile                        |  2 +
 drivers/nvmem/zynqmp_nvmem.c                  | 86 +++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  2 +
 6 files changed, 159 insertions(+)
 create mode 100644 drivers/nvmem/zynqmp_nvmem.c

-- 
2.18.0
