From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 07/19] ARM: dts: aspeed: Add flash controller clocks
Date: Fri, 15 Dec 2017 16:54:31 +1030
Message-ID: <20171215062443.23059-8-joel@jms.id.au>
References: <20171215062443.23059-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215062443.23059-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 2e3666d4fbeb..afac0ca0cb10 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -56,6 +56,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <19>;
 			flash@0 {
@@ -71,6 +72,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 24bb2d16b900..f3689caf6fe2 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -56,6 +56,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <19>;
 			flash@0 {
@@ -81,6 +82,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
@@ -100,6 +102,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
-- 
2.14.1
