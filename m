From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH v3 0/3] Add nvmem driver support for ZynqMP
Date: Tue, 5 Feb 2019 11:07:17 -0000 (UTC)
Message-ID: <20190206110721.27765-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 6 Feb 2019 16:37:18 +0530
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, jollys@xilinx.com, rajanv@xilinx.com, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

Nava kishore Manne (3):
  firmware: xilinx: Add zynqmp_pm_get_chipid() API
  dt-bindings: nvmem: Add bindings for ZynqMP nvmem driver
  nvmem: zynqmp: Added zynqmp nvmem firmware driver

 .../bindings/nvmem/xlnx,zynqmp-nvmem.txt      | 47 ++++++++++
 drivers/firmware/xilinx/zynqmp.c              | 24 ++++++
 drivers/nvmem/Kconfig                         | 10 +++
 drivers/nvmem/Makefile                        |  2 +
 drivers/nvmem/zynqmp_nvmem.c                  | 86 +++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  2 +
 6 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.txt
 create mode 100644 drivers/nvmem/zynqmp_nvmem.c

-- 
2.18.0
