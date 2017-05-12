From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 3/6] pintrl: meson: add DT node for GPIO IRQ on Meson GX
Date: Fri, 12 May 2017 21:13:44 +0200
Message-ID: <ff909b0e-a161-1940-c047-e1f8207e8631@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add the DT node for GPIO IRQ support on AMlogic Meson GX.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
---
 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt

diff --git a/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
new file mode 100644
index 00000000..ba7d3015
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
+- compatible : should be "amlogic,meson-gpio-interrupt".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : list of GIC interrupts which can be used with the
+	       GPIO IRQ multiplexer
+
+Example:
+
+gpio_irq@9880 {
+	compatible = "amlogic,meson-gpio-interrupt";
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


