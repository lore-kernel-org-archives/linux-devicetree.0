From: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: da850-lcdk: Audio support via simple-card
Date: Wed, 10 Aug 2016 20:08:52 +0000
Message-ID: <20160810200853.24275-1-kbeldan@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Karl Beldan <karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The LCDK embeds a TLV320AIC3106 connected to the SoC McASP for analog
audio. This relies on the 'dummy' regulator as the codec is always on.
Quality is good with arecord -pipe- aplay on Line In/Line Out.
The MIC path doesn't seem to work yet.

Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/da850-lcdk.dts | 75 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index dbcca0b..35b31d9 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include "da850.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/tlv320aic31xx-micbias.h>
 
 / {
 	model = "DA850/AM1808/OMAP-L138 LCDK";
@@ -23,10 +24,50 @@
 		device_type = "memory";
 		reg = <0xc0000000 0x08000000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "DA850/OMAP-L138 LCDK";
+		simple-audio-card,widgets =
+			"Microphone", "Mic Jack",
+			"Line", "Line In",
+			"Line", "Line Out";
+		simple-audio-card,routing =
+			"MIC3L", "Mic Jack",
+			"MIC3R", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In",
+			"Line Out", "LLOUT",
+			"Line Out", "RLOUT";
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,bitclock-master = <&link0_codec>;
+		simple-audio-card,frame-master = <&link0_codec>;
+		simple-audio-card,bitclock-inversion;
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+			system-clock-frequency = <24576000>;
+		};
+
+		link0_codec: simple-audio-card,codec {
+			sound-dai = <&tlv320aic3106>;
+			system-clock-frequency = <24576000>;
+		};
+	};
 };
 
 &pmx_core {
 	status = "okay";
+
+	mcasp0_pins: pinmux_mcasp0_pins {
+		pinctrl-single,bits = <
+			/* AHCLKX AFSX ACLKX */
+			0x00 0x00101010 0x00f0f0f0
+			/* ARX13 ARX14 */
+			0x04 0x00000110 0x00000ff0
+		>;
+	};
 };
 
 &serial2 {
@@ -68,3 +109,37 @@
 	cd-gpios = <&gpio 64 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	clock-frequency = <100000>;
+	status = "okay";
+
+	tlv320aic3106: tlv320aic3106@18 {
+		#sound-dai-cells = <0>;
+		compatible = "ti,tlv320aic3106";
+		reg = <0x18>;
+		status = "okay";
+
+		ai3x-micbias-vg = <MICBIAS_2_5V>;
+	};
+};
+
+&mcasp0 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+	status = "okay";
+
+	op-mode = <0>;   /* DAVINCI_MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	serial-dir = <   /* 0: INACTIVE, 1: TX, 2: RX */
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+		0 1 2 0
+	>;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+};
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
