From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 09/20] ARM: dts: imx6*-hummingboard2: fix formatting
Date: Mon, 11 Dec 2017 16:58:03 +0000
Message-ID: <E1eORP1-0000Hm-Gk@rmk-PC.armlinux.org.uk>
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

From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

Trivial formatting change.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
index 7e94548c0de7..ab809ee0c58c 100644
--- a/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi
@@ -482,9 +482,9 @@
 };
 
 &pwm1 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_hummingboard2_pwm1>;
-        status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hummingboard2_pwm1>;
+	status = "okay";
 };
 
 &pwm3 {
@@ -534,9 +534,7 @@
 
 &usdhc3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <
-		&pinctrl_hummingboard2_usdhc3
-	>;
+	pinctrl-0 = <&pinctrl_hummingboard2_usdhc3>;
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_3p3v>;
 	bus-width = <8>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
