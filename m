From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: [PATCH] ARM: dts: socfpga: use tabs for indentation
Date: Mon,  5 Nov 2018 21:39:00 +0100
Message-ID: <20181105203900.23788-1-simon.k.r.goldschmidt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
List-Id: devicetree@vger.kernel.org

In two of the gen5 socfpga devicetree files, there are some lines
indented using spaces instead of tabs.

Fix this by correctly indenting them with tabs.

Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
---
 arch/arm/boot/dts/socfpga.dtsi               | 2 +-
 arch/arm/boot/dts/socfpga_cyclone5_sodia.dts | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 2458d6707dc5..0a028254b14e 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -759,7 +759,7 @@
 
 		qspi: spi@ff705000 {
 			compatible = "cdns,qspi-nor";
-                        #address-cells = <1>;
+			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0xff705000 0x1000>,
 			      <0xffa00000 0x1000>;
diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sodia.dts b/arch/arm/boot/dts/socfpga_cyclone5_sodia.dts
index e54b5f2af74f..99a71757cdf4 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_sodia.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_sodia.dts
@@ -111,9 +111,9 @@
 };
 
 &qspi {
-        status = "okay";
+	status = "okay";
 
-        flash0: n25q512a@0 {
+	flash0: n25q512a@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "n25q512a";
-- 
2.17.1
