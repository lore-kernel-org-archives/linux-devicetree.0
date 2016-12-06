From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 4/6] arm: dts: aspeed-g5: Add LPC Controller node
Date: Tue,  6 Dec 2016 14:53:46 +1100
Message-ID: <20161206035348.29948-5-andrew@aj.id.au>
References: <20161206035348.29948-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161206035348.29948-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index c7ff3ea4bf37..1968607326dd 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -92,6 +92,7 @@
 				clocks = <&clk_apb>;
 			};
 
+
 			wdt1: wdt@1e785000 {
 				compatible = "aspeed,wdt";
 				reg = <0x1e785000 0x1c>;
@@ -121,6 +122,36 @@
 				status = "disabled";
 			};
 
+			lpc: lpc@1e789000 {
+				compatible = "aspeed,ast2500-lpc", "simple-mfd";
+				reg = <0x1e789000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x1e789000 0x1000>;
+
+				lpc_bmc: lpc-bmc@0 {
+					compatible = "aspeed,ast2500-lpc-bmc";
+					reg = <0x0 0x80>;
+				};
+
+				lpc_host: lpc-host@80 {
+					compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
+					reg = <0x80 0x1e0>;
+
+					#address-cells = <1>;
+					#size-cells = <1>;
+					ranges = <0 0x80 0x1e0>;
+
+					reg-io-width = <4>;
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
 				reg = <0x1e78d000 0x1000>;
-- 
2.9.3
