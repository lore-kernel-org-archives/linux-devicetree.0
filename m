Return-Path: <SRS0=bx8a=WK=pengutronix.de=mfe@kernel.org>
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 2/2] ARM: dts: imx6: drop gpmi-nand address and size cells
Date: Wed, 14 Aug 2019 09:55:58 +0200
Message-Id: <20190814075558.2319-2-m.felsch@pengutronix.de>
In-Reply-To: <20190814075558.2319-1-m.felsch@pengutronix.de>
References: <20190814075558.2319-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Since commit fe2585e9c29a ("doc: dt: mtd: support partitions in a
special 'partitions' subnode") and commit 5cfdedb7b9a0 ("mtd: ofpart:
move ofpart partitions to a dedicated dt node") the partitioning should
be within a partitions sub-node.

Baseboard device trees following that scheme will get a dtc warning due
to the predefined #address-cells and #size-cells properties:

arch/arm/boot/dts/imx6qdl.dtsi:171.26-189.5: Warning (avoid_unnecessary_addr_size): /soc/gpmi-nand@112000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

I found no upstream imx6 baseboard using the old partitioning scheme, so
we can drop the two properties to avoid such warnings.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e51d72f044e2..e6b4b8525f98 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -171,8 +171,6 @@
 
 		gpmi: gpmi-nand@112000 {
 			compatible = "fsl,imx6q-gpmi-nand";
-			#address-cells = <1>;
-			#size-cells = <1>;
 			reg = <0x00112000 0x2000>, <0x00114000 0x2000>;
 			reg-names = "gpmi-nand", "bch";
 			interrupts = <0 15 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.20.1
