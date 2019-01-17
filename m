From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: add pinctrl support controllers
Date: Thu, 17 Jan 2019 11:31:50 +0100
Message-ID: <20190117103151.3349-2-jbrunet@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Add the peripheral and always-on pinctrl controllers to the g12a soc.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 49 +++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2aea5ba62fee..39ad2bbaa162 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -84,6 +84,29 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff634400 0x0 0x400>;
+
+			periphs_pinctrl: pinctrl@40 {
+				compatible = "amlogic,meson-g12a-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank@40 {
+					reg = <0x0 0x40  0x0 0x4c>,
+					      <0x0 0xe8  0x0 0x18>,
+					      <0x0 0x120 0x0 0x18>,
+					      <0x0 0x2c0 0x0 0x40>,
+					      <0x0 0x340 0x0 0x1c>;
+					reg-names = "gpio",
+						    "pull",
+						    "pull-enable",
+						    "mux",
+						    "ds";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+			};
 		};
 
 		hiu: bus@ff63c000 {
@@ -94,6 +117,32 @@
 			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1400>;
 		};
 
+		rti: bus@ff800000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff800000 0x0 0x1000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x1000>;
+
+			ao_pinctrl: pinctrl@14 {
+				compatible = "amlogic,meson-g12a-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank@14 {
+					reg = <0x0 0x14 0x0 0x8>,
+					      <0x0 0x1c 0x0 0x8>,
+					      <0x0 0x24 0x0 0x14>;
+					reg-names = "mux",
+						    "ds",
+						    "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+			};
+		};
+
 		uart_AO: serial@ff803000 {
 			compatible = "amlogic,meson-gx-uart",
 				     "amlogic,meson-ao-uart";
-- 
2.20.1
