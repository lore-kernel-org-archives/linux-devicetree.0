From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH 0/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 2 Jun 2016 09:46:31 +0200
Message-ID: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>David Woodhouse <dwmw2@infradead.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This patch set adds a driver and relevant devicetree bindings for the
Evatronix NANDFLASH-CTRL NAND flash controller IP. This controller is
used in the Axis ARTPEC-6 SoC.

The driver supports BCH ECC using the controller's hardware, but there =
is
also an option to use software BCH ECC. However, the ECC layouts are no=
t
compatible so it's not possible to mix them. The main advantage to usin=
g
software ECC is that there are more OOB bytes free, as the hardware is
slightly wasteful on OOB space.

BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is supp=
orted.

Only large-page flash chips are supported, using 4 or 5 address cycles.

The driver has been extensively tested using hardware ECC on 2 Mbit fla=
sh chips,
with 8 bit ECC over 512 bytes ECC blocks.

Ricard Wanderlof (4):
  of: Add device tree bindings for Evatronix NANDFLASH-CTRL
  dts: Add Evatronix NAND flash driver to ARTPEC-6 dtsi
  mtd: nand: Add support for Evatronix NANDFLASH-CTRL
  MAINTAINERS: mtd: Add maintainer for Evatronix NAND flash driver

 .../devicetree/bindings/mtd/evatronix-nand.txt     |   44 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 MAINTAINERS                                        |    6 +
 arch/arm/boot/dts/artpec6.dtsi                     |   19 +
 drivers/mtd/nand/Kconfig                           |    6 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/evatronix_nand.c                  | 1909 ++++++++++++=
++++++++
 7 files changed, 1986 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-nan=
d.txt
 create mode 100644 drivers/mtd/nand/evatronix_nand.c

--=20
1.7.10.4


--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
