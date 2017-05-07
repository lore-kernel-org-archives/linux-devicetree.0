From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/5] pintrl: meson: document GPIO IRQ DT binding
Date: Sun, 7 May 2017 18:34:09 +0200
Message-ID: <0d835130-7c6c-751c-af15-c2ab69edcb42@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.

This documentation is intentionally not placed under
interrupt-controllers as GPIO IRQ support on these SoC's acts more
like an interrupt multiplexer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt

diff --git a/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
new file mode 100644
index 00000000..35a052b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
@@ -0,0 +1,30 @@
+Amlogic meson GPIO interrupt controller
+
+Meson SoCs contains an interrupt controller which is able watch the SoC pads
+and generate an interrupt on edges or level. The controller is essentially a
+256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
+or level and polarity. We don't expose all 256 mux inputs because the
+documentation shows that upper part is not mapped to any pad. The actual number
+of interrupt exposed depends on the SoC.
+
+Required properties:
+
+- compatible : should be "amlogic,meson-gpio-interrupt", "syscon".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : list of GIC interrupts which can be used with the
+	       GPIO IRQ multiplexer
+
+Example:
+
+gpio_irq@9880 {
+	compatible = "amlogic,meson-gpio-interrupt", "syscon";
+	reg = <0x0 0x09880 0x0 0x10>;
+	interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+		     <GIC_SPI 65 IRQ_TYPE_NONE>,
+		     <GIC_SPI 66 IRQ_TYPE_NONE>,
+		     <GIC_SPI 67 IRQ_TYPE_NONE>,
+		     <GIC_SPI 68 IRQ_TYPE_NONE>,
+		     <GIC_SPI 69 IRQ_TYPE_NONE>,
+		     <GIC_SPI 70 IRQ_TYPE_NONE>,
+		     <GIC_SPI 71 IRQ_TYPE_NONE>;
+	};
-- 
2.12.2


