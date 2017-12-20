From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 07/20] ARM: dts: aspeed: Add flash controller clocks
Date: Wed, 20 Dec 2017 13:53:15 +1030
Message-ID: <20171220032328.30584-8-joel@jms.id.au>
References: <20171220032328.30584-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171220032328.30584-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 2 ++
 arch/arm/boot/dts/aspeed-g5.dtsi | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 2b1bb31ce390..36cb66d8cc10 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -55,6 +55,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <19>;
 			flash@0 {
@@ -70,6 +71,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2400-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 95bb04e4cee2..156b345ff20d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -55,6 +55,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-fmc";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <19>;
 			flash@0 {
@@ -80,6 +81,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
@@ -99,6 +101,7 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 			compatible = "aspeed,ast2500-spi";
+			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			flash@0 {
 				reg = < 0 >;
-- 
2.15.1
