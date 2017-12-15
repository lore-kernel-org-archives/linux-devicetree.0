From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 03/19] ARM: dts: aspeed: Add LPC and child devices
Date: Fri, 15 Dec 2017 16:54:27 +1030
Message-ID: <20171215062443.23059-4-joel@jms.id.au>
References: <20171215062443.23059-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171215062443.23059-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Andrew Jeffery <andrew@aj.id.au>

Ensure the ordering is correct and add all of the children in the SoC
device trees for the ast2400 and ast2500.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 35 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 27 +++++++++++++++++----------
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 100d092e6c07..a3bc5da7d42c 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -226,6 +226,41 @@
 				status = "disabled";
 			};
 
+			lpc: lpc@1e789000 {
+				compatible = "aspeed,ast2400-lpc", "simple-mfd";
+				reg = <0x1e789000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e789000 0x1000>;
+
+				lpc_bmc: lpc-bmc@0 {
+					compatible = "aspeed,ast2400-lpc-bmc";
+					reg = <0x0 0x80>;
+				};
+
+				lpc_host: lpc-host@80 {
+					compatible = "aspeed,ast2400-lpc-host", "simple-mfd", "syscon";
+					reg = <0x80 0x1e0>;
+					reg-io-width = <4>;
+
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0x0 0x80 0x1e0>;
+
+					lpc_ctrl: lpc-ctrl@0 {
+						compatible = "aspeed,ast2400-lpc-ctrl";
+						reg = <0x0 0x80>;
+						status = "disabled";
+					};
+
+					lhc: lhc@20 {
+						compatible = "aspeed,ast2500-lhc";
+						reg = <0x20 0x24 0x48 0x8>;
+					};
+				};
+			};
+
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 1f9d28313f82..7861631940fe 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -266,6 +266,16 @@
 				status = "disabled";
 			};
 
+			vuart: serial@1e787000 {
+				compatible = "aspeed,ast2500-vuart";
+				reg = <0x1e787000 0x40>;
+				reg-shift = <2>;
+				interrupts = <10>;
+				clocks = <&clk_uart>;
+				no-loopback-test;
+				status = "disabled";
+			};
+
 			lpc: lpc@1e789000 {
 				compatible = "aspeed,ast2500-lpc", "simple-mfd";
 				reg = <0x1e789000 0x1000>;
@@ -289,6 +299,13 @@
 
 					reg-io-width = <4>;
 
+					lpc_ctrl: lpc-ctrl@0 {
+						compatible = "aspeed,ast2500-lpc-ctrl";
+						reg = <0x0 0x80>;
+						status = "disabled";
+					};
+
+
 					lhc: lhc@20 {
 						compatible = "aspeed,ast2500-lhc";
 						reg = <0x20 0x24 0x48 0x8>;
@@ -296,16 +313,6 @@
 				};
 			};
 
-			vuart: serial@1e787000 {
-				compatible = "aspeed,ast2500-vuart";
-				reg = <0x1e787000 0x40>;
-				reg-shift = <2>;
-				interrupts = <10>;
-				clocks = <&clk_uart>;
-				no-loopback-test;
-				status = "disabled";
-			};
-
 			uart2: serial@1e78d000 {
 				compatible = "ns16550a";
 				reg = <0x1e78d000 0x20>;
-- 
2.14.1
