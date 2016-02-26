From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 1/9] arm64: dts: uniphier: rename PH1-LD10 to PH1-LD20
Date: Fri, 26 Feb 2016 16:18:28 +0900
Message-ID: <1456471116-8140-2-git-send-email-yamada.masahiro@socionext.com>
References: <1456471116-8140-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456471116-8140-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Due to the company's awful projecting, this chip has been renamed to
PH1-LD20.  It has not been shipped yet, this change would have no
impact on our customers.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/boot/dts/socionext/Makefile                            | 2 +-
 .../{uniphier-ph1-ld10-ref.dts => uniphier-ph1-ld20-ref.dts}      | 8 ++++----
 .../socionext/{uniphier-ph1-ld10.dtsi => uniphier-ph1-ld20.dtsi}  | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename arch/arm64/boot/dts/socionext/{uniphier-ph1-ld10-ref.dts => uniphier-ph1-ld20-ref.dts} (92%)
 rename arch/arm64/boot/dts/socionext/{uniphier-ph1-ld10.dtsi => uniphier-ph1-ld20.dtsi} (98%)

diff --git a/arch/arm64/boot/dts/socionext/Makefile b/arch/arm64/boot/dts/socionext/Makefile
index 8d72771..299b67e 100644
--- a/arch/arm64/boot/dts/socionext/Makefile
+++ b/arch/arm64/boot/dts/socionext/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_UNIPHIER) += uniphier-ph1-ld10-ref.dtb
+dtb-$(CONFIG_ARCH_UNIPHIER) += uniphier-ph1-ld20-ref.dtb
 
 always		:= $(dtb-y)
 clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
similarity index 92%
rename from arch/arm64/boot/dts/socionext/uniphier-ph1-ld10-ref.dts
rename to arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
index 3e53317..80f71ba 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for UniPhier PH1-LD10 Reference Board
+ * Device Tree Source for UniPhier PH1-LD20 Reference Board
  *
  * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
  *
@@ -43,12 +43,12 @@
  */
 
 /dts-v1/;
-/include/ "uniphier-ph1-ld10.dtsi"
+/include/ "uniphier-ph1-ld20.dtsi"
 /include/ "uniphier-support-card.dtsi"
 
 / {
-	model = "UniPhier PH1-LD10 Reference Board";
-	compatible = "socionext,ph1-ld10-ref", "socionext,ph1-ld10";
+	model = "UniPhier PH1-LD20 Reference Board";
+	compatible = "socionext,ph1-ld20-ref", "socionext,ph1-ld20";
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/socionext/uniphier-ph1-ld10.dtsi
rename to arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
index 0296af9..e6871ea 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for UniPhier PH1-LD10 SoC
+ * Device Tree Source for UniPhier PH1-LD20 SoC
  *
  * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
  *
@@ -43,7 +43,7 @@
  */
 
 / {
-	compatible = "socionext,ph1-ld10";
+	compatible = "socionext,ph1-ld20";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
@@ -262,7 +262,7 @@
 		};
 
 		pinctrl: pinctrl@5f801000 {
-			compatible = "socionext,ph1-ld10-pinctrl", "syscon";
+			compatible = "socionext,ph1-ld20-pinctrl", "syscon";
 			reg = <0x5f801000 0xe00>;
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
