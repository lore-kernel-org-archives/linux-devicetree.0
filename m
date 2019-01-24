From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH v3 0/3] Add reset driver support for ZynqMP
Date: Thu, 24 Jan 2019 07:46:37 -0000 (UTC)
Message-ID: <20190125074654.10950-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 25 Jan 2019 13:16:51 +0530
Sender: linux-kernel-owner@vger.kernel.org
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, rajanv@xilinx.com, jollys@xilinx.com, nava.manne@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, chinnikishore369@gmail.com
List-Id: devicetree@vger.kernel.org

Nava kishore Manne (3):
  firmware: xilinx: Add reset API's
  dt-bindings: reset: Add bindings for ZynqMP reset driver
  reset: reset-zynqmp: Adding support for Xilinx zynqmp reset
    controller.

 .../bindings/reset/xlnx,zynqmp-reset.txt      |  52 +++++++
 drivers/firmware/xilinx/zynqmp.c              |  40 ++++++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-zynqmp.c                  | 114 +++++++++++++++
 .../dt-bindings/reset/xlnx-zynqmp-resets.h    | 130 +++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          | 136 ++++++++++++++++++
 6 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.txt
 create mode 100644 drivers/reset/reset-zynqmp.c
 create mode 100644 include/dt-bindings/reset/xlnx-zynqmp-resets.h

-- 
2.18.0
