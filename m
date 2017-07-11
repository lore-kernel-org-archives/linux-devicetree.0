From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: move the pwm_ab and pwm_cd nodes to meson.dtsi
Date: Wed, 12 Jul 2017 00:20:14 +0200
Message-ID: <20170711222015.10401-2-martin.blumenstingl@googlemail.com>
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to the vendor kernel sources these also exist (at the same
address) on Meson6 and Meson8. This can be found by running
$ grep -R "define PWM_PWM_[A-D]" arch/arm/
in the Amlogic GPL kernel tree (arm-src-kernel-2015-01-15-321cfb5a46).
pwm_ef does not seem to exist on older SoCs, so we keep it in
meson8b.dtsi for now.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson.dtsi   | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 22 ++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 15204e44161d..4c27ca083afb 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -108,6 +108,20 @@
 				status = "disabled";
 			};
 
+			pwm_ab: pwm@8550 {
+				compatible = "amlogic,meson-pwm";
+				reg = <0x8550 0x10>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@8650 {
+				compatible = "amlogic,meson-pwm";
+				reg = <0x8650 0x10>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			saradc: adc@8680 {
 				compatible = "amlogic,meson-saradc";
 				reg = <0x8680 0x34>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 72e4f425f190..65b36c944b45 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -129,20 +129,6 @@
 		#reset-cells = <1>;
 	};
 
-	pwm_ab: pwm@8550 {
-		compatible = "amlogic,meson8b-pwm";
-		reg = <0x8550 0x10>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	pwm_cd: pwm@8650 {
-		compatible = "amlogic,meson8b-pwm";
-		reg = <0x8650 0x10>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
 	pwm_ef: pwm@86c0 {
 		compatible = "amlogic,meson8b-pwm";
 		reg = <0x86c0 0x10>;
@@ -193,6 +179,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&pwm_ab {
+	compatible = "amlogic,meson8b-pwm";
+};
+
+&pwm_cd {
+	compatible = "amlogic,meson8b-pwm";
+};
+
 &saradc {
 	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-- 
2.13.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
