From: Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v4 0/2] Add Macronix Raw NAND controller driver
Date: Tue, 25 Jun 2019 14:10:54 +0800
Message-ID: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: miquel.raynal@bootlin.com, marek.vasut@gmail.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, bbrezillon@kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, vigneshr@ti.com, paul.burton@mips.com, liang.yang@amlogic.com, richard@nod.at, anders.roxell@linaro.org, christophe.kerello@st.com, paul@crapouillou.net, jianxin.pan@amlogic.com, stefan@agner.ch, devicetree@vger.kernel.org
Cc: juliensu@mxic.com.tw, lee.jones@linaro.org, masonccyang@mxic.com.tw, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

v4 patch back to only raw NAND controller driver instead of MFD,
raw NAND and SPI driver. This is based on MFD maintainer, Lee Jones
comments:
MFD is for registering child devices of chips which offer genuine
cross-subsystem functionality.
It is not designed for mode selecting, or as a place to shove shared code 
just because a better location doesn't appear to exist. 

v3 patch is to rename the title of SPI controller driver.
"Patch Macronix SPI controller driver according to MX25F0A MFD driver"

v2s patches is to support Macronix MX25F0A MFD driver 
for raw nand and spi controller which is separated 
form previous patchset:

https://patchwork.kernel.org/patch/10874679/

thanks for your review.

best regards,
Mason


Mason Yang (2):
  mtd: rawnand: Add Macronix Raw NAND controller
  dt-bindings: mtd: Document Macronix raw NAND controller bindings

 .../devicetree/bindings/mtd/mxic-nand.txt          |  26 +
 drivers/mtd/nand/raw/Kconfig                       |   6 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/mxic_nand.c                   | 551 +++++++++++++++++++++
 4 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt
 create mode 100644 drivers/mtd/nand/raw/mxic_nand.c

-- 
1.9.1
