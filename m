From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/7] FSL's LS2088A platform support
Date: Tue, 28 Jun 2016 20:18:54 +0530
Message-ID: <1467125341-2380-1-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the QorIQ LS2088A SoC, which
is nearly identical to the LS2080A except it is based on A72
CPUs.

Supported targets are QDS and RDB boards.  The updates
include binding updates, compatible string update to the 
clock drivers, and the ls2088a device dtsi and dts files.


Abhimanyu Saini (7):
  dt-bindings: arm: Update bindings for LS2088A targets
  dt-bindings: pci: Update bindings for LS2088A
  dt-bindings: mtd: fsl-quadspi: Update qspi bindings for LS2088A
  dt-bindings: spi: Update dspi bindings for LS2088A
  dt-bindings: gpio: Update gpio bindings for LS2088A
  drivers: clk: qoriq: Add ls2088a key to clk OF match table
  arm64: Add DTS support for FSL's LS2088A SoC

Based off: v4.7-rc1

 Documentation/devicetree/bindings/arm/fsl.txt      |   7 +
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |   2 +-
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   4 +-
 .../devicetree/bindings/pci/layerscape-pci.txt     |   5 +-
 .../devicetree/bindings/spi/spi-fsl-dspi.txt       |   3 +-
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts  | 211 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  | 166 +++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     | 703 +++++++++++++++++++++
 drivers/clk/clk-qoriq.c                            |  12 +
 10 files changed, 1108 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
