From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v2 0/2] mtd: hisilicon: add a new driver for NAND controller of hisilicon hip04 Soc
Date: Thu, 23 Oct 2014 22:04:43 +0800
Message-ID: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, caizhiyong@huawei.com, haojian.zhuang@gmail.com, xuwei5@hisilicon.com, wangzhou1@hisilicon.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Zhou Wang <wangzhou.bry@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset adds the support for NAND controller of hisilicon hip04 Soc.
The NAND controller IP was developed by hisilicon and needs a new driver to
support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
controller works fine in Hip04 D01 board.

Changes in v2:
- Remove the patch for device tree, now patchset only has the driver and its
  device tree binding documentation.
- Change the file name: hisi_nand.c to hisi504_nand.c.
Changes in v1:
- Remove callback functions out of struct hinfc_host, and call them directly
  in relative functions.
- Change hinfc_read and hinfc_write from macros to inline functions.
- Instead of putting pointers, embed struct nand_chip and struct mtd_info in
  struct hinfc_host directly.
- rewrite some unclear lines in device tree binding document, correct some
  code style error.

Link on v1:
- https://lkml.org/lkml/2014/7/15/198

Zhou Wang (2):
  mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
  mtd: hisilicon: add device tree binding documentation

 .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 +
 drivers/mtd/nand/Kconfig                           |    5 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/hisi504_nand.c                    |  836 ++++++++++++++++++++
 4 files changed, 882 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
 create mode 100644 drivers/mtd/nand/hisi504_nand.c

-- 
1.7.9.5
