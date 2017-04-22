From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 0/5] mtd: nand: gpmi: add i.MX 7 support
Date: Fri, 21 Apr 2017 18:23:33 -0700
Message-ID: <20170422012338.4635-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
There have been similar patchsets already:
https://lkml.org/lkml/2016/2/23/912

However, this patchset does not make use of any of the new features.
The current feature set seems to work fine, I successfully run the MTD
tests on a Colibri iMX7.

--
Stefan

Changes since v1:
- Make clks_count const
- Introduce IS_IMX7D for i.MX 7 SoC's and make it part of GPMI_IS_MX6

Stefan Agner (5):
  mtd: nand: gpmi: unify clock handling
  mtd: nand: gpmi: add i.MX 7 SoC support
  mtd: gpmi: document current clock requirements
  ARM: dts: imx7: add GPMI NAND
  ARM: dts: imx7-colibri: add NAND support

 .../devicetree/bindings/mtd/gpmi-nand.txt          | 14 +++++-
 arch/arm/boot/dts/imx7-colibri.dtsi                |  9 ++++
 arch/arm/boot/dts/imx7s.dtsi                       | 31 ++++++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 56 +++++++++++++---------
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  9 +++-
 5 files changed, 93 insertions(+), 26 deletions(-)

-- 
2.12.2
