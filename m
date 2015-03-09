From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: imx6dl-aristainetos: enable backlight PWM explicitly
Date: Mon,  9 Mar 2015 17:40:34 +0100
Message-ID: <1425919236-6664-2-git-send-email-p.zabel@pengutronix.de>
References: <1425919236-6664-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425919236-6664-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

All PWM users should explicitly enable the used PWMs in their device tree
so they can be disabled by default in imx6qdl.dtsi.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6dl-aristainetos_4.dts | 4 ++++
 arch/arm/boot/dts/imx6dl-aristainetos_7.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-aristainetos_4.dts b/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
index 9cd06e5..d4c4a22 100644
--- a/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
+++ b/arch/arm/boot/dts/imx6dl-aristainetos_4.dts
@@ -83,3 +83,7 @@
 &ipu1_di0_disp0 {
 	remote-endpoint = <&display0_in>;
 };
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6dl-aristainetos_7.dts b/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
index b413e24..15203f0 100644
--- a/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
+++ b/arch/arm/boot/dts/imx6dl-aristainetos_7.dts
@@ -72,3 +72,7 @@
 &ipu1_di0_disp0 {
 	remote-endpoint = <&display0_in>;
 };
+
+&pwm3 {
+	status = "okay";
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
