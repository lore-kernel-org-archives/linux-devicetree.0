From: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6ul-pico-hobbit: add sgtl5000 sound card support
Date: Mon, 5 Sep 2016 16:21:47 +0800
Message-ID: <1473063707-31282-1-git-send-email-wente.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

use simple-audio-card to support sgtl5000 with SAI interface.

Signed-off-by: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 29 +++++++++++++++++++++--------
 arch/arm/boot/dts/imx6ul-pinfunc.h       |  2 +-
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index c11ab57..94969bd 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -101,15 +101,26 @@
 	};
 
 	sound {
-		compatible = "fsl,imx-audio-sgtl5000";
-		model = "imx6ul-sgtl5000";
-		audio-cpu = <&sai1>;
-		audio-codec = <&codec>;
-		audio-routing =
-			"LINE_IN", "Line In Jack",
-			"MIC_IN", "Mic Jack",
-			"Mic Jack", "Mic Bias",
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx6ul-sgtl5000";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"MIC_IN", "Microphone Jack",
+			"Microphone Jack", "Mic Bias",
 			"Headphone Jack", "HP_OUT";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		dailink_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
 	};
 
 	sys_mclk: clock-sys-mclk {
@@ -218,6 +229,7 @@
 	status = "okay";
 
 	codec: sgtl5000@0a {
+		#sound-dai-cells = <0>;
 		reg = <0x0a>;
 		compatible = "fsl,sgtl5000";
 		clocks = <&sys_mclk>;
@@ -284,6 +296,7 @@
 };
 
 &sai1 {
+	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx6ul-pinfunc.h b/arch/arm/boot/dts/imx6ul-pinfunc.h
index 0034eeb..3397b49 100644
--- a/arch/arm/boot/dts/imx6ul-pinfunc.h
+++ b/arch/arm/boot/dts/imx6ul-pinfunc.h
@@ -924,7 +924,7 @@
 #define MX6UL_PAD_CSI_DATA06__ECSPI1_MOSI		0x01fc 0x0488 0x053c 3 1
 #define MX6UL_PAD_CSI_DATA06__EIM_AD06			0x01fc 0x0488 0x0000 4 0
 #define MX6UL_PAD_CSI_DATA06__GPIO4_IO27		0x01fc 0x0488 0x0000 5 0
-#define MX6UL_PAD_CSI_DATA06__SAI1_RX_DATA		0x01fc 0x0488 0x0000 6 0
+#define MX6UL_PAD_CSI_DATA06__SAI1_RX_DATA		0x01fc 0x0488 0x05E4 6 1
 #define MX6UL_PAD_CSI_DATA06__USDHC1_RESET_B		0x01fc 0x0488 0x0000 8 0
 #define MX6UL_PAD_CSI_DATA07__CSI_DATA09		0x0200 0x048c 0x04e8 0 1
 #define MX6UL_PAD_CSI_DATA07__USDHC2_DATA7		0x0200 0x048c 0x0698 1 2
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
