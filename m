Return-Path: <SRS0=Obav=ZO=lvd4224.freescale.com=b49017@kernel.org>
Message-ID: <589180e7.db24620a.c0375.0cbaSMTPIN_ADDED_BROKEN@mx.google.com>
From: <y@lvd4224.freescale.com>
Subject: [PATCH v5 0/3] Add QorIQ LS2088A platform support
Date: Wed, 1 Feb 2017 11:46:56 +0530
MIME-Version: 1.0
Content-Type: text/plain
To: devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: scott.wood@nxp.com, stuart.yoder@nxp.com, linux-arm-kernel@lists.infradead.org, Abhimanyu Saini <abhimanyu.saini@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Abhimanyu Saini <abhimanyu.saini@nxp.com>

This patchset adds support for the QorIQ LS2088A SoC.
LS2088A SoC is similar to LS2080A SoC with a few differences like it has A72 cores.

This patchset
        - reorganize LS2088A DTS/DTSI for code reuseability
        - adds LS2088A device dtsi and dts files.

Abhimanyu Saini (3):
  dt-bindings: Add compatible for LS2088A QDS and RDB board
  arm64: dts: freescale: ls2080a: Split devicetree for code resuability
  arm64: dts: freescale: ls2088a: Add DTS support for FSL's LS2088A SoC

Changes for v5:
	- Add missing includes
Changes for v4:
	- Incorporated Shawn's comments by reorganizing
	  DTSI, moving all #include to the top and,
	- add missing files
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
  arm64: dts: freescale: ls2080a: Split devicetree for code resuability
  arm64: dts: freescale: ls2088a: Add DTS support for FSL's LS2088A SoC

 Documentation/devicetree/bindings/arm/fsl.txt      |  11 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts  | 155 +---
 arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts  | 110 +--
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     | 859 ++-------------------
 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts  |  66 ++
 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts  |  66 ++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     | 153 ++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi | 196 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi | 151 ++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     | 753 ++++++++++++++++++
 11 files changed, 1488 insertions(+), 1034 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-qds.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a-rdb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi

-- 
1.9.1
