From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 3/3] arm64: dts: uniphier: add efuse node for LD20
Date: Fri,  6 Oct 2017 14:03:00 +0900
Message-ID: <1507266180-11840-4-git-send-email-hayashibara.keiji@socionext.com>
References: <1507266180-11840-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266180-11840-1-git-send-email-hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add efuse node for UniPhier LD20 SoC.
This efuse node is included in soc-glue.

Signed-off-by: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index a29c279..ddefde6 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -376,6 +376,24 @@
 			};
 		};
 
+		soc-glue@5f900000 {
+			compatible = "socionext,uniphier-ld20-soc-glue-debug",
+				     "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x5f900000 0x2000>;
+
+			efuse@100 {
+				compatible = "socionext,uniphier-efuse";
+				reg = <0x100 0x28>;
+			};
+
+			efuse@200 {
+				compatible = "socionext,uniphier-efuse";
+				reg = <0x200 0x68>;
+			};
+		};
+
 		aidet: aidet@5fc20000 {
 			compatible = "socionext,uniphier-ld20-aidet";
 			reg = <0x5fc20000 0x200>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
