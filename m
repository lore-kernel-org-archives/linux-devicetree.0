From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [PATH v7 0/2] Xilinx ZynqMP IPI Mailbox Controller Driver
Date: Thu, 20 Dec 2018 09:32:27 -0800
Message-ID: <1545327149-22331-1-git-send-email-wendy.liang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Wendy Liang <wendy.liang@xilinx.com>
List-Id: devicetree@vger.kernel.org

Introduce mailbox controller driver for ZynqMP IPI(Inter-processor
interrupt) IP core.

As the device tree bindings have been updated. Do not have "Reviewed-by"
nor "Acked-by" in the dt-bindings commit.

v7:
 - Fix sparse warning, and documentation check.
 - Add emply block to the end of of_device_id.

v6:
 - dts-binding, remove compatible property from IPI subnode

v5:
 - fix check patch warning on write a paragraph to describe the kconfig
   symbol.

v4:
 - make IPI mailboxes as subnodes to the IPI agent device node to properly
   describe the hardware.

v3:
 - add NULL entry to of_device_id of IPI controller

v2:
 - change SPDX-License-Identifier license text style in .c file
 - replace xlnx-ipi-ids with xlnx,ipi-ids


Wendy Liang (2):
  mailbox: ZynqMP IPI mailbox controller
  dt-bindings: mailbox: Add Xilinx IPI Mailbox

 .../bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt   | 127 ++++
 drivers/mailbox/Kconfig                            |  11 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/zynqmp-ipi-mailbox.c               | 764 +++++++++++++++++++++
 4 files changed, 904 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
 create mode 100644 drivers/mailbox/zynqmp-ipi-mailbox.c

-- 
2.7.4
