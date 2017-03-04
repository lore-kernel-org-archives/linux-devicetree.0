From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 2/2] ARM64: dts: amlogic: meson-gxl: add the missing PWM pins
Date: Sat,  4 Mar 2017 22:23:18 +0100
Message-ID: <20170304212318.27076-3-martin.blumenstingl@googlemail.com>
References: <20170304212318.27076-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170304212318.27076-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the new DT nodes for the missing PWM pins in the EE and AO
domain.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 56 ++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index fe11b5fc61f7..583c7b88ba7c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -118,6 +118,20 @@
 			};
 		};
 
+		pwm_ao_a_3_pins: pwm_ao_a_3 {
+			mux {
+				groups = "pwm_ao_a_3";
+				function = "pwm_ao_a_3";
+			};
+		};
+
+		pwm_ao_a_8_pins: pwm_ao_a_8 {
+			mux {
+				groups = "pwm_ao_a_8";
+				function = "pwm_ao_a_8";
+			};
+		};
+
 		pwm_ao_b_pins: pwm_ao_b {
 			mux {
 				groups = "pwm_ao_b";
@@ -277,6 +291,34 @@
 			};
 		};
 
+		pwm_a_pins: pwm_a {
+			mux {
+				groups = "pwm_a";
+				function = "pwm_a";
+			};
+		};
+
+		pwm_b_pins: pwm_b {
+			mux {
+				groups = "pwm_b";
+				function = "pwm_b";
+			};
+		};
+
+		pwm_c_pins: pwm_c {
+			mux {
+				groups = "pwm_c";
+				function = "pwm_c";
+			};
+		};
+
+		pwm_d_pins: pwm_d {
+			mux {
+				groups = "pwm_d";
+				function = "pwm_d";
+			};
+		};
+
 		pwm_e_pins: pwm_e {
 			mux {
 				groups = "pwm_e";
@@ -284,6 +326,20 @@
 			};
 		};
 
+		pwm_f_clk_pins: pwm_f_clk {
+			mux {
+				groups = "pwm_f_clk";
+				function = "pwm_f_clk";
+			};
+		};
+
+		pwm_f_x_pins: pwm_f_x {
+			mux {
+				groups = "pwm_f_x";
+				function = "pwm_f_x";
+			};
+		};
+
 		hdmi_hpd_pins: hdmi_hpd {
 			mux {
 				groups = "hdmi_hpd";
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
