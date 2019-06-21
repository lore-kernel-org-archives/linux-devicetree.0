From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: dts: uniphier: update to new Denali NAND binding
Date: Fri, 21 Jun 2019 19:53:16 +0900
Message-ID: <20190621105316.22201-1-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

With commit d8e8fd0ebf8b ("mtd: rawnand: denali: decouple controller
and NAND chips"), the Denali NAND controller driver migrated to the
new controller/chip representation.

Update DT for it.

In the new binding, the number of connected chips are described in
DT instead of run-time probed.

I added just one chip to the reference boards, where we do not know
if the on-board NAND device is a single chip or multiple chips.
If we added too many chips into DT, it would end up with the timeout
error in nand_scan_ident().

I changed all the pinctrl properties to use the single CS.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ld4-ref.dts  | 4 ++++
 arch/arm/boot/dts/uniphier-ld4.dtsi     | 4 +++-
 arch/arm/boot/dts/uniphier-ld6b-ref.dts | 4 ++++
 arch/arm/boot/dts/uniphier-pro4-ref.dts | 4 ++++
 arch/arm/boot/dts/uniphier-pro4.dtsi    | 2 ++
 arch/arm/boot/dts/uniphier-pro5.dtsi    | 4 +++-
 arch/arm/boot/dts/uniphier-pxs2.dtsi    | 4 +++-
 arch/arm/boot/dts/uniphier-sld8-ref.dts | 4 ++++
 arch/arm/boot/dts/uniphier-sld8.dtsi    | 4 +++-
 9 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ld4-ref.dts b/arch/arm/boot/dts/uniphier-ld4-ref.dts
index 3aaca10f6644..f2d060f403cc 100644
--- a/arch/arm/boot/dts/uniphier-ld4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld4-ref.dts
@@ -77,4 +77,8 @@
 
 &nand {
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+	};
 };
diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index c2706cef0b8a..58cd4e8fa5be 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -403,9 +403,11 @@
 			status = "disabled";
 			reg-names = "nand_data", "denali_reg";
 			reg = <0x68000000 0x20>, <0x68100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_nand2cs>;
+			pinctrl-0 = <&pinctrl_nand>;
 			clock-names = "nand", "nand_x", "ecc";
 			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
diff --git a/arch/arm/boot/dts/uniphier-ld6b-ref.dts b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
index 3d9080ee7aef..60994b6e8b99 100644
--- a/arch/arm/boot/dts/uniphier-ld6b-ref.dts
+++ b/arch/arm/boot/dts/uniphier-ld6b-ref.dts
@@ -90,4 +90,8 @@
 
 &nand {
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+	};
 };
diff --git a/arch/arm/boot/dts/uniphier-pro4-ref.dts b/arch/arm/boot/dts/uniphier-pro4-ref.dts
index 28038b17bbb3..854f2eba3e72 100644
--- a/arch/arm/boot/dts/uniphier-pro4-ref.dts
+++ b/arch/arm/boot/dts/uniphier-pro4-ref.dts
@@ -98,4 +98,8 @@
 
 &nand {
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+	};
 };
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 97d051ef4968..7f64e5a616d6 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -593,6 +593,8 @@
 			status = "disabled";
 			reg-names = "nand_data", "denali_reg";
 			reg = <0x68000000 0x20>, <0x68100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 365738739412..eff74717b37c 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -458,9 +458,11 @@
 			status = "disabled";
 			reg-names = "nand_data", "denali_reg";
 			reg = <0x68000000 0x20>, <0x68100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_nand2cs>;
+			pinctrl-0 = <&pinctrl_nand>;
 			clock-names = "nand", "nand_x", "ecc";
 			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index 06a049f6edf8..4eddbb8d7fca 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -766,9 +766,11 @@
 			status = "disabled";
 			reg-names = "nand_data", "denali_reg";
 			reg = <0x68000000 0x20>, <0x68100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_nand2cs>;
+			pinctrl-0 = <&pinctrl_nand>;
 			clock-names = "nand", "nand_x", "ecc";
 			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
diff --git a/arch/arm/boot/dts/uniphier-sld8-ref.dts b/arch/arm/boot/dts/uniphier-sld8-ref.dts
index 01bf94c6b93a..cf9ea0b15065 100644
--- a/arch/arm/boot/dts/uniphier-sld8-ref.dts
+++ b/arch/arm/boot/dts/uniphier-sld8-ref.dts
@@ -81,4 +81,8 @@
 
 &nand {
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+	};
 };
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index efce02768b6f..cbebb6e4c616 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -407,9 +407,11 @@
 			status = "disabled";
 			reg-names = "nand_data", "denali_reg";
 			reg = <0x68000000 0x20>, <0x68100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 			interrupts = <0 65 4>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pinctrl_nand2cs>;
+			pinctrl-0 = <&pinctrl_nand>;
 			clock-names = "nand", "nand_x", "ecc";
 			clocks = <&sys_clk 2>, <&sys_clk 3>, <&sys_clk 3>;
 			resets = <&sys_rst 2>;
-- 
2.17.1
