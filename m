From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: g12a: add uart_ao_a pinctrl
Date: Thu, 17 Jan 2019 11:31:51 +0100
Message-ID: <20190117103151.3349-3-jbrunet@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the always on UART pinctrl setting to the g12a soc DT and
use it for the u200 reference design

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-g12a-u200.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi    | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c44dbdddf2cf..f2afd0bf3e28 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -25,5 +25,7 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 39ad2bbaa162..bd24de947a5b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -140,6 +140,24 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 				};
+
+				uart_ao_a_pins: uart_a_ao {
+					mux {
+						groups = "uart_ao_a_tx",
+							 "uart_ao_a_rx";
+						function = "uart_ao_a";
+						bias-disable;
+					};
+				};
+
+				uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+					mux {
+						groups = "uart_ao_a_cts",
+							 "uart_ao_a_rts";
+						function = "uart_ao_a";
+						bias-disable;
+					};
+				};
 			};
 		};
 
-- 
2.20.1
