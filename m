From: <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: imx6q-utilite-pro: add hpd gpio
Date: Mon, 6 Mar 2017 22:40:44 +0100
Message-ID: <079b2ad39e0f4d37a181aab822b68fe6@rwthex-s1-b.rwth-ad.de>
References: <20170306214044.2043-1-christopher.spinrath@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170306214044.2043-1-christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

The hpd pin of the second hdmi connector of the Utilite Pro is wired
up to a gpio pin of the SoC. Reflect this in the device tree.

Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-utilite-pro.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
index 69bdd82..d900ad6 100644
--- a/arch/arm/boot/dts/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
@@ -101,9 +101,11 @@
 
 	hdmi-connector {
 		compatible = "hdmi-connector";
-
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hpd>;
 		type = "a";
 		ddc-i2c-bus = <&i2c_dvi_ddc>;
+		hpd-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 
 		port {
 			hdmi_connector_in: endpoint {
@@ -209,6 +211,12 @@
 		>;
 	};
 
+	pinctrl_hpd: hpdgrp {
+		fsl,pins = <
+			MX6QDL_PAD_GPIO_4__GPIO1_IO04 0x1b0b0
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX6QDL_PAD_EIM_D21__I2C1_SCL 0x4001b8b1
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
