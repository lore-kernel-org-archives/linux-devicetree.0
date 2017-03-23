From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 5/8] ARM64: dts: meson-gxbb: add i2s output pins
Date: Thu, 23 Mar 2017 17:50:58 +0100
Message-ID: <20170323165101.29262-6-jbrunet@baylibre.com>
References: <20170323165101.29262-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170323165101.29262-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 04b3324bc132..5ce70e1ec9ae 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -203,6 +203,48 @@
 				function = "pwm_ao_b";
 			};
 		};
+
+		i2s_am_clk_pins: i2s_am_clk {
+			mux {
+				groups = "i2s_am_clk";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ao_clk_pins: i2s_out_ao_clk {
+			mux {
+				groups = "i2s_out_ao_clk";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_lr_clk_pins: i2s_out_lr_clk {
+			mux {
+				groups = "i2s_out_lr_clk";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch01_ao_pins: i2s_out_ch01_ao {
+			mux {
+				groups = "i2s_out_ch01_ao";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch23_ao_pins: i2s_out_ch23_ao {
+			mux {
+				groups = "i2s_out_ch23_ao";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch45_ao_pins: i2s_out_ch45_ao {
+			mux {
+				groups = "i2s_out_ch45_ao";
+				function = "i2s_out_ao";
+			};
+		};
 	};
 
 	clkc_AO: clock-controller@040 {
@@ -467,6 +509,27 @@
 				function = "hdmi_i2c";
 			};
 		};
+
+		i2sout_ch23_y_pins: i2sout_ch23_y {
+			mux {
+				groups = "i2sout_ch23_y";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch45_y_pins: i2sout_ch45_y {
+			mux {
+				groups = "i2sout_ch45_y";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch67_y_pins: i2sout_ch67_y {
+			mux {
+				groups = "i2sout_ch67_y";
+				function = "i2s_out";
+			};
+		};
 	};
 };
 
-- 
2.9.3
