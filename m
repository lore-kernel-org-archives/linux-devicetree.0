From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: rename PH1-LD10 to PH1-LD20
Date: Tue, 23 Feb 2016 13:40:21 +0900
Message-ID: <1456202421-10857-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Due to the company's awful projecting, this chip has been renamed to
PH1-LD20.  It has not been shipped yet, this change would not give
much impact on our customers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Olof, Arnd,

Please apply this patch along with my series
"[PATCH 0/9] ARM: uniphier: UniPhier updates for Linux 4.6-rc1".

If it goes to a different branch, it will cause a big merge conflict later.


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
index e5c8a20..727ae5f 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20-ref.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for UniPhier PH1-LD10 Reference Board
+ * Device Tree Source for UniPhier PH1-LD20 Reference Board
  *
  * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
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
index 84637eb..65e9651 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld10.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
@@ -1,5 +1,5 @@
 /*
- * Device Tree Source for UniPhier PH1-LD10 SoC
+ * Device Tree Source for UniPhier PH1-LD20 SoC
  *
  * Copyright (C) 2015 Masahiro Yamada <yamada.masahiro@socionext.com>
  *
@@ -43,7 +43,7 @@
  */
 
 / {
-	compatible = "socionext,ph1-ld10";
+	compatible = "socionext,ph1-ld20";
 	#address-cells = <2>;
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
@@ -268,7 +268,7 @@
 		};
 
 		pinctrl: pinctrl@5f801000 {
-			compatible = "socionext,ph1-ld10-pinctrl", "syscon";
+			compatible = "socionext,ph1-ld20-pinctrl", "syscon";
 			reg = <0x5f801000 0xe00>;
 		};
 
-- 
1.9.1
