From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v3 4/7] palmetto: Request relevant mux functions in devicetree
Date: Tue, 30 Aug 2016 17:25:57 +0930
Message-ID: <20160830075600.11559-5-andrew@aj.id.au>
References: <20160830075600.11559-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160830075600.11559-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The requested functions are parented by the pinctrl node to provide the
Palmetto's static pin configuration.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index cc5fcf2940bf..648fb6b9e427 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -20,6 +20,20 @@
 	};
 };
 
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
+			&pinctrl_vgahs_default &pinctrl_vgavs_default
+			&pinctrl_ddcclk_default &pinctrl_ddcdat_default
+
+			&pinctrl_pwm1_default &pinctrl_pwm2_default
+			&pinctrl_pwm3_default &pinctrl_pwm4_default
+			&pinctrl_pwm5_default &pinctrl_pwm6_default
+			&pinctrl_pwm7_default
+
+			&pinctrl_bmcint_default &pinctrl_flack_default>;
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.9.3.1.g0db844e

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
