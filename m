Return-Path: <SRS0=bx8a=WK=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 1/2] ARM: dts: imx6: replace simple-bus by simple-mfd for anatop
Date: Wed, 14 Aug 2019 09:55:57 +0200
Message-Id: <20190814075558.2319-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Replace it to fix the following DTC warnings:

arch/arm/boot/dts/imx6qdl.dtsi:702.19-715.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-1p1: missing or empty reg/ranges property
arch/arm/boot/dts/imx6qdl.dtsi:717.19-730.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-3p0: missing or empty reg/ranges property
arch/arm/boot/dts/imx6qdl.dtsi:732.19-745.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-2p5: missing or empty reg/ranges property
arch/arm/boot/dts/imx6qdl.dtsi:747.32-762.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddcore: missing or empty reg/ranges property
arch/arm/boot/dts/imx6qdl.dtsi:764.29-779.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddpu: missing or empty reg/ranges property
arch/arm/boot/dts/imx6qdl.dtsi:781.31-796.7: Warning (simple_bus_reg): /soc/aips-bus@2000000/anatop@20c8000/regulator-vddsoc: missing or empty reg/ranges property

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 4b801935cad1..e51d72f044e2 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -695,7 +695,7 @@
 			};
 
 			anatop: anatop@20c8000 {
-				compatible = "fsl,imx6q-anatop", "syscon", "simple-bus";
+				compatible = "fsl,imx6q-anatop", "syscon", "simple-mfd";
 				reg = <0x020c8000 0x1000>;
 				interrupts = <0 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 54 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.20.1
