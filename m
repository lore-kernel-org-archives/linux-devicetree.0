From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 1/3] irqchip/meson-gpio: add support for Meson8 SoCs
Date: Mon, 30 Oct 2017 00:05:21 +0100
Message-ID: <20171029230523.7355-2-martin.blumenstingl@googlemail.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171029230523.7355-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meson8 uses the same GPIO interrupt controller IP block as the other
Meson SoCs. A total of 134 pins can be spied on, which is the sum of:
- 22 pins on bank GPIOX
- 17 pins on bank GPIOY
- 30 pins on bank GPIODV
- 10 pins on bank GPIOH
- 15 pins on bank GPIOZ
- 7 pins on bank CARD
- 19 pins on bank BOOT
- 14 pins in the AO domain

Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
 drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
index 633e21ce4b17..a83f9a5734ca 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -10,6 +10,7 @@ number of interrupt exposed depends on the SoC.
 Required properties:
 
 - compatible : must have "amlogic,meson8-gpio-intc” and either
+   “amlogic,meson8-gpio-intc” for meson8 SoCs (S802) or
    “amlogic,meson8b-gpio-intc” for meson8b SoCs (S805) or
    “amlogic,meson-gxbb-gpio-intc” for GXBB SoCs (S905) or
    “amlogic,meson-gxl-gpio-intc” for GXL SoCs (S905X, S912)
diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index c7cc7e37a23c..a59bdbc0b9bb 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -47,6 +47,10 @@ struct meson_gpio_irq_params {
 	unsigned int nr_hwirq;
 };
 
+static const struct meson_gpio_irq_params meson8_params = {
+	.nr_hwirq = 134,
+};
+
 static const struct meson_gpio_irq_params meson8b_params = {
 	.nr_hwirq = 119,
 };
@@ -60,6 +64,7 @@ static const struct meson_gpio_irq_params gxl_params = {
 };
 
 static const struct of_device_id meson_irq_gpio_matches[] = {
+	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
 	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
 	{ .compatible = "amlogic,meson-gxbb-gpio-intc", .data = &gxbb_params },
 	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
