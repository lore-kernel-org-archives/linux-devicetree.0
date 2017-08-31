From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v1 3/3] arm64: dts: uniphier: add efuse node for LD20
Date: Fri,  1 Sep 2017 08:20:20 +0900
Message-ID: <1504221620-358-4-git-send-email-hayashibara.keiji@socionext.com>
References: <1504221620-358-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504221620-358-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add efuse node for UniPhier LD20 SoC.
This efuse node is included in soc-glue.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index de1e753..8a1f5af 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -365,6 +365,20 @@
 			};
 		};
 
+		soc-glue@5f900000 {
+			compatible = "socionext,uniphier-ld20-soc-glue-debug",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x5f900000 0x2000>;
+
+			efuse {
+				compatible = "socionext,uniphier-efuse",
+					     "syscon";
+				reg = <0x100 0xf00>;
+			};
+		};
+
 		gic: interrupt-controller@5fe00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x5fe00000 0x10000>,	/* GICD */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
