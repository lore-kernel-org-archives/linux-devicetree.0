From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 7/9] arm: dts: mt6589: Add arm arch timer node
Date: Mon, 18 Aug 2014 16:58:35 +0200
Message-ID: <1408373917-10002-8-git-send-email-matthias.bgg@gmail.com>
References: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, olof@lixom.net, arnd@arndb.de, jason@lakedaemon.net, thomas.petazzoni@free-electrons.com, swarren@nvidia.com, sebastian.hesselbarth@gmail.com, stefan@agner.ch, maxime.ripard@free-electrons.com, matthias.bgg@gmail.com, anders.berg@lsi.com, linus.walleij@linaro.org, lee.jones@linaro.org, heiko@sntech.de, srv_yingjoe.chen@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch adds the device tree node for the arm architecture timer.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/boot/dts/mt6589.dtsi |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
index 742c9bd..fb922a6 100644
--- a/arch/arm/boot/dts/mt6589.dtsi
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -73,14 +73,23 @@
 		compatible = "simple-bus";
 		ranges;
 
-		timer: timer@10008000 {
+		timer1: timer@10008000 {
 			compatible = "mediatek,mt6577-timer";
-			reg = <0x10008000 0x80>;
+			reg = <0x10008000 0x60>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&system_clk>, <&rtc_clk>;
 			clock-names = "system-clk", "rtc-clk";
 		};
 
+		timer2: timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			clock-frequency = <13000000>;
+		};
+
 		gic: interrupt-controller@10211000 {
 			compatible = "arm,cortex-a15-gic";
 			interrupt-controller;
-- 
1.7.9.5
