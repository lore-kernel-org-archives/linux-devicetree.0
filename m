From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/12] ARM: dts: imx6-sabreauto: add pinctrl for gpt input capture
Date: Wed,  7 Dec 2016 16:57:49 -0800
Message-ID: <1481158673-15937-9-git-send-email-steve_longerbeam@mentor.com>
References: <1481158673-15937-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481158673-15937-1-git-send-email-steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl groups for both GPT input capture channels.

Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index 944a4fa..d74882a 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -457,6 +457,18 @@
 			>;
 		};
 
+		pinctrl_gpt_input_capture0: gptinputcapture0grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD1_DAT0__GPT_CAPTURE1	0x80000000
+			>;
+		};
+
+		pinctrl_gpt_input_capture1: gptinputcapture1grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD1_DAT1__GPT_CAPTURE2	0x80000000
+			>;
+		};
+
 		pinctrl_spdif: spdifgrp {
 			fsl,pins = <
 				MX6QDL_PAD_KEY_COL3__SPDIF_IN 0x1b0b0
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
