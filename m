From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 18/23] ARM: dts: lager: Fix W=1 dtc warnings
Date: Fri, 13 May 2016 09:55:58 +0200
Message-ID: <1463126163-29423-19-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /keyboard/button@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /keyboard/button@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /keyboard/button@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /keyboard/button@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /fixedregulator@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@1 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@2 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@3 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /regulator@4 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /i2c@8 has a unit name, but no reg property

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7790-lager.dts | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8a7790-lager.dts
index 749ba02b6a53a9de..c01e27868083147a 100644
--- a/arch/arm/boot/dts/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/r8a7790-lager.dts
@@ -76,28 +76,28 @@
 	keyboard {
 		compatible = "gpio-keys";
 
-		button@1 {
+		one {
 			linux,code = <KEY_1>;
 			label = "SW2-1";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
 		};
-		button@2 {
+		two {
 			linux,code = <KEY_2>;
 			label = "SW2-2";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
 		};
-		button@3 {
+		three {
 			linux,code = <KEY_3>;
 			label = "SW2-3";
 			wakeup-source;
 			debounce-interval = <20>;
 			gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
 		};
-		button@4 {
+		four {
 			linux,code = <KEY_4>;
 			label = "SW2-4";
 			wakeup-source;
@@ -119,7 +119,7 @@
 		};
 	};
 
-	fixedregulator3v3: fixedregulator@0 {
+	fixedregulator3v3: fixedregulator3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
 		regulator-min-microvolt = <3300000>;
@@ -128,7 +128,7 @@
 		regulator-always-on;
 	};
 
-	vcc_sdhi0: regulator@1 {
+	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI0 Vcc";
@@ -139,7 +139,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi0: regulator@2 {
+	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI0 VccQ";
@@ -152,7 +152,7 @@
 			  1800000 0>;
 	};
 
-	vcc_sdhi2: regulator@3 {
+	vcc_sdhi2: regulator-vcc-sdhi2 {
 		compatible = "regulator-fixed";
 
 		regulator-name = "SDHI2 Vcc";
@@ -163,7 +163,7 @@
 		enable-active-high;
 	};
 
-	vccq_sdhi2: regulator@4 {
+	vccq_sdhi2: regulator-vccq-sdhi2 {
 		compatible = "regulator-gpio";
 
 		regulator-name = "SDHI2 VccQ";
@@ -263,7 +263,7 @@
 	 * instantiate the slave device at runtime according to the documentation.
 	 * You can then communicate with the slave via IIC3.
 	 */
-	i2cexio: i2c@8 {
+	i2cexio: i2c-8 {
 		compatible = "i2c-demux-pinctrl";
 		i2c-parent = <&iic0>, <&i2c0>;
 		i2c-bus-name = "i2c-exio";
-- 
1.9.1
