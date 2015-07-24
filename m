From: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
Subject: [PATCH 1/2] ARM: shmobile: r8a7790: Add JPU device node.
Date: Fri, 24 Jul 2015 16:25:45 +0300
Message-ID: <1437744346-499-2-git-send-email-mikhail.ulyanov@cogentembedded.com>
References: <1437744346-499-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1437744346-499-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: laurent.pinchart@ideasonboard.com, sergei.shtylyov@cogentembedded.com, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This patch contains device tree node definition for JPEG codec peripheral
found in the Renesas R-Car r8a7790 SoC.

Signed-off-by: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
---
 arch/arm/boot/dts/r8a7790.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 3ae0c3b..e961352 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -872,6 +872,13 @@
 		status = "disabled";
 	};
 
+	jpu: jpeg-codec@fe980000 {
+		compatible = "renesas,jpu-r8a7790";
+		reg = <0 0xfe980000 0 0x10300>;
+		interrupts = <0 272 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7790_CLK_JPU>;
+	};
+
 	clocks {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.1.4

