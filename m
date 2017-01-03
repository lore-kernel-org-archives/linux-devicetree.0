From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx6qdl-nitrogen6_max: fix sgtl5000 pinctrl init
Date: Tue,  3 Jan 2017 12:22:46 +0100
Message-ID: <20170103112247.4563-2-gary.bisson@boundarydevices.com>
References: <20170103112247.4563-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103112247.4563-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes the following error:
sgtl5000 0-000a: Error reading chip id -6
imx-sgtl5000 sound: ASoC: CODEC DAI sgtl5000 not registered
imx-sgtl5000 sound: snd_soc_register_card failed (-517)

The problem was that the pinctrl group was linked to the sound driver
instead of the codec node. Since the codec is probed first, the sys_mclk
was missing and it would therefore fail to initialize.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
index 34887a10c5f1..47ba97229a48 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi
@@ -319,8 +319,6 @@
 		compatible = "fsl,imx6q-nitrogen6_max-sgtl5000",
 			     "fsl,imx-audio-sgtl5000";
 		model = "imx6q-nitrogen6_max-sgtl5000";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sgtl5000>;
 		ssi-controller = <&ssi1>;
 		audio-codec = <&codec>;
 		audio-routing =
@@ -402,6 +400,8 @@
 
 	codec: sgtl5000@0a {
 		compatible = "fsl,sgtl5000";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sgtl5000>;
 		reg = <0x0a>;
 		clocks = <&clks IMX6QDL_CLK_CKO>;
 		VDDA-supply = <&reg_2p5v>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
