From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 17/20] ARM: dts: imx6qdl-hummingboard2: add PWM3 support
Date: Mon, 11 Dec 2017 16:58:44 +0000
Message-ID: <E1eORPg-0000Ir-Mw@rmk-PC.armlinux.org.uk>
References: <20171211165631.GW10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211165631.GW10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
index 6954d4875cd8..1089f693ebde 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
@@ -361,6 +361,12 @@
 			>;
 		};
 
+		pinctrl_hummingboard2_pwm3: pwm3grp {
+			fsl,pins = <
+				MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
+			>;
+		};
+
 		pinctrl_hummingboard2_sgtl5000: hummingboard2-sgtl5000 {
 			fsl,pins = <
 				MX6QDL_PAD_DISP0_DAT19__AUD5_RXD 0x130b0
@@ -463,6 +469,12 @@
 	status = "okay";
 };
 
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hummingboard2_pwm3>;
+	status = "okay";
+};
+
 &ssi1 {
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
