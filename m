From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 04/10] ARM: dts: meson8: add the pins for the SDIO controller
Date: Thu, 15 Jun 2017 23:33:46 +0200
Message-ID: <20170615213352.25134-5-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 5ff7903964c6..bb3608bddc98 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -158,6 +158,30 @@
 			gpio-ranges = <&pinctrl_cbus 0 0 120>;
 		};
 
+		sd_a_pins: sd-a {
+			mux {
+				groups = "sd_d0_a", "sd_d1_a", "sd_d2_a",
+					"sd_d3_a", "sd_clk_a", "sd_cmd_a";
+				function = "sd_a";
+			};
+		};
+
+		sd_b_pins: sd-b {
+			mux {
+				groups = "sd_d0_b", "sd_d1_b", "sd_d2_b",
+					"sd_d3_b", "sd_clk_b", "sd_cmd_b";
+				function = "sd_b";
+			};
+		};
+
+		sd_c_pins: sd-c {
+			mux {
+				groups = "sd_d0_c", "sd_d1_c", "sd_d2_c",
+					"sd_d3_c", "sd_clk_c", "sd_cmd_c";
+				function = "sd_c";
+			};
+		};
+
 		spi_nor_pins: nor {
 			mux {
 				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
