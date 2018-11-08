From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 4/4] ARM: dts: meson: consistently disable pin bias
Date: Thu,  8 Nov 2018 11:44:26 +0100
Message-ID: <20181108104426.1877-5-jbrunet@baylibre.com>
References: <20181108104426.1877-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108104426.1877-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Amlogic chipsets, the bias set through pinconf applies to the pad
itself, not only the GPIO function. This means that even when we change
the function of the pad from GPIO to anything else, the bias previously
set still applies.

As we have seen with the eMMC, depending on the bias type and the function,
it may trigger problems.

The underlying issue is that we inherit whatever was left by previous user
of the pad (pinconf, u-boot or the ROM code). As a consequence, the actual
setup we will get is undefined.

There is nothing mentioned in the documentation about pad bias and pinmux
function, however leaving it undefined is not an option.

This change consistently disable the pad bias for every pinmux functions.
It seems to work well, we can only assume that the necessary bias (if any)
is already provided by the pin function itself.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi   | 12 ++++++++++++
 arch/arm/boot/dts/meson8b.dtsi  |  9 +++++++++
 arch/arm/boot/dts/meson8m2.dtsi |  1 +
 3 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7162e0ca05b0..1e735c0d92e3 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -164,6 +164,7 @@
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
 			};
+			bias-disable;
 		};
 
 		i2c_ao_pins: i2c_mst_ao {
@@ -171,6 +172,7 @@
 				groups = "i2c_mst_sck_ao", "i2c_mst_sda_ao";
 				function = "i2c_mst_ao";
 			};
+			bias-disable;
 		};
 
 		ir_recv_pins: remote {
@@ -178,6 +180,7 @@
 				groups = "remote_input";
 				function = "remote";
 			};
+			bias-disable;
 		};
 
 		pwm_f_ao_pins: pwm-f-ao {
@@ -185,6 +188,7 @@
 				groups = "pwm_f_ao";
 				function = "pwm_f_ao";
 			};
+			bias-disable;
 		};
 	};
 };
@@ -239,6 +243,7 @@
 					"sd_d3_a", "sd_clk_a", "sd_cmd_a";
 				function = "sd_a";
 			};
+			bias-disable;
 		};
 
 		sd_b_pins: sd-b {
@@ -247,6 +252,7 @@
 					"sd_d3_b", "sd_clk_b", "sd_cmd_b";
 				function = "sd_b";
 			};
+			bias-disable;
 		};
 
 		sd_c_pins: sd-c {
@@ -255,6 +261,7 @@
 					"sd_d3_c", "sd_clk_c", "sd_cmd_c";
 				function = "sd_c";
 			};
+			bias-disable;
 		};
 
 		spi_nor_pins: nor {
@@ -262,6 +269,7 @@
 				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
 				function = "nor";
 			};
+			bias-disable;
 		};
 
 		eth_pins: ethernet {
@@ -273,6 +281,7 @@
 					 "eth_mdc";
 				function = "ethernet";
 			};
+			bias-disable;
 		};
 
 		pwm_e_pins: pwm-e {
@@ -280,6 +289,7 @@
 				groups = "pwm_e";
 				function = "pwm_e";
 			};
+			bias-disable;
 		};
 
 		uart_a1_pins: uart-a1 {
@@ -288,6 +298,7 @@
 				       "uart_rx_a1";
 				function = "uart_a";
 			};
+			bias-disable;
 		};
 
 		uart_a1_cts_rts_pins: uart-a1-cts-rts {
@@ -296,6 +307,7 @@
 				       "uart_rts_a1";
 				function = "uart_a";
 			};
+			bias-disable;
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index cd1ca9dda126..6fc129ab4453 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -147,6 +147,7 @@
 				groups = "uart_tx_ao_a", "uart_rx_ao_a";
 				function = "uart_ao";
 			};
+			bias-disable;
 		};
 
 		ir_recv_pins: remote {
@@ -154,6 +155,7 @@
 				groups = "remote_input";
 				function = "remote";
 			};
+			bias-disable;
 		};
 	};
 };
@@ -220,6 +222,7 @@
 					 "eth_txd2",
 					 "eth_txd3";
 				function = "ethernet";
+				bias-disable;
 			};
 		};
 
@@ -235,6 +238,7 @@
 					 "eth_mdio_en",
 					 "eth_mdc";
 				function = "ethernet";
+				bias-disable;
 			};
 		};
 
@@ -242,6 +246,7 @@
 			mux {
 				groups = "i2c_sda_a", "i2c_sck_a";
 				function = "i2c_a";
+				bias-disable;
 			};
 		};
 
@@ -250,6 +255,7 @@
 				groups = "sd_d0_b", "sd_d1_b", "sd_d2_b",
 					"sd_d3_b", "sd_clk_b", "sd_cmd_b";
 				function = "sd_b";
+				bias-disable;
 			};
 		};
 
@@ -257,6 +263,7 @@
 			mux {
 				groups = "pwm_c1";
 				function = "pwm_c";
+				bias-disable;
 			};
 		};
 
@@ -265,6 +272,7 @@
 				groups = "uart_tx_b0",
 				       "uart_rx_b0";
 				function = "uart_b";
+				bias-disable;
 			};
 		};
 
@@ -273,6 +281,7 @@
 				groups = "uart_cts_b0",
 				       "uart_rts_b0";
 				function = "uart_b";
+				bias-disable;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 3e1f92273d7b..d1a28c2adac5 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -45,6 +45,7 @@
 				 "eth_rxd1", "eth_rxd0",
 				 "eth_mdio", "eth_mdc";
 			function = "ethernet";
+			bias-disable;
 		};
 	};
 };
-- 
2.19.1
