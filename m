From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] ARM64: dts: meson-gxbb: add pins for I2C
Date: Wed, 14 Sep 2016 12:06:06 +0200
Message-ID: <1473847568-20163-3-git-send-email-jbrunet@baylibre.com>
References: <1473847568-20163-1-git-send-email-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473847568-20163-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 9506597fcc1c..75aca5013e61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -293,6 +293,14 @@
 					};
 				};
 
+				i2c_ao_pins: i2c_ao {
+					mux {
+						groups = "i2c_sck_ao",
+						       "i2c_sda_ao";
+						function = "i2c_ao";
+					};
+				};
+
 				pwm_ao_a_3_pins: pwm_ao_a_3 {
 					mux {
 						groups = "pwm_ao_a_3";
@@ -455,6 +463,30 @@
 					};
 				};
 
+				i2c_a_pins: i2c_a {
+					mux {
+						groups = "i2c_sck_a",
+						       "i2c_sda_a";
+						function = "i2c_a";
+					};
+				};
+
+				i2c_b_pins: i2c_b {
+					mux {
+						groups = "i2c_sck_b",
+						       "i2c_sda_b";
+						function = "i2c_b";
+					};
+				};
+
+				i2c_c_pins: i2c_c {
+					mux {
+						groups = "i2c_sck_c",
+						       "i2c_sda_c";
+						function = "i2c_c";
+					};
+				};
+
 				eth_pins: eth_c {
 					mux {
 						groups = "eth_mdio",
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
