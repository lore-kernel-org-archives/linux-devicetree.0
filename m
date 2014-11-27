From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] ARM: shmobile: r8a7791: Correct mask for GIC PPI interrupts
Date: Thu, 27 Nov 2014 11:57:16 +0100
Message-ID: <1417085839-22836-2-git-send-email-geert+renesas@glider.be>
References: <1417085839-22836-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1417085839-22836-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

R-Car M2-W (r8a7791) contains two Cortex-A15 cores, hence the second
interrupt specifier cell for Private Peripheral Interrupts should use
"GIC_CPU_MASK_SIMPLE(2)".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on koelsch
---
 arch/arm/boot/dts/r8a7791.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 77c0beeb8d7c984c..6293d3aaf23822bc 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -78,7 +78,7 @@
 			<0 0xf1002000 0 0x1000>,
 			<0 0xf1004000 0 0x2000>,
 			<0 0xf1006000 0 0x2000>;
-		interrupts = <1 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <1 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
 	gpio0: gpio@e6050000 {
@@ -186,10 +186,10 @@
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts = <1 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <1 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <1 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <1 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <1 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <1 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <1 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <1 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
 	cmt0: timer@ffca0000 {
-- 
1.9.1

