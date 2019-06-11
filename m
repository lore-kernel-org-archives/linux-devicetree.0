Return-Path: <SRS0=x+Gy=UK=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/6] arm64: dts: renesas: hihope-common: Add USB 2.0 support
Date: Tue, 11 Jun 2019 14:06:37 +0100
Message-Id: <1560258401-9517-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

Add USB 2.0 support to the HiHope RZ/G2M.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 76 ++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 12047ee..18763ca 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -35,6 +35,17 @@
 		regulator-always-on;
 	};
 
+	vbus0_usb2: regulator-vbus0-usb2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "USB20_VBUS0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio6 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vccq_sdhi0: regulator-vccq-sdhi0 {
 		compatible = "regulator-gpio";
 
@@ -49,6 +60,14 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -57,6 +76,28 @@
 	clock-frequency = <32768>;
 };
 
+&gpio6 {
+	usb1-reset {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "usb1-reset";
+	};
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &pcie_bus_clk {
 	clock-frequency = <100000000>;
 };
@@ -92,6 +133,23 @@
 		function = "sdhi3";
 		power-source = <1800>;
 	};
+
+	usb0_pins: usb0 {
+		groups = "usb0";
+		function = "usb0";
+	};
+
+	usb1_pins: usb1 {
+		mux {
+			groups = "usb1";
+			function = "usb1";
+		};
+
+		ovc {
+			pins = "GP_6_27";
+			bias-pull-up;
+		};
+	};
 };
 
 &rwdt {
@@ -135,5 +193,23 @@
 	mmc-hs200-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
+};
+
+&usb_extal_clk {
+	clock-frequency = <50000000>;
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&vbus0_usb2>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
-- 
2.7.4
