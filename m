From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 0/6] Microsemi Felix switch support
Date: Fri, 21 Jun 2019 18:38:46 +0300
Message-ID: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

This device is an ethernet switch core from Microsemi (VSC9959)
integrated as PCIe endpoint into the LS1028a SoC.

Though this switch core has some particularities (i.e. 6 ports,
some register mapping differences), functionally this driver relies
entirely on the Ocelot switch driver providing all the features,
and is basically an instance of the Ocelot core driver.

The first 3 patches are minor refactoring of the common Ocelot code
(core driver).  The rest provide the integration code of the switch
as a PCIe device, the register mapping, corresponding ls1028a DT
nodes (for switch ports link configuration).  There are also few
particularities described by individual patch messages.

Claudiu Manoil (6):
  ocelot: Filter out ocelot SoC specific PCS config from common path
  ocelot: Refactor common ocelot probing code to ocelot_init
  ocelot: Factor out resource ioremap and regmap init common code
  arm64: dts: fsl: ls1028a: Add Felix switch port DT node
  dt-bindings: net: Add DT bindings for Microsemi Felix Switch
  net/mssc/ocelot: Add basic Felix switch driver

 .../devicetree/bindings/net/mscc-felix.txt    |  77 +++
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi |  58 ++-
 drivers/net/ethernet/mscc/Kconfig             |   8 +
 drivers/net/ethernet/mscc/Makefile            |   9 +-
 drivers/net/ethernet/mscc/felix_board.c       | 392 +++++++++++++++
 drivers/net/ethernet/mscc/felix_regs.c        | 448 ++++++++++++++++++
 drivers/net/ethernet/mscc/ocelot.c            |  23 +-
 drivers/net/ethernet/mscc/ocelot.h            |  13 +-
 drivers/net/ethernet/mscc/ocelot_board.c      |  16 +-
 drivers/net/ethernet/mscc/ocelot_io.c         |  14 +-
 drivers/net/ethernet/mscc/ocelot_regs.c       |  21 +
 11 files changed, 1041 insertions(+), 38 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/mscc-felix.txt
 create mode 100644 drivers/net/ethernet/mscc/felix_board.c
 create mode 100644 drivers/net/ethernet/mscc/felix_regs.c

-- 
2.17.1
