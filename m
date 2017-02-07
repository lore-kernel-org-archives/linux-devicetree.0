From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 12/22 v3] ARM: dts: add top-level DT bindings for Cortina Gemini
Date: Tue,  7 Feb 2017 22:48:12 +0100
Message-ID: <20170207214812.27365-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the top level SoC bindings for Cortina systems Gemini
platforms.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
ChangeLog v2->v3:
- Fix soc bus node and references.
- Fix spelling of interrupt-controller
ChangeLog v1->v2:
- Rename required property "intcon" to "interrupt-controller"
- Elaborate a bit on the SoC origins
- Put the example DTS SoC nodes in a soc {} node
---
 Documentation/devicetree/bindings/arm/gemini.txt | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/gemini.txt

diff --git a/Documentation/devicetree/bindings/arm/gemini.txt b/Documentation/devicetree/bindings/arm/gemini.txt
new file mode 100644
index 000000000000..c3e8430202ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/gemini.txt
@@ -0,0 +1,84 @@
+Cortina systems Gemini platforms
+
+The Gemini SoC is the project name for an ARMv4 FA525-based SoC originally
+produced by Storlink Semiconductor around 2005. The company was renamed
+later renamed Storm Semiconductor. The chip product name is Storlink SL3516.
+It was derived from earlier products from Storm named SL3316 (Centroid) and
+SL3512.
+
+Storm Semiconductor was acquired by Cortina Systems in 2008 and the SoC was
+produced and used for NAS and similar usecases. In 2014 Cortina Systems was
+in turn acquired by Inphi, who seem to have discontinued this product family.
+
+Required properties (in root node):
+	compatible = "cortina,gemini";
+
+Required nodes:
+
+- soc: the SoC should be represented by a simple bus encompassing all the
+  onchip devices, this is referred to as the soc bus node.
+
+- syscon: the soc bus node must have a system controller node pointing to the
+  global control registers, with the compatible string
+  "cortina,gemini-syscon", "syscon";
+
+- timer: the soc bus node must have a timer node pointing to the SoC timer
+  block, with the compatible string "cortina,gemini-timer"
+  See: clocksource/cortina,gemini-timer.txt
+
+- interrupt-controller: the sob bus node must have an interrupt controller
+  node pointing to the SoC interrupt controller block, with the compatible
+  string "cortina,gemini-interrupt-controller"
+  See interrupt-controller/cortina,gemini-interrupt-controller.txt
+
+Example:
+
+/ {
+	model = "Foo Gemini Machine";
+	compatible = "cortina,gemini";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x8000000>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+		interrupt-parent = <&intcon>;
+
+		syscon: syscon@40000000 {
+			compatible = "cortina,gemini-syscon", "syscon";
+			reg = <0x40000000 0x1000>;
+		};
+
+		uart0: serial@42000000 {
+			compatible = "ns16550a";
+			reg = <0x42000000 0x100>;
+			clock-frequency = <48000000>;
+			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+		};
+
+		timer@43000000 {
+			compatible = "cortina,gemini-timer";
+			reg = <0x43000000 0x1000>;
+			interrupt-parent = <&intcon>;
+			interrupts = <14 IRQ_TYPE_EDGE_RISING>, /* Timer 1 */
+				     <15 IRQ_TYPE_EDGE_RISING>, /* Timer 2 */
+				     <16 IRQ_TYPE_EDGE_RISING>; /* Timer 3 */
+			syscon = <&syscon>;
+		};
+
+		intcon: interrupt-controller@48000000 {
+			compatible = "cortina,gemini-interrupt-controller";
+			reg = <0x48000000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
