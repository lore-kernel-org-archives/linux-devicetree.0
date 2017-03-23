From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 6/8] ARM64: dts: meson-gxbb: add spdif output pins
Date: Thu, 23 Mar 2017 17:50:59 +0100
Message-ID: <20170323165101.29262-7-jbrunet@baylibre.com>
References: <20170323165101.29262-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170323165101.29262-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 5ce70e1ec9ae..e5fd88e2c5f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -245,6 +245,20 @@
 				function = "i2s_out_ao";
 			};
 		};
+
+		spdif_out_ao_6_pins: spdif_out_ao_6 {
+			mux {
+				groups = "spdif_out_ao_6";
+				function = "spdif_out_ao";
+			};
+		};
+
+		spdif_out_ao_13_pins: spdif_out_ao_13 {
+			mux {
+				groups = "spdif_out_ao_13";
+				function = "spdif_out_ao";
+			};
+		};
 	};
 
 	clkc_AO: clock-controller@040 {
@@ -530,6 +544,13 @@
 				function = "i2s_out";
 			};
 		};
+
+		spdif_out_y_pins: spdif_out_y {
+			mux {
+				groups = "spdif_out_y";
+				function = "spdif_out";
+			};
+		};
 	};
 };
 
-- 
2.9.3
