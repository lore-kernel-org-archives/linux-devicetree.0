From: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: [PATCH 1/2] ARM: dts: ls1021a: Remove unused properties from QSPI
 node
Date: Wed, 20 Mar 2019 14:38:02 +0000
Message-ID: <20190320143800.3555-1-frieder.schrempf@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

After switching to the new FSL QSPI driver the properties
'fsl,qspi-has-second-chip' and 'big-endian' are not used anymore.

The driver now uses the 'reg' property to determine the bus and
the chipselect. The endianness is selected by the driver depending
on which SoC is used.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts | 1 -
 arch/arm/boot/dts/ls1021a.dtsi              | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
index ba1ddd93b8f8..dcb1d9bd0922 100644
--- a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
@@ -204,7 +204,6 @@
 };
 
 &qspi {
-	fsl,qspi-has-second-chip;
 	status = "okay";
 
 	flash: flash@0 {
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index b4f2723ecd86..2bcc00de88d4 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -186,7 +186,6 @@
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "qspi_en", "qspi";
 			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
-			big-endian;
 			status = "disabled";
 		};
 
-- 
2.17.1
