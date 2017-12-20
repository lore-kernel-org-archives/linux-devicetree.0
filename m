From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: vf610-zii-dev-rev-b: add interrupts for 88e1545
 PHY
Date: Wed, 20 Dec 2017 23:12:01 +0000
Message-ID: <E1eRnWr-0006VS-1m@rmk-PC.armlinux.org.uk>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220231108.GJ10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The 88e1545 PHY has its interrupts wired to the VF610, so we might as
well use them.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
This is certainly not correct, as all PHYs on this device share the
same interrupt line, but we can't specify the pinmux settings
individually on each PHY.  How should this be handled?
---
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index 782b69a3acdf..d6786c5d0109 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -312,12 +312,20 @@
 					#size-cells = <0>;
 
 					switch2phy0: phy@0 {
+						interrupt-parent = <&gpio0>;
+						interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
 						reg = <0>;
+						pinctrl-names = "default";
+						pinctrl-0 = <&pinctrl_mv88e1545>;
 					};
 					switch2phy1: phy@1 {
+						interrupt-parent = <&gpio0>;
+						interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
 						reg = <1>;
 					};
 					switch2phy2: phy@2 {
+						interrupt-parent = <&gpio0>;
+						interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
 						reg = <2>;
 					};
 				};
@@ -488,6 +496,12 @@
 		>;
 	};
 
+	pinctrl_mv88e1545: pinctrl-mv88e1545 {
+		fsl,pins = <
+			VF610_PAD_PTB0__GPIO_22		0x219d
+		>;
+	};
+
 	pinctrl_pca9554_22: pinctrl-pca95540-22 {
 		fsl,pins = <
 			VF610_PAD_PTB28__GPIO_98	0x219d
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
