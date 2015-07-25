From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] ARM: dts: UniPhier: add pinctrl device nodes
Date: Sat, 25 Jul 2015 16:23:22 +0900
Message-ID: <1437809004-16806-2-git-send-email-yamada.masahiro@socionext.com>
References: <1437809004-16806-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437809004-16806-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the pinctrol device nodes for UniPhier PH1-LD4, PH1-Pro4,
and PH1-sLD8.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ph1-ld4.dtsi  | 6 ++++++
 arch/arm/boot/dts/uniphier-ph1-pro4.dtsi | 6 ++++++
 arch/arm/boot/dts/uniphier-ph1-sld8.dtsi | 6 ++++++
 3 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi b/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
index 600a473..518eab7 100644
--- a/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ph1-ld4.dtsi
@@ -148,6 +148,12 @@
 			interrupts = <0 82 4>;
 		};
 
+		pinctrl: pinctrl@5f801000 {
+			compatible = "socionext,ph1-ld4-pinctrl",
+				     "syscon";
+			reg = <0x5f801000 0xe00>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
diff --git a/arch/arm/boot/dts/uniphier-ph1-pro4.dtsi b/arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
index 4598bb2..789bd48 100644
--- a/arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ph1-pro4.dtsi
@@ -148,6 +148,12 @@
 			interrupts = <0 81 4>;
 		};
 
+		pinctrl: pinctrl@5f801000 {
+			compatible = "socionext,ph1-pro4-pinctrl",
+				     "syscon";
+			reg = <0x5f801000 0xe00>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
diff --git a/arch/arm/boot/dts/uniphier-ph1-sld8.dtsi b/arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
index 3255157..8dff3c4 100644
--- a/arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-ph1-sld8.dtsi
@@ -148,6 +148,12 @@
 			interrupts = <0 82 4>;
 		};
 
+		pinctrl: pinctrl@5f801000 {
+			compatible = "socionext,ph1-sld8-pinctrl",
+				     "syscon";
+			reg = <0x5f801000 0xe00>;
+		};
+
 		timer@60000200 {
 			compatible = "arm,cortex-a9-global-timer";
 			reg = <0x60000200 0x20>;
-- 
1.9.1
