Return-Path: <SRS0=zrMl=GI=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/4] arm64: dts: ls: Remove "simple-bus" from ifc compatible
Date: Sun, 18 Mar 2018 11:17:29 -0300
Message-Id: <1521382651-10256-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1521382651-10256-1-git-send-email-festevam@gmail.com>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Currently the following dtc warnings are seen when building with W=1:

Warning (simple_bus_reg): Node /soc/ifc@1530000/nor@0,0 simple-bus unit address format error, expected "0"
Warning (simple_bus_reg): Node /soc/ifc@1530000/nand@1,0 simple-bus unit address format error, expected "100000000"
Warning (simple_bus_reg): Node /soc/ifc@1530000/board-control@2,0 simple-bus unit address format error, expect"

Remove the "simple-bus" from the ifc compatible string to fix these
warnings.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 1109f22..579848a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -312,7 +312,7 @@
 		};
 
 		ifc: ifc@1530000 {
-			compatible = "fsl,ifc", "simple-bus";
+			compatible = "fsl,ifc";
 			reg = <0x0 0x1530000 0x0 0x10000>;
 			big-endian;
 			interrupts = <0 43 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 136ebfa..bde848b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -230,7 +230,7 @@
 		};
 
 		ifc: ifc@1530000 {
-			compatible = "fsl,ifc", "simple-bus";
+			compatible = "fsl,ifc";
 			reg = <0x0 0x1530000 0x0 0x10000>;
 			big-endian;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 1c6556b..73d16bc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -410,7 +410,7 @@
 		};
 
 		ifc: ifc@2240000 {
-			compatible = "fsl,ifc", "simple-bus";
+			compatible = "fsl,ifc";
 			reg = <0x0 0x2240000 0x0 0x20000>;
 			interrupts = <0 21 IRQ_TYPE_LEVEL_HIGH>;
 			little-endian;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 137ef4d..bf2b0af 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -619,7 +619,7 @@
 		};
 
 		ifc: ifc@2240000 {
-			compatible = "fsl,ifc", "simple-bus";
+			compatible = "fsl,ifc";
 			reg = <0x0 0x2240000 0x0 0x20000>;
 			interrupts = <0 21 0x4>; /* Level high type */
 			little-endian;
-- 
2.7.4
