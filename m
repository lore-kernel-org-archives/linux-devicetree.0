From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 09/20] ARM: dts: aspeed: Add PWM and tachometer node
Date: Wed, 20 Dec 2017 13:53:17 +1030
Message-ID: <20171220032328.30584-10-joel@jms.id.au>
References: <20171220032328.30584-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171220032328.30584-1-joel@jms.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Patrick Venture <venture@google.com>, Xo Wang <xow@google.com>, Lei YU <mine260309@gmail.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The PWM/tach unit has a clock and reset phandle. It needs both in order
to function correctly.

Signed-off-by: Joel Stanley <joel@jms.id.au>
--
v3:
 Add the pwm reset phandle
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 10 ++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index d2a82850b05b..91aea96c10c8 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -189,6 +189,16 @@
 				clocks = <&syscon ASPEED_CLK_APB>;
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2400-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				resets = <&syscon ASPEED_RESET_PWM>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2400-vuart";
 				reg = <0x1e787000 0x40>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 3a25fa48d4f6..af3869ec87bb 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,16 @@
 				status = "disabled";
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2500-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				resets = <&syscon ASPEED_RESET_PWM>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
-- 
2.15.1
