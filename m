From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 3/5] ARM64: dts: meson-axg: uart: Add the pinctrl info description
Date: Thu, 11 Jan 2018 10:33:59 +0800
Message-ID: <20180111023401.125658-4-yixun.lan@amlogic.com>
References: <20180111023401.125658-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111023401.125658-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Describe the pinctrl info for the UART controller which is found
in the Meson-AXG SoCs.

Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 96 ++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 644d0f9eaf8c..6cd28045e89c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -448,6 +448,70 @@
 						function = "spi1";
 					};
 				};
+
+				uart_a_pins: uart_a {
+					mux {
+						groups = "uart_tx_a",
+							"uart_rx_a";
+						function = "uart_a";
+					};
+				};
+
+				uart_a_cts_rts_pins: uart_a_cts_rts {
+					mux {
+						groups = "uart_cts_a",
+							"uart_rts_a";
+						function = "uart_a";
+					};
+				};
+
+				uart_b_x_pins: uart_b_x {
+					mux {
+						groups = "uart_tx_b_x",
+							"uart_rx_b_x";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_x_cts_rts_pins: uart_b_x_cts_rts {
+					mux {
+						groups = "uart_cts_b_x",
+							"uart_rts_b_x";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_z_pins: uart_b_z {
+					mux {
+						groups = "uart_tx_b_z",
+							"uart_rx_b_z";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_z_cts_rts_pins: uart_b_z_cts_rts {
+					mux {
+						groups = "uart_cts_b_z",
+							"uart_rts_b_z";
+						function = "uart_b";
+					};
+				};
+
+				uart_ao_b_z_pins: uart_ao_b_z {
+					mux {
+						groups = "uart_ao_tx_b_z",
+							"uart_ao_rx_b_z";
+						function = "uart_ao_b_gpioz";
+					};
+				};
+
+				uart_ao_b_z_cts_rts_pins: uart_ao_b_z_cts_rts {
+					mux {
+						groups = "uart_ao_cts_b_z",
+							"uart_ao_rts_b_z";
+						function = "uart_ao_b_gpioz";
+					};
+				};
 			};
 		};
 
@@ -498,6 +562,38 @@
 						function = "remote_input_ao";
 					};
 				};
+
+				uart_ao_a_pins: uart_ao_a {
+					mux {
+						groups = "uart_ao_tx_a",
+							"uart_ao_rx_a";
+						function = "uart_ao_a";
+					};
+				};
+
+				uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+					mux {
+						groups = "uart_ao_cts_a",
+							"uart_ao_rts_a";
+						function = "uart_ao_a";
+					};
+				};
+
+				uart_ao_b_pins: uart_ao_b {
+					mux {
+						groups = "uart_ao_tx_b",
+							"uart_ao_rx_b";
+						function = "uart_ao_b";
+					};
+				};
+
+				uart_ao_b_cts_rts_pins: uart_ao_b_cts_rts {
+					mux {
+						groups = "uart_ao_cts_b",
+							"uart_ao_rts_b";
+						function = "uart_ao_b";
+					};
+				};
 			};
 
 			pwm_AO_ab: pwm@7000 {
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
