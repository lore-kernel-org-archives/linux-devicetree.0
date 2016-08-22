From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] ARM64: dts: meson-gxbb: Add PWM pinctrl nodes
Date: Mon, 22 Aug 2016 14:54:10 +0200
Message-ID: <1471870450-11109-3-git-send-email-narmstrong@baylibre.com>
References: <1471870450-11109-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471870450-11109-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add DT nodes for PWMs in EE and AO domains.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 77 +++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e3f4d36..0677eca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -224,6 +224,34 @@
 						function = "uart_ao";
 					};
 				};
+
+				pwm_ao_a_3_pins: pwm_ao_a_3 {
+					mux {
+						groups = "pwm_ao_a_3";
+						function = "pwm_ao_a_3";
+					};
+				};
+
+				pwm_ao_a_6_pins: pwm_ao_a_6 {
+					mux {
+						groups = "pwm_ao_a_6";
+						function = "pwm_ao_a_6";
+					};
+				};
+
+				pwm_ao_a_12_pins: pwm_ao_a_12 {
+					mux {
+						groups = "pwm_ao_a_12";
+						function = "pwm_ao_a_12";
+					};
+				};
+
+				pwm_ao_b_pins: pwm_ao_b {
+					mux {
+						groups = "pwm_ao_b";
+						function = "pwm_ao_b";
+					};
+				};
 			};
 
 			uart_AO: serial@4c0 {
@@ -334,6 +362,55 @@
 						function = "eth";
 					};
 				};
+
+				pwm_a_x_pins: pwm_a_x {
+					mux {
+						groups = "pwm_a_x";
+						function = "pwm_a_x";
+					};
+				};
+
+				pwm_a_y_pins: pwm_a_y {
+					mux {
+						groups = "pwm_a_y";
+						function = "pwm_a_y";
+					};
+				};
+
+				pwm_b_pins: pwm_b {
+					mux {
+						groups = "pwm_b";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_d_pins: pwm_d {
+					mux {
+						groups = "pwm_d";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_e_pins: pwm_e {
+					mux {
+						groups = "pwm_e";
+						function = "pwm_e";
+					};
+				};
+
+				pwm_f_x_pins: pwm_f_x {
+					mux {
+						groups = "pwm_f_x";
+						function = "pwm_f_x";
+					};
+				};
+
+				pwm_f_y_pins: pwm_f_y {
+					mux {
+						groups = "pwm_f_y";
+						function = "pwm_f_y";
+					};
+				};
 			};
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
