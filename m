From: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
Subject: [PATCH 5/6] ARM: shmobile: r8a7791: Add JPU device node.
Date: Tue, 19 Aug 2014 16:50:52 +0400
Message-ID: <1408452653-14067-6-git-send-email-mikhail.ulyanov@cogentembedded.com>
References: <1408452653-14067-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1408452653-14067-1-git-send-email-mikhail.ulyanov@cogentembedded.com>
Sender: linux-media-owner@vger.kernel.org
To: m.chehab@samsung.com, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: laurent.pinchart@ideasonboard.com, linux-sh@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
---
 arch/arm/boot/dts/r8a7791.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index c2d0c6e..464962a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -637,6 +637,13 @@
 		status = "disabled";
 	};
 
+	jpu: jpeg-codec@fe980000 {
+		compatible = "renesas,jpu-r8a7791";
+		reg = <0 0xfe980000 0 0x10300>;
+		interrupts = <0 272 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7791_CLK_JPU>;
+	};
+
 	clocks {
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.1.0.rc1
