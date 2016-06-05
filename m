From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: sun7i: HDMI and the tv-encoder use tcon ch1 not ch0
Date: Sun,  5 Jun 2016 14:22:48 +0200
Message-ID: <1465129368-22335-2-git-send-email-hdegoede@redhat.com>
References: <1465129368-22335-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465129368-22335-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update the simplefb nodes for hdmi / tv-encoder out to point to
tcon0_ch1 instead of tcon0_ch0 as tcon clock.

While at it fix the clocks lines being longer then 80 chars.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 82e28c3..b9268d9 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -67,8 +67,9 @@
 			compatible = "allwinner,simple-framebuffer",
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0-hdmi";
-			clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>,
-				 <&de_be0_clk>, <&tcon0_ch0_clk>, <&dram_gates 26>;
+			clocks = <&ahb_gates 36>, <&ahb_gates 43>,
+				 <&ahb_gates 44>, <&de_be0_clk>,
+				 <&tcon0_ch1_clk>, <&dram_gates 26>;
 			status = "disabled";
 		};
 
@@ -86,8 +87,9 @@
 			compatible = "allwinner,simple-framebuffer",
 				     "simple-framebuffer";
 			allwinner,pipeline = "de_be0-lcd0-tve0";
-			clocks = <&ahb_gates 34>, <&ahb_gates 36>, <&ahb_gates 44>,
-				 <&de_be0_clk>, <&tcon0_ch0_clk>,
+			clocks = <&ahb_gates 34>, <&ahb_gates 36>,
+				 <&ahb_gates 44>,
+				 <&de_be0_clk>, <&tcon0_ch1_clk>,
 				 <&dram_gates 5>, <&dram_gates 26>;
 			status = "disabled";
 		};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
