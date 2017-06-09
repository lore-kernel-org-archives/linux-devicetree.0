From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] ARM: dts: meson8: fix the IR receiver pins
Date: Sat, 10 Jun 2017 00:20:39 +0200
Message-ID: <20170609222039.25191-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The IR receiver pins are currently defined in the CBUS pin-controller.
However the pins are in the AO region, which is controlled by the AOBUS
pin-controller. Move the pins to pinctrl_aobus so they can actually be
used.

Fixes: b60e1157d8fa ("ARM: dts: amlogic: Split pinctrl device for Meson8 / Meson8b")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/meson8.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 9b0b3ddbb17e..e4f7357b4b31 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -116,6 +116,13 @@
 				function = "i2c_mst_ao";
 			};
 		};
+
+		ir_recv_pins: remote {
+			mux {
+				groups = "remote_input";
+				function = "remote";
+			};
+		};
 	};
 };
 
@@ -151,13 +158,6 @@
 			};
 		};
 
-		ir_recv_pins: remote {
-			mux {
-				groups = "remote_input";
-				function = "remote";
-			};
-		};
-
 		eth_pins: ethernet {
 			mux {
 				groups = "eth_tx_clk_50m", "eth_tx_en",
-- 
2.13.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
