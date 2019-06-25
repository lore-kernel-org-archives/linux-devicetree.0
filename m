Return-Path: <SRS0=SZwX=UY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58225 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbfFYKE1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Jun 2019 06:04:27 -0400
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Date: Tue, 25 Jun 2019 12:04:12 +0200
Message-Id: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Peter Chen <Peter.Chen@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The usb phys are internal to the SoC and so it their 5V supply. With
this regulator added explicitly the following (harmless) boot messages
go away:

	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not found, using dummy regulator
	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not found, using dummy regulator

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note I'm an USB noob, so please consider carefully before applying :-)
I also put the regulator near the usbphy node instead of in alphabetic
order. Not sure what is sensible/usual here, too.

Best regards
Uwe

 arch/arm/boot/dts/imx25.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
--- a/arch/arm/boot/dts/imx25.dtsi
+++ b/arch/arm/boot/dts/imx25.dtsi
@@ -614,6 +614,11 @@
 		};
 	};
 
+	reg_usb: regulator_usbphy {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-phy supply";
+	};
+
 	usbphy {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -623,12 +630,14 @@
 			reg = <0>;
 			compatible = "usb-nop-xceiv";
 			#phy-cells = <0>;
+			vcc-supply = <&reg_usb>;
 		};
 
 		usbphy1: usb-phy@1 {
 			reg = <1>;
 			compatible = "usb-nop-xceiv";
 			#phy-cells = <0>;
+			vcc-supply = <&reg_usb>;
 		};
 	};
 };
-- 
2.20.1
