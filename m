From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] arm64: dts: allwinner: a64: bananapi-m64:
 Enable audio codec
Date: Mon, 26 Nov 2018 13:59:46 +0800
Message-ID: <20181126055946.20344-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBW4X53PQKGQEN2224TQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch enables audio via the SoC's internal audio codec. All
relevant device nodes are enabled, and the routing is set to match
the board design. MIC1 is routed to an onboard microphone, with MBIAS
providing power. MIC2 and HP are routed to the 3.5mm headset TRRS jack.
No phantom power is provided to the headset microphone.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index ef1c90401bb2..83e30e0afe5b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -97,6 +97,19 @@
 	};
 };
 
+&codec {
+	status = "okay";
+};
+
+&codec_analog {
+	hpvcc-supply = <&reg_eldo1>;
+	status = "okay";
+};
+
+&dai {
+	status = "okay";
+};
+
 &de {
 	status = "okay";
 };
@@ -326,6 +339,22 @@
 	vcc-hdmi-supply = <&reg_dldo1>;
 };
 
+&sound {
+	status = "okay";
+	simple-audio-card,widgets = "Headphone", "Headphone Jack",
+				    "Microphone", "Microphone Jack",
+				    "Microphone", "Onboard Microphone";
+	simple-audio-card,routing =
+			"Left DAC", "AIF1 Slot 0 Left",
+			"Right DAC", "AIF1 Slot 0 Right",
+			"AIF1 Slot 0 Left ADC", "Left ADC",
+			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Headphone Jack", "HP",
+			"MIC2", "Microphone Jack",
+			"Onboard Microphone", "MBIAS",
+			"MIC1", "Onboard Microphone";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.19.1
