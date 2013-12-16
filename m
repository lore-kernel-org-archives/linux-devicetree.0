From: Nicolin Chen <Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl: add spdif support for sabreauto
Date: Mon, 16 Dec 2013 18:37:48 +0800
Message-ID: <1387190268-8041-1-git-send-email-Guangyu.Chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds spdif support for imx6qdl-sabreauto by inserting the cpu dai
node with pinctrl group and its ASoC dai link node.

Signed-off-by: Nicolin Chen <Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
index a526796..26fa0e5 100644
--- a/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabreauto.dtsi
@@ -14,6 +14,14 @@
 	memory {
 		reg = <0x10000000 0x80000000>;
 	};
+
+	sound-spdif {
+		compatible = "fsl,imx-audio-spdif",
+			   "fsl,imx-sabreauto-spdif";
+		model = "imx-spdif";
+		spdif-controller = <&spdif>;
+		spdif-in;
+	};
 };
 
 &ecspi1 {
@@ -76,6 +84,12 @@
 			fsl,pins = <MX6QDL_GPMI_NAND_PINGRP1>;
 		};
 
+		pinctrl_spdif: spdifgrp {
+			fsl,pins = <
+				MX6QDL_PAD_KEY_COL3__SPDIF_IN 0x1b0b0
+			>;
+		};
+
 		pinctrl_uart4: uart4grp {
 			fsl,pins = <MX6QDL_UART4_PINGRP1>;
 		};
@@ -102,6 +116,12 @@
 	};
 };
 
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spdif>;
+	status = "okay";
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
