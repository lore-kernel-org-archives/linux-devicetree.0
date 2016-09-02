From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
Date: Fri,  2 Sep 2016 15:05:33 +0300
Message-ID: <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports SSI sound for H3ULCB board.
SSI DMA mode used. CS2000 used as AUDIO_CLK_B.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Changes in version 3:
- initially added
Changes in version 4:
- added comment for audio_clkout

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 +++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index bbd7928..a254231 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -45,6 +45,12 @@
 		};
 	};
 
+	x12_clk: x12_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24576000>;
+	};
+
 	vcc_sdhi0: regulator-vcc-sdhi0 {
 		compatible = "regulator-fixed";
 
@@ -68,6 +74,32 @@
 		states = <3300000 1
 			  1800000 0>;
 	};
+
+	audio_clkout: audio_clkout {
+		/*
+		 * This is same as <&rcar_sound 0>
+		 * but needed to avoid cs2000/rcar_sound probe dead-lock
+		 */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <11289600>;
+	};
+
+	rsnd_ak4613: sound {
+		compatible = "simple-audio-card";
+
+		simple-audio-card,format = "left_j";
+		simple-audio-card,bitclock-master = <&sndcpu>;
+		simple-audio-card,frame-master = <&sndcpu>;
+
+		sndcpu: simple-audio-card,cpu {
+			sound-dai = <&rcar_sound>;
+		};
+
+		sndcodec: simple-audio-card,codec {
+			sound-dai = <&ak4613>;
+		};
+	};
 };
 
 &extal_clk {
@@ -113,6 +141,17 @@
 		power-source = <1800>;
 	};
 
+	sound_pins: sound {
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		function = "ssi";
+	};
+
+	sound_clk_pins: sound_clk {
+		groups = "audio_clk_a_a", "audio_clk_b_a", "audio_clk_c_a",
+			 "audio_clkout_a", "audio_clkout3_a";
+		function = "audio_clk";
+	};
+
 	usb1_pins: usb1 {
 		groups = "usb1";
 		function = "usb1";
@@ -136,6 +176,73 @@
 	pinctrl-names = "default";
 
 	status = "okay";
+
+	clock-frequency = <100000>;
+
+	ak4613: codec@10 {
+		compatible = "asahi-kasei,ak4613";
+		#sound-dai-cells = <0>;
+		reg = <0x10>;
+		clocks = <&rcar_sound 3>;
+
+		asahi-kasei,in1-single-end;
+		asahi-kasei,in2-single-end;
+		asahi-kasei,out1-single-end;
+		asahi-kasei,out2-single-end;
+		asahi-kasei,out3-single-end;
+		asahi-kasei,out4-single-end;
+		asahi-kasei,out5-single-end;
+		asahi-kasei,out6-single-end;
+	};
+
+	cs2000: clk_multiplier@4f {
+		#clock-cells = <0>;
+		compatible = "cirrus,cs2000-cp";
+		reg = <0x4f>;
+		clocks = <&audio_clkout>, <&x12_clk>;
+		clock-names = "clk_in", "ref_clk";
+
+		assigned-clocks = <&cs2000>;
+		assigned-clock-rates = <24576000>; /* 1/1 divide */
+	};
+};
+
+&rcar_sound {
+	pinctrl-0 = <&sound_pins &sound_clk_pins>;
+	pinctrl-names = "default";
+
+	/* Single DAI */
+	#sound-dai-cells = <0>;
+
+	/* audio_clkout0/1/2/3 */
+	#clock-cells = <1>;
+	clock-frequency = <11289600>;
+
+	status = "okay";
+
+	/* update <audio_clk_b> to <cs2000> */
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&audio_clk_a>, <&cs2000>,
+		 <&audio_clk_c>,
+		 <&cpg CPG_CORE R8A7795_CLK_S0D4>;
+
+	rcar_sound,dai {
+		dai0 {
+			playback = <&ssi0 &src0 &dvc0>;
+			capture  = <&ssi1 &src1 &dvc1>;
+		};
+	};
 };
 
 &sdhi0 {
@@ -150,11 +257,19 @@
 	status = "okay";
 };
 
+&ssi1 {
+	shared-pin;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
 };
 
+&audio_clk_a {
+	clock-frequency = <22579200>;
+};
+
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
