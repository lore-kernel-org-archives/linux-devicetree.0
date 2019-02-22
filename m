From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [PATCH v8 0/2] Xilinx ZynqMP IPI Mailbox Controller Driver
Date: Thu, 21 Feb 2019 16:36:32 -0800
Message-ID: <1550795794-27594-1-git-send-email-wendy.liang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Wendy Liang <wendy.liang@xilinx.com>
List-Id: devicetree@vger.kernel.org

Introduce mailbox controller driver for ZynqMP IPI(Inter-processor
interrupt) IP core.

v8:
 - Remove unused macros
 - Remove polling sending status from send_data
 - Remove calling receive callback from last_tx_done()
 - Use devm_mbox_controller_register()
 - Use of_get_child_count() to get the number of mailboxes.

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
 drivers/mailbox/zynqmp-ipi-mailbox.c               | 725 +++++++++++++++++++++
 include/linux/mailbox/zynqmp-ipi-message.h         |  20 +
 5 files changed, 885 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.txt
 create mode 100644 drivers/mailbox/zynqmp-ipi-mailbox.c
 create mode 100644 include/linux/mailbox/zynqmp-ipi-message.h

-- 
2.7.4
