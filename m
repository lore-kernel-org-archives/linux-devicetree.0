From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH RESEND] arm: dts: berlin2q: remove duplicated interrupt-parent
Date: Mon, 16 Nov 2015 18:46:31 +0800
Message-ID: <1447670791-7874-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

The default interrupt-parent has been set in the upper layer, apb@e80000
and apb@fc0000 for example. So if the interrupt-parent isn't changed, we
don't need to set it again. This patch removes the dumplicated
interrupt-parent settings.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 8ea177f..155430a 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -309,7 +309,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1400 0x100>;
-				interrupt-parent = <&aic>;
 				interrupts = <4>;
 				clocks = <&chip_clk CLKID_CFG>;
 				pinctrl-0 = <&twsi0_pmux>;
@@ -322,7 +321,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1800 0x100>;
-				interrupt-parent = <&aic>;
 				interrupts = <5>;
 				clocks = <&chip_clk CLKID_CFG>;
 				pinctrl-0 = <&twsi1_pmux>;
@@ -528,7 +526,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x7000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <6>;
 				clocks = <&refclk>;
 				pinctrl-0 = <&twsi2_pmux>;
@@ -541,7 +538,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x8000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <7>;
 				clocks = <&refclk>;
 				pinctrl-0 = <&twsi3_pmux>;
@@ -552,7 +548,6 @@
 			uart0: uart@9000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x9000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <8>;
 				clocks = <&refclk>;
 				reg-shift = <2>;
@@ -564,7 +559,6 @@
 			uart1: uart@a000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0xa000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <9>;
 				clocks = <&refclk>;
 				reg-shift = <2>;
-- 
2.6.2
