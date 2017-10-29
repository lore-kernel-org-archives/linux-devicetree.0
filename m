From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] Meson8 GPIO interrupt support
Date: Mon, 30 Oct 2017 00:05:20 +0100
Message-ID: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a simple follow-up of two series from Jerome:
- "irqchip: meson: add support for the gpio interrupt controller"
- "ARM: meson: enable gpio interrupt controller"

This fills in the missing bits to have GPIO interrupt support on Meson8,
which includes:
- a new binding in the driver with the correct IRQ number
- enabling the GPIO interrupt controller in meson8.dts
- enabling the GPIO interrupt controller via Kconfig for MACH_MESON8


Martin Blumenstingl (3):
  irqchip/meson-gpio: add support for Meson8 SoCs
  ARM: dts: meson8: enable the GPIO interrupt controller
  ARM: meson: enable MESON_IRQ_GPIO also for MACH_MESON8

 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt        | 1 +
 arch/arm/boot/dts/meson8.dtsi                                        | 5 +++++
 arch/arm/mach-meson/Kconfig                                          | 1 +
 drivers/irqchip/irq-meson-gpio.c                                     | 5 +++++
 4 files changed, 12 insertions(+)

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
