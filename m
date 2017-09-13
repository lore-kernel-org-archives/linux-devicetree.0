From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v5 2/3] dt-bindings: gpio: uniphier: add UniPhier GPIO binding
Date: Wed, 13 Sep 2017 17:56:29 +0900
Message-ID: <1505292990-22957-3-git-send-email-yamada.masahiro@socionext.com>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, David Daney <david.daney@cavium.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This GPIO controller is used on UniPhier SoC family.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Rob Herring <robh@kernel.org>
---


 .../devicetree/bindings/gpio/gpio-uniphier.txt     | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-uniphier.txt

diff --git a/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt b/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
new file mode 100644
index 0000000..0a371bdd
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-uniphier.txt
@@ -0,0 +1,43 @@
+UniPhier GPIO controller
+
+Required properties:
+- compatible: Should be "socionext,uniphier-gpio".
+- reg: Specifies offset and length of the register set for the device.
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Should be 2.  The first cell is the pin number and the second
+  cell is used to specify optional parameters.
+- interrupt-parent: Specifies the parent interrupt controller.
+- interrupts: Specifies interrupts connected to the parent interrupt controller.
+- interrupt-controller: Marks the device node as an interrupt controller.
+- #interrupt-cells: Should be 2.  The first cell defines the interrupt number.
+  The second cell bits[3:0] is used to specify trigger type as follows:
+    1 = low-to-high edge triggered
+    2 = high-to-low edge triggered
+    4 = active high level-sensitive
+    8 = active low level-sensitive
+  Valid combinations are 1, 2, 3, 4, 8.
+- ngpios: Specifies the number of GPIO lines.
+- gpio-ranges: Mapping to pin controller pins (as described in gpio.txt)
+
+Optional properties:
+- gpio-ranges-group-names: Used for named gpio ranges (as described in gpio.txt)
+
+Example:
+	gpio: gpio@55000000 {
+		compatible = "socionext,uniphier-gpio";
+		reg = <0x55000000 0x200>;
+		interrupt-parent = <&aidet>;
+		interrupts = <48 0>, <49 0>, <50 0>, <51 0>,
+			     <52 0>, <53 0>, <54 0>, <55 0>,
+			     <56 0>, <57 0>, <58 0>, <59 0>,
+			     <60 0>, <61 0>, <62 0>, <63 0>,
+			     <154 0>, <155 0>, <156 0>, <157 0>,
+			     <158 0>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pinctrl 0 0 0>;
+		gpio-ranges-group-names = "gpio_range";
+		ngpios = <248>;
+	};
-- 
2.7.4
