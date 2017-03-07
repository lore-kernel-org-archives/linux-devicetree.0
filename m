From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] ARM64: dts: meson-gxl: Add missing pinctrl pins groups
Date: Tue,  7 Mar 2017 14:31:02 +0100
Message-ID: <1488893462-7016-4-git-send-email-narmstrong@baylibre.com>
References: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488893462-7016-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: khilman@baylibre.com, carlo@caione.org, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add pinctrl pins nodes following the additions of missing pins in the pinctrl
driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 583c7b8..17cd546 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -103,6 +103,13 @@
 			};
 		};
 
+		uart_ao_b_0_1_pins: uart_ao_b_0_1 {
+			mux {
+				groups = "uart_tx_ao_b_0", "uart_rx_ao_b_1";
+				function = "uart_ao_b";
+			};
+		};
+
 		uart_ao_b_cts_rts_pins: uart_ao_b_cts_rts {
 			mux {
 				groups = "uart_cts_ao_b",
@@ -118,6 +125,14 @@
 			};
 		};
 
+		i2c_ao_pins: i2c_ao {
+			mux {
+				groups = "i2c_sck_ao",
+				       "i2c_sda_ao";
+				function = "i2c_ao";
+			};
+		};
+
 		pwm_ao_a_3_pins: pwm_ao_a_3 {
 			mux {
 				groups = "pwm_ao_a_3";
@@ -138,6 +153,13 @@
 				function = "pwm_ao_b";
 			};
 		};
+
+		pwm_ao_b_6_pins: pwm_ao_b_6 {
+			mux {
+				groups = "pwm_ao_b_6";
+				function = "pwm_ao_b_6";
+			};
+		};
 	};
 };
 
@@ -168,6 +190,16 @@
 			};
 		};
 
+		nor_pins: nor {
+			mux {
+				groups = "nor_d",
+				       "nor_q",
+				       "nor_c",
+				       "nor_cs";
+				function = "nor";
+			};
+		};
+
 		sdcard_pins: sdcard {
 			mux {
 				groups = "sdcard_d0",
-- 
1.9.1
