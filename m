From: Keiji Hayashibara <hayashibara.keiji@socionext.com>
Subject: [PATCH v2 2/3] ARM: dts: uniphier: add SPI node for UniPhier 32bit SoCs
Date: Thu, 26 Jul 2018 16:09:59 +0900
Message-ID: <1532589000-19602-3-git-send-email-hayashibara.keiji@socionext.com>
References: <1532589000-19602-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532589000-19602-1-git-send-email-hayashibara.keiji@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, yamada.masahiro@socionext.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, linux-kernel@vger.kernel.org, hayashibara.keiji@socionext.com, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Add nodes of SPI controller for LD4, Pro4, sLD8, Pro5 and PXs2.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-ld4.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro4.dtsi | 11 +++++++++++
 arch/arm/boot/dts/uniphier-pro5.dtsi | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-pxs2.dtsi | 22 ++++++++++++++++++++++
 arch/arm/boot/dts/uniphier-sld8.dtsi | 11 +++++++++++
 5 files changed, 77 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index 37950ad..b7849be 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -63,6 +63,17 @@
 			cache-level = <2>;
 		};
 
+		spi: spi@54006000 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006000 0x100>;
+			interrupts = <0 39 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi0>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
 		serial0: serial@54006800 {
 			compatible = "socionext,uniphier-uart";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 49539f0..4d20692 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -71,6 +71,17 @@
 			cache-level = <2>;
 		};
 
+		spi0: spi@54006000 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006000 0x100>;
+			interrupts = <0 39 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi0>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
 		serial0: serial@54006800 {
 			compatible = "socionext,uniphier-uart";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 06c2cef..02d837d 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -156,6 +156,28 @@
 			cache-level = <3>;
 		};
 
+		spi0: spi@54006000 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006000 0x100>;
+			interrupts = <0 39 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi0>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
+		spi1: spi@54006100 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006100 0x100>;
+			interrupts = <0 216 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi1>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
 		serial0: serial@54006800 {
 			compatible = "socionext,uniphier-uart";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 641d961..15b4f75 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -164,6 +164,28 @@
 			cache-level = <2>;
 		};
 
+		spi0: spi@54006000 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006000 0x100>;
+			interrupts = <0 39 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi0>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
+		spi1: spi@54006100 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006100 0x100>;
+			interrupts = <0 216 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi1>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
 		serial0: serial@54006800 {
 			compatible = "socionext,uniphier-uart";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index e9b9b4f..83f832b 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -63,6 +63,17 @@
 			cache-level = <2>;
 		};
 
+		spi: spi@54006000 {
+			compatible = "socionext,uniphier-scssi";
+			status = "disabled";
+			reg = <0x54006000 0x100>;
+			interrupts = <0 39 4>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spi0>;
+			clocks = <&peri_clk 11>;
+			resets = <&peri_rst 11>;
+		};
+
 		serial0: serial@54006800 {
 			compatible = "socionext,uniphier-uart";
 			status = "disabled";
-- 
2.7.4
