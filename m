From: Hongzhou.Yang <srv_hongzhou.yang@mediatek.com>
Subject: [PATCH v2 3/4] dt-bindings: Add pinctrl bindings for mt65xx/mt81xx.
Date: Tue, 23 Sep 2014 11:39:04 +0800
Message-ID: <1411443545-24951-4-git-send-email-srv_hongzhou.yang@mediatek.com>
References: <1411443545-24951-1-git-send-email-srv_hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411443545-24951-1-git-send-email-srv_hongzhou.yang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, dandan.he@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Hongzhou Yang <hongzhou.yang@mediatek.com>

Add devicetree bindings for Mediatek SoC pinctrl driver.

Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 .../devicetree/bindings/pinctrl/pinctrl-mt65xx.txt | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
new file mode 100644
index 0000000..ee028cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -0,0 +1,98 @@
+* Mediatek MT65XX Pin Controller
+
+The Mediatek's Pin controller is used to control GPIO pins.
+
+Required properties:
+- compatible: value should be either of the following.
+    (a) "mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
+- reg: Should contain the register physical address and length for the
+  pin controller.
+- gpio-controller : Marks the device node as a gpio controller.
+- #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
+  binding is used, the amount of cells must be specified as 2. See the below
+  mentioned gpio binding representation for description of particular cells.
+
+	Eg: <&pio 6 0>
+	<[phandle of the gpio controller node]
+	[pin number within the gpio controller]
+	[flags]>
+
+	Values for gpio specifier:
+	- Pin number: is a value between 0 to 202.
+	- Flags:  bit field of flags, as defined in <dt-bindings/gpio/gpio.h>.
+            Only the following flags are supported:
+            0 - GPIO_ACTIVE_HIGH
+            1 - GPIO_ACTIVE_LOW
+
+Please refer to pinctrl-bindings.txt in this directory for details of the
+common pinctrl bindings used by client devices.
+
+A pinctrl node should contain at least one subnodes representing the
+pinctrl groups available on the machine. Each subnode will list the
+pins it needs, and how they should be configured, with regard to muxer
+configuration and pullups. If one of these options is
+not set, its actual value will be unspecified.
+
+Required subnode-properties:
+
+- mediatek,pinfunc: List of gpio number and function to mux.
+
+The mediatek,pinfunc can use defines directly,
+which are already defind in boot/dts/mt8135-pinfunc.h.
+
+Optional subnode-properties:
+- generic pin configuration option to use, bias-disable, bias-pull-down,
+  bias-pull,up, output-low and output-high are valid.
+  Example :
+	i2c0_pins_a {
+		mediatek,pinfunc = <MT8135_PIN_195_SDA1__FUNC_SDA1>;
+		bias-disable;
+	};
+
+The mediatek,pinfunc can be either a single value or an array.
+If it is an array, that means all pins use same config in this node.
+
+
+Examples:
+
+pinctrl@01c20800 {
+	compatible = "mediatek,mt8135-pinctrl";
+	reg = <0x01c20800 0x400>;
+	gpio-controller;
+	#gpio-cells = <2>;
+
+	i2c0_pins_a: i2c0@0 {
+		mediatek,pinfunc = <MT8135_PIN_100_SDA0__FUNC_SDA0 MT8135_PIN_101_SCL0__FUNC_SCL0>;
+		bias-disable;
+	};
+
+	i2c1_pins_a: i2c1@0 {
+		mediatek,pinfunc = <MT8135_PIN_195_SDA1__FUNC_SDA1 MT8135_PIN_196_SCL1__FUNC_SCL1>;
+		bias-pull-up;
+	};
+
+	i2c2_pins_a: i2c2@0 {
+		mediatek,pinfunc = <MT8135_PIN_193_SDA2__FUNC_SDA2 MT8135_PIN_194_SCL2__FUNC_SCL2>;
+		bias-pull-down;
+	};
+
+	i2c3_pins_a: i2c3@0 {
+		mediatek,pinfunc = <MT8135_PIN_35_SCL3__FUNC_SCL3 MT8135_PIN_36_SDA3__FUNC_SDA3>;
+		bias-disable;
+		output-high;
+	};
+
+	uart2_pins_a: uart2@0 {
+		mediatek,pinfunc = <MT8135_PIN_53_URXD2__FUNC_URXD2 MT8135_PIN_54_UTXD2__FUNC_UTXD2>;
+		bias-disable;
+		output-low;
+	};
+
+	uart3_pins_a: uart3@0 {
+		mediatek,pinfunc = <MT8135_PIN_191_URXD3__FUNC_URXD3 MT8135_PIN_192_UTXD3__FUNC_UTXD3>;
+		bias-disable;
+		output-low;
+	};
+	...
+
+};
-- 
1.8.1.1.dirty
