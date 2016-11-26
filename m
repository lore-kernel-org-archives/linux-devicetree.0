From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] arm64: dts: uniphier: add SD-ctrl node for LD11 SoC
Date: Sun, 27 Nov 2016 03:10:53 +0900
Message-ID: <1480183853-1231-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The LD11 SoC is equipped with SD-ctrl (0x59810000) as well as
MIO-ctrl (0x5b3e0000).  The SD-ctrl block on this SoC has just
one register for controlling RST_n pin of the eMMC device.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 0e5c58f..7a62fb9 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -273,6 +273,17 @@
 			reg = <0x59801000 0x400>;
 		};
 
+		sdctrl@59810000 {
+			compatible = "socionext,uniphier-ld11-sdctrl",
+				     "simple-mfd", "syscon";
+			reg = <0x59810000 0x400>;
+
+			sd_rst: reset {
+				compatible = "socionext,uniphier-ld11-sd-reset";
+				#reset-cells = <1>;
+			};
+		};
+
 		perictrl@59820000 {
 			compatible = "socionext,uniphier-perictrl",
 				     "simple-mfd", "syscon";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
