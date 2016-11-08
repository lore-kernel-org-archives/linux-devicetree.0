From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Subject: [RESEND][PATCH 0/6] Add NXP LS2088A platform support
Date: Tue, 8 Nov 2016 15:04:18 +0530
Message-ID: <1478597664-14799-1-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: scott.wood-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the QorIQ LS2088A SoC
LS2088A SoC is similar to LS2080A SoC with a few differences like
it has A72 cores.

Supported targets are QDS and RDB boards. The updates
include binding updates, and addition of the ls2088a 
device dtsi and dts files.

Abhimanyu Saini (6):
  dt-bindings: arm: Update bindings for LS2088A targets
  dt-bindings: pci: Update bindings for LS2088A
  dt-bindings: mtd: fsl-quadspi: Update qspi bindings for LS2088A
  dt-bindings: spi: Update dspi bindings for LS2088A
  dt-bindings: gpio: Update gpio bindings for LS2088A
  arm64: Add DTS support for FSL's LS2088A SoC

 Documentation/devicetree/bindings/arm/fsl.txt      |   7 +
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |   2 +-
 .../devicetree/bindings/mtd/fsl-quadspi.txt        |   4 +-
 .../devicetree/bindings/pci/layerscape-pci.txt     |   5 +-
 .../devicetree/bindings/spi/spi-fsl-dspi.txt       |   3 +-
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts  | 211 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  | 166 +++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     | 703 +++++++++++++++++++++
 9 files changed, 1096 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
