From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 2/8] ARM: dts: aspeed: Reorder ADC node
Date: Thu, 28 Sep 2017 17:21:43 +0930
Message-ID: <20170928075149.8154-3-joel@jms.id.au>
References: <20170928075149.8154-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170928075149.8154-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, Rick Altherr <raltherr@google.com>, Brendan Higgins <brendanhiggins@google.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

We try to keep the nodes in address order. The ADC node was out of
place.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 16 ++++++++--------
 arch/arm/boot/dts/aspeed-g5.dtsi | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 1edd0cee6221..a4579498fc25 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -129,6 +129,14 @@
 				};
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2400-adc";
+				reg = <0x1e6e9000 0xb0>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				#io-channel-cells = <1>;
+				status = "disabled";
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x8000>;	// 32K
@@ -227,14 +235,6 @@
 				no-loopback-test;
 				status = "disabled";
 			};
-
-			adc: adc@1e6e9000 {
-				compatible = "aspeed,ast2400-adc";
-				reg = <0x1e6e9000 0xb0>;
-				clocks = <&clk_apb>;
-				#io-channel-cells = <1>;
-				status = "disabled";
-			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index f56dd67efa50..f6430b313f90 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -173,6 +173,14 @@
 				reg-io-width = <4>;
 			};
 
+			adc: adc@1e6e9000 {
+				compatible = "aspeed,ast2500-adc";
+				reg = <0x1e6e9000 0xb0>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				#io-channel-cells = <1>;
+				status = "disabled";
+			};
+
 			sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
@@ -307,14 +315,6 @@
 				no-loopback-test;
 				status = "disabled";
 			};
-
-			adc: adc@1e6e9000 {
-				compatible = "aspeed,ast2500-adc";
-				reg = <0x1e6e9000 0xb0>;
-				clocks = <&clk_apb>;
-				#io-channel-cells = <1>;
-				status = "disabled";
-			};
 		};
 	};
 };
-- 
2.14.1
