From: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Subject: [PATCH] ARM: dts: sunxi: Enable spi1 and spi2 for Olimex A20 SOM EVB
Date: Mon, 26 Dec 2016 18:53:49 +0100
Message-ID: <20161226175349.17712-1-manu@bidouilliste.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the spi1 and spi2 node since the pins are exposed on the UEXT
connectors.

Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index 669a1c338c76..fa8c6f60552b 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -300,12 +300,14 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi1_pins_a>,
 		    <&spi1_cs0_pins_a>;
+	status = "okay";
 };
 
 &spi2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi2_pins_a>,
 		    <&spi2_cs0_pins_a>;
+	status = "okay";
 };
 
 &uart0 {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
