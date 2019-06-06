From: Keerthy <j-keerthy@ti.com>
Subject: [RFC RESEND PATCH v2 4/4] arm64: dts: ti: am654-base-board: Add
 gpio_keys node
Date: Thu, 6 Jun 2019 15:26:20 +0530
Message-ID: <20190606095620.6211-5-j-keerthy@ti.com>
References: <20190606095620.6211-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190606095620.6211-1-j-keerthy@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, lokeshvutla@ti.com, j-keerthy@ti.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

There are 2 push buttons: SW5 and SW6 that are basically connected to
WKUP_GPIO0_24 and WKUP_GPIO0_27 respectively. Add the respective
nodes and the pinctrl data to set the mode to GPIO and Input.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index cf1aa276a1ea..ea50b6e36eff 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "k3-am654.dtsi"
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible =  "ti,am654-evm", "ti,am654";
@@ -33,6 +34,25 @@
 			no-map;
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		pinctrl-names = "default";
+		pinctrl-0 = <&push_button_pins_default>;
+
+		sw5 {
+			label = "GPIO Key USER1";
+			linux,code = <BTN_0>;
+			gpios = <&wkup_gpio0 24 GPIO_ACTIVE_LOW>;
+		};
+
+		sw6 {
+			label = "GPIO Key USER2";
+			linux,code = <BTN_1>;
+			gpios = <&wkup_gpio0 27 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &wkup_pmx0 {
@@ -42,6 +62,13 @@
 			AM65X_WKUP_IOPAD(0x00e4, PIN_INPUT, 0) /* (AD6) WKUP_I2C0_SDA */
 		>;
 	};
+
+	push_button_pins_default: push_button__pins_default {
+		pinctrl-single,pins = <
+			AM65X_WKUP_IOPAD(0x0030, PIN_INPUT, 7) /* (R5) WKUP_GPIO0_24 */
+			AM65X_WKUP_IOPAD(0x003c, PIN_INPUT, 7) /* (P2) WKUP_GPIO0_27 */
+		>;
+	};
 };
 
 &main_pmx0 {
-- 
2.17.1
