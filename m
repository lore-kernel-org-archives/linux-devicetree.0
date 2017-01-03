From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: imx6qdl-nitrogen6_som2: fix sgtl5000 pinctrl init
Date: Tue,  3 Jan 2017 12:22:47 +0100
Message-ID: <20170103112247.4563-3-gary.bisson@boundarydevices.com>
References: <20170103112247.4563-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103112247.4563-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since the codec is probed first, the pinctrl node should be
under the codec node.

The codec init was working for this board since U-Boot was
already setting GPIO_0 as CLKO1 but better fix it anyway.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
index d80f21abea62..31d4cc62dbc7 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi
@@ -250,8 +250,6 @@
 		compatible = "fsl,imx6q-nitrogen6_som2-sgtl5000",
 			     "fsl,imx-audio-sgtl5000";
 		model = "imx6q-nitrogen6_som2-sgtl5000";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_sgtl5000>;
 		ssi-controller = <&ssi1>;
 		audio-codec = <&codec>;
 		audio-routing =
@@ -320,6 +318,8 @@
 
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
