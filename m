From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 00/10] mscc: ocelot: add support for SerDes muxing configuration
Date: Mon, 30 Jul 2018 14:43:45 +0200
Message-ID: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net
Cc: kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

The Ocelot switch has currently a hardcoded SerDes muxing that suits only
a particular use case. Any other board setup will fail to work.

To prepare for upcoming boards' support that do not have the same muxing,
create a PHY driver that will handle all possible cases.

A SerDes can work in SGMII, QSGMII or PCIe and is also muxed to use a
given port depending on the selected mode or board design.

The SerDes configuration is in the middle of an address space (HSIO) that
is used to configure some parts in the MAC controller driver, that is why
we need to use a syscon so that we can write to the same address space from
different drivers safely using regmap.

Patches from generic PHY and net should be safe to be merged separately.

I suggest patches 1 to 5 and 10 go through net while the others (6 to 9)
go through the generic PHY subsystem.

Thanks,
Quentin

Quentin Schulz (10):
  MIPS: mscc: ocelot: make HSIO registers address range a syscon
  dt-bindings: net: ocelot: remove hsio from the list of register address spaces
  net: mscc: ocelot: get HSIO regmap from syscon
  net: mscc: ocelot: move the HSIO header to include/soc
  net: mscc: ocelot: simplify register access for PLL5 configuration
  phy: add QSGMII and PCIE modes
  dt-bindings: phy: add DT binding for Microsemi Ocelot SerDes muxing
  MIPS: mscc: ocelot: add SerDes mux DT node
  phy: add driver for Microsemi Ocelot SerDes muxing
  net: mscc: ocelot: make use of SerDes PHYs for handling their configuration

 Documentation/devicetree/bindings/mips/mscc.txt             |  16 +-
 Documentation/devicetree/bindings/net/mscc-ocelot.txt       |   9 +-
 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt |  42 +-
 arch/mips/boot/dts/mscc/ocelot.dtsi                         |  19 +-
 drivers/net/ethernet/mscc/Kconfig                           |   2 +-
 drivers/net/ethernet/mscc/ocelot.c                          |  16 +-
 drivers/net/ethernet/mscc/ocelot.h                          |  79 +-
 drivers/net/ethernet/mscc/ocelot_board.c                    |  54 +-
 drivers/net/ethernet/mscc/ocelot_hsio.h                     | 785 +------
 drivers/net/ethernet/mscc/ocelot_regs.c                     |  93 +-
 drivers/phy/Kconfig                                         |   1 +-
 drivers/phy/Makefile                                        |   1 +-
 drivers/phy/mscc/Kconfig                                    |  11 +-
 drivers/phy/mscc/Makefile                                   |   5 +-
 drivers/phy/mscc/phy-ocelot-serdes.c                        | 314 +++-
 include/linux/phy/phy.h                                     |   2 +-
 include/soc/mscc/ocelot_hsio.h                              | 859 +++++++-
 17 files changed, 1343 insertions(+), 965 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
 delete mode 100644 drivers/net/ethernet/mscc/ocelot_hsio.h
 create mode 100644 drivers/phy/mscc/Kconfig
 create mode 100644 drivers/phy/mscc/Makefile
 create mode 100644 drivers/phy/mscc/phy-ocelot-serdes.c
 create mode 100644 include/soc/mscc/ocelot_hsio.h

base-commit: d6e74c71c4de5222f147b64bf747e8a3c523c690
-- 
git-series 0.9.1
