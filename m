From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 10/20] ARM: dts: aspeed: Add PWM and tachometer node
Date: Mon, 11 Dec 2017 15:36:54 +1030
Message-ID: <20171211050704.20621-11-joel@jms.id.au>
References: <20171211050704.20621-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211050704.20621-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 9 +++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index fa52a01f50b5..f6fee40c04c0 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -189,6 +189,15 @@
 				clocks = <&syscon ASPEED_CLK_APB>;
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2400-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2400-vuart";
 				reg = <0x1e787000 0x40>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5e6db2aa5c23..96a9d2fe3f0d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,15 @@
 				status = "disabled";
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2500-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
-- 
2.14.1
