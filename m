From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH] arm64: dts: uniphier: add eMMC controller node for LD11/LD20
Date: Fri, 23 Dec 2016 12:18:23 +0900
Message-ID: <1482463103-28692-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add Cadence's eMMC controller node for LD11/LD20.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm/boot/dts/uniphier-pinctrl.dtsi          |  5 +++++
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 12 ++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pinctrl.dtsi b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
index 10a7110..be353af15 100644
--- a/arch/arm/boot/dts/uniphier-pinctrl.dtsi
+++ b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
@@ -43,6 +43,11 @@
  */
 
 &pinctrl {
+	pinctrl_emmc: emmc_grp {
+		groups = "emmc", "emmc_dat8";
+		function = "emmc";
+	};
+
 	pinctrl_i2c0: i2c0_grp {
 		groups = "i2c0";
 		function = "i2c0";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 43b6583..e1e45b4 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -300,6 +300,18 @@
 			};
 		};
 
+		emmc: sdhc@5a000000 {
+			compatible = "socionext,uniphier-sd4hc", "cdns,sd4hc";
+			reg = <0x5a000000 0x400>;
+			interrupts = <0 78 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_emmc>;
+			clocks = <&sys_clk 4>;
+			bus-width = <8>;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+		};
+
 		usb0: usb@5a800100 {
 			compatible = "socionext,uniphier-ehci", "generic-ehci";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index fcaecc6..1e61a04 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -374,6 +374,18 @@
 			};
 		};
 
+		emmc: sdhc@5a000000 {
+			compatible = "socionext,uniphier-sd4hc", "cdns,sd4hc";
+			reg = <0x5a000000 0x400>;
+			interrupts = <0 78 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_emmc>;
+			clocks = <&sys_clk 4>;
+			bus-width = <8>;
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+		};
+
 		soc-glue@5f800000 {
 			compatible = "socionext,uniphier-ld20-soc-glue",
 				     "simple-mfd", "syscon";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
