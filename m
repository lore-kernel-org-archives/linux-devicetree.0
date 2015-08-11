From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] enable HQVDP for stih410 platform
Date: Tue, 11 Aug 2015 17:12:44 +0200
Message-ID: <1439305964-15641-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>

Add HQVDP in stih410 devicetree to enable it.
HQVDP bindings have been describe in
Documentation/devicetree/bindings/gpu/st,stih4xx.txt file.

Signed-off-by: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih410.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stih410.dtsi b/arch/arm/boot/dts/stih410.dtsi
index 6620bba..33cc933 100644
--- a/arch/arm/boot/dts/stih410.dtsi
+++ b/arch/arm/boot/dts/stih410.dtsi
@@ -163,6 +163,16 @@
 				st,vtg = <&vtg_main>, <&vtg_aux>;
 			};
 
+			sti-hqvdp@9c000000 {
+				compatible = "st,stih407-hqvdp";
+				reg = <0x9C00000 0x100000>;
+				clock-names = "hqvdp", "pix_main";
+				clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>, <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
+				reset-names = "hqvdp";
+				resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
+				st,vtg = <&vtg_main>;
+			};
+
 			sti-tvout@8d08000 {
 				compatible = "st,stih407-tvout";
 				reg = <0x8d08000 0x1000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
