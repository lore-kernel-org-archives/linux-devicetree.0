From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH 0/3] Add reset driver support for ZynqMP
Date: Sat, 20 Oct 2018 14:11:04 +0530
Message-ID: <20181020084107.28251-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

This series of patches are created On top of the
below repo. 
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git (fetch)
BRANCH: next/drivers
 
Nava kishore Manne (3):
  firmware: xilinx: Add reset API's
  dt-bindings: reset: Add bindings for ZynqMP reset driver
  reset: reset-zynqmp: Adding support for Xilinx zynqmp reset
    controller.

 .../bindings/reset/xlnx,zynqmp-reset.txt      | 146 ++++++++++++++++++
 drivers/firmware/xilinx/zynqmp.c              |  40 +++++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-zynqmp.c                  | 117 ++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          | 136 ++++++++++++++++
 5 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.txt
 create mode 100644 drivers/reset/reset-zynqmp.c

-- 
2.18.0
