From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] arm64: dts: allwinner: a64: Fix the video engine compatible
Date: Mon, 10 Dec 2018 11:14:29 +0100
Message-ID: <20181210101429.21512-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

When introducing the video-codec node for the video engine, the
compatible for the H5 was used instead of the compatible for the
A64. Use the right compatible instead.

Fixes: d60ce24740d2 ("arm64: dts: allwinner: a64: Add Video Engine node")
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 837a03dee875..2abb335145a6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -390,7 +390,7 @@
 		};
 
 		video-codec@1c0e000 {
-			compatible = "allwinner,sun50i-h5-video-engine";
+			compatible = "allwinner,sun50i-a64-video-engine";
 			reg = <0x01c0e000 0x1000>;
 			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
 				 <&ccu CLK_DRAM_VE>;
-- 
2.19.2
