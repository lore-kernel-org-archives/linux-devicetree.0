From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: meson8: add the PWM controller nodes
Date: Wed, 12 Jul 2017 00:20:15 +0200
Message-ID: <20170711222015.10401-3-martin.blumenstingl@googlemail.com>
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

pwm_ab and pwm_cd are already inherited from meson.dtsi, we only need to
define the correct "compatible" string so the pwm-meson driver can
choose the parent clocks correctly.
pwm_ef is added to meson8.dtsi directly (similar to how it's done in
meson8b.dtsi) as this controller only exists on Meson8 and Meson8b.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index cada35828931..6fe6a159e960 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -172,6 +172,13 @@
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
 
+	pwm_ef: pwm@86c0 {
+		compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+		reg = <0x86c0 0x10>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	pinctrl_cbus: pinctrl@9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
@@ -270,6 +277,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&pwm_ab {
+	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+};
+
+&pwm_cd {
+	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+};
+
 &saradc {
 	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
