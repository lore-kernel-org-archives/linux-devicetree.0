From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC 02/10] dt-bindings: interrupt-controller: add DT binding for meson GPIO interrupt controller
Date: Tue,  4 Oct 2016 17:08:20 +0200
Message-ID: <1475593708-10526-3-git-send-email-jbrunet@baylibre.com>
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475593708-10526-1-git-send-email-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This commit adds the device tree bindings description for Amlogic's GPIO
interrupt controller available on the meson8, meson8b and gxbb SoC families

Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 .../amlogic,meson-gpio-intc.txt                    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
new file mode 100644
index 000000000000..bd4cceefcda1
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -0,0 +1,39 @@
+Amlogic meson GPIO interrupt controller
+
+Meson SoCs contains an interrupt controller which is able watch the SoC pads
+and generate an interrupt on edges or level. The controller is essentially a
+256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
+or level and polarity. We don’t expose all 256 mux inputs because the
+documentation shows that upper part is not mapped to any pad. The actual number
+of interrupt exposed depends on the SoC.
+
+Required properties:
+
+- compatible : should be: "amlogic,meson8-gpio-intc” or
+  “amlogic,meson8b-gpio-intc” or “amlogic,gxbb-gpio-intc”
+- interrupts : List of the GIC’s interrupts used as parent interrupts.
+  There should 8 of these interrupts.
+- interrupt-parent : a phandle to the GIC the interrupts are routed to.
+  Usually this is provided at the root level of the device tree as it is
+  common to most of the SoC
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller.
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value must be 2.
+
+Exemple:
+
+gpio_interrupt: interrupt-controller@9880 {
+	compatible = "amlogic,gxbb-gpio-intc";
+	reg = <0x0 0x9880 0x0 0x10>;
+	interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+		   <GIC_SPI 65 IRQ_TYPE_NONE>,
+		   <GIC_SPI 66 IRQ_TYPE_NONE>,
+		   <GIC_SPI 67 IRQ_TYPE_NONE>,
+		   <GIC_SPI 68 IRQ_TYPE_NONE>,
+		   <GIC_SPI 69 IRQ_TYPE_NONE>,
+		   <GIC_SPI 70 IRQ_TYPE_NONE>,
+		   <GIC_SPI 71 IRQ_TYPE_NONE>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
