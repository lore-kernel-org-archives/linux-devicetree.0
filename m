From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH] arm: dts: berlin2q: remove duplicated interrupt-parent
Date: Mon, 19 Oct 2015 15:17:19 +0800
Message-ID: <1445239039-2262-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: Jisheng Zhang <jszhang@marvell.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index 63a4849..a3ecde5 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -293,7 +293,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1400 0x100>;
-				interrupt-parent = <&aic>;
 				interrupts = <4>;
 				clocks = <&chip_clk CLKID_CFG>;
 				pinctrl-0 = <&twsi0_pmux>;
@@ -306,7 +305,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x1800 0x100>;
-				interrupt-parent = <&aic>;
 				interrupts = <5>;
 				clocks = <&chip_clk CLKID_CFG>;
 				pinctrl-0 = <&twsi1_pmux>;
@@ -505,7 +503,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x7000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <6>;
 				clocks = <&refclk>;
 				pinctrl-0 = <&twsi2_pmux>;
@@ -518,7 +515,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				reg = <0x8000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <7>;
 				clocks = <&refclk>;
 				pinctrl-0 = <&twsi3_pmux>;
@@ -529,7 +525,6 @@
 			uart0: uart@9000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x9000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <8>;
 				clocks = <&refclk>;
 				reg-shift = <2>;
@@ -541,7 +536,6 @@
 			uart1: uart@a000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0xa000 0x100>;
-				interrupt-parent = <&sic>;
 				interrupts = <9>;
 				clocks = <&refclk>;
 				reg-shift = <2>;
-- 
2.6.1
