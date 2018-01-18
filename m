From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: uniphier: add AVE ethernet node
Date: Thu, 18 Jan 2018 21:48:09 +0900
Message-ID: <1516279689-3119-3-git-send-email-hayashi.kunihiko@socionext.com>
References: <1516279689-3119-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516279689-3119-1-git-send-email-hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add nodes of the AVE ethernet controller for LD11 and LD20 SoCs
and the boards.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts    | 15 +++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi       | 10 ++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts    | 15 +++++++++++++++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi       | 12 ++++++++++++
 6 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
index 2452b22..60de0b0 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
@@ -72,3 +72,18 @@
 &nand {
 	status = "okay";
 };
+
+&ether {
+	status = "okay";
+	local-mac-address = [00 00 00 00 00 00];
+	phy-handle = <&ethphy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethphy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
index 54c5317..e6e8477 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
@@ -70,3 +70,18 @@
 &usb2 {
 	status = "okay";
 };
+
+&ether {
+	status = "okay";
+	local-mac-address = [00 00 00 00 00 00];
+	phy-handle = <&ethphy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethphy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index cd7c2d0..862a618 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -460,6 +460,16 @@
 			};
 		};
 
+		ether: ethernet@65000000 {
+			compatible = "socionext,uniphier-ld11-ave4";
+			status = "disabled";
+			reg = <0x65000000 0x8500>;
+			interrupts = <0 66 4>;
+			clocks = <&sys_clk 6>;
+			resets = <&sys_rst 6>;
+			phy-mode = "rmii";
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
index fc2bc9d..6566fd5 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts
@@ -54,3 +54,20 @@
 &nand {
 	status = "okay";
 };
+
+&ether {
+	status = "okay";
+	local-mac-address = [00 00 00 00 00 00];
+	phy-mode = "rmii";
+	pinctrl-0 = <&pinctrl_ether_rmii>;
+	phy-handle = <&ethphy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethphy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
index 6933710..6f971c6 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
@@ -58,3 +58,18 @@
 &i2c0 {
 	status = "okay";
 };
+
+&ether {
+	status = "okay";
+	local-mac-address = [00 00 00 00 00 00];
+	phy-handle = <&ethphy>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethphy@0 {
+			reg = <0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 8a3276b..3edcd54 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -513,6 +513,18 @@
 			};
 		};
 
+		ether: ethernet@65000000 {
+			compatible = "socionext,uniphier-ld20-ave4";
+			status = "disabled";
+			reg = <0x65000000 0x8500>;
+			interrupts = <0 66 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_ether_rgmii>;
+			clocks = <&sys_clk 6>;
+			resets = <&sys_rst 6>;
+			phy-mode = "rgmii";
+		};
+
 		nand: nand@68000000 {
 			compatible = "socionext,uniphier-denali-nand-v5b";
 			status = "disabled";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
