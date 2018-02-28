From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] dt-bindings: gpio: Add gpio nodes for Actions S900 SoC
Date: Wed, 28 Feb 2018 23:19:01 +0530
Message-ID: <20180228174906.22721-6-manivannan.sadhasivam@linaro.org>
References: <20180228174906.22721-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180228174906.22721-1-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, afaerber@suse.de
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, manivannanece23@gmail.com, hzhang@ucrobotics.com, bdong@ucrobotics.com, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add gpio nodes for Actions Semi S900 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/gpio/actions,owl-gpio.txt  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt b/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
new file mode 100644
index 000000000000..d2939ca6cfaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
@@ -0,0 +1,95 @@
+* Actions Semi OWL GPIO controller bindings
+
+The GPIOs are organized as individual banks/ports with variable number
+of GPIOs. Each bank is represented as an individual GPIO controller.
+
+Required properties:
+- compatible            : Should be "actions,s900-gpio"
+- reg                   : Address and range of the GPIO controller registers.
+- gpio-controller       : Marks the device node as a GPIO controller.
+- #gpio-cells           : Should be <2>. The first cell is the gpio number
+                          and the second cell is used to specify optional
+                          parameters.
+- interrupt-controller  : Marks the device node as an interrupt controller.
+- #interrupt-cells      : Specifies the number of cells needed to encode an
+                          interrupt.  Shall be set to 2.  The first cell
+                          defines the interrupt number, the second encodes
+                          the trigger flags described in
+                          bindings/interrupt-controller/interrupts.txt
+
+Optional properties:
+- gpio-ranges           : Mapping between GPIO and pinctrl
+
+Note: Each GPIO port should have an alias correctly numbered in "aliases"
+node.
+
+Examples:
+
+aliases {
+        gpio0 = &gpioa;
+        gpio1 = &gpiob;
+        gpio2 = &gpioc;
+        gpio3 = &gpiod;
+        gpio4 = &gpioe;
+        gpio5 = &gpiof;
+};
+
+       gpioa: gpioa@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 0 32>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
+
+       gpiob: gpiob@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 32 32>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
+
+       gpioc: gpioc@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 64 12>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
+
+       gpiod: gpiod@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 76 30>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
+
+       gpioe: gpioe@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 106 32>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
+
+       gpiof: gpiof@e01b0000 {
+               compatible = "actions,s900-gpio";
+               reg = <0x0 0xe01b0000 0x0 0x1000>;
+               gpio-controller;
+               #gpio-cells = <2>;
+               gpio-ranges = <&pinctrl 0 138 8>;
+               interrupt-controller;
+               #interrupt-cells = <2>;
+       };
-- 
2.14.1
