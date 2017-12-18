From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/5] ARM: dts: iwg20d-q7-common: Sound PIO support
Date: Mon, 18 Dec 2017 18:22:37 +0000
Message-ID: <1513621361-10944-2-git-send-email-biju.das@bp.renesas.com>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Enable sound PIO support on carrier board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1-->v2
 * Reworked sorting

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 46 +++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 2070b14..ed67201 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -34,6 +34,22 @@
 		regulator-always-on;
 	};
 
+	rsnd_sgtl5000: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sndcodec>;
+		simple-audio-card,frame-master = <&sndcodec>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
+		};
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
@@ -166,6 +182,11 @@
 		power-source = <1800>;
 	};
 
+	sound_pins: sound {
+		groups = "ssi0129_ctrl", "ssi0_data", "ssi1_data";
+		function = "ssi";
+	};
+
 	usb0_pins: usb0 {
 		groups = "usb0";
 		function = "usb0";
@@ -177,6 +198,22 @@
 	};
 };
 
+&rcar_sound {
+	pinctrl-0 = <&sound_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	rcar_sound,dai {
+		dai0 {
+			playback = <&ssi1>;
+			capture = <&ssi0>;
+		};
+	};
+};
+
 &scif0 {
 	pinctrl-0 = <&scif0_pins>;
 	pinctrl-names = "default";
@@ -205,6 +242,15 @@
 	status = "okay";
 };
 
+&ssi0 {
+	pio-transfer;
+};
+
+&ssi1 {
+	pio-transfer;
+	shared-pin;
+};
+
 &usbphy {
 	status = "okay";
 };
-- 
1.9.1
