From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] arm: zynq: Remove #address/#size-cells from gpio-keys
Date: Tue, 17 Jul 2018 16:57:23 +0200
Message-ID: <af809c1d98451a14b981f8d2cc123b2e1016021c.1531839440.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-kernel@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Albert Aribaud <albert.u.boot@aribaud.net>, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

dts reports incorrect usage of these properties in gpio-keys node.
Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary

The patch is removing these useless properties.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm/boot/dts/zynq-zc702.dts | 2 --
 arch/arm/boot/dts/zynq-zturn.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 6653e34409cd..cc5a3dc2b4a0 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -29,8 +29,6 @@
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 		sw14 {
 			label = "sw14";
diff --git a/arch/arm/boot/dts/zynq-zturn.dts b/arch/arm/boot/dts/zynq-zturn.dts
index b25beaed874d..b38704657960 100644
--- a/arch/arm/boot/dts/zynq-zturn.dts
+++ b/arch/arm/boot/dts/zynq-zturn.dts
@@ -49,8 +49,6 @@
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
 		K1 {
 			label = "K1";
-- 
1.9.1
