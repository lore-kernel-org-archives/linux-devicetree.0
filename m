From: Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/3][v3] Add QorIQ LS2088A platform support
Date: Mon, 9 Jan 2017 10:44:53 +0530
Message-ID: <1483938896-2221-1-git-send-email-abhimanyu.saini@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: scott.wood-3arQi8VN3Tc@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Abhimanyu Saini <abhimanyu.saini-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the QorIQ LS2088A SoC.
LS2088A SoC is similar to LS2080A SoC with a few differences like it has A72 cores.

This patchset
        - reorganize LS2088A DTS/DTSI for code reuseability
        - adds LS2088A device dtsi and dts files.

Abhimanyu Saini (3):
  dt-bindings: Add compatible for LS2088A QDS and RDB boards
  arm64: freescale: ls2080a: Split devicetree for code resuability
  arm64: Add DTS support for FSL's LS2088A SoC

Changes for v3:
	- rename dts/dtsi files
Changes for v2:
	- reorganize LS2088A device tree to use common
	  nodes from LS2080A device trees.
	- Both LS2080A and LS2088A have same hardware
	  controllers, so separate dt-binding patches for
	  pcie, gpio, dspi, qspi are not required.

Abhimanyu Saini (3):
  dt-bindings: Add compatible for LS2088A QDS and RDB board
  arm64: freescale: ls2080a: Split devicetree for code resuability
  arm64: freescale: ls2088a: Add DTS support for FSL's LS2088A SoC

 Documentation/devicetree/bindings/arm/fsl.txt     |  11 +
 arch/arm64/boot/dts/freescale/Makefile            |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts | 154 +----
 arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts | 106 +---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi    | 715 +---------------------
 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts |  65 ++
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts |  65 ++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi    | 162 +++++
 8 files changed, 331 insertions(+), 949 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
