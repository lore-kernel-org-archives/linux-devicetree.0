From: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH v6 0/4] Add STM32 EXTI interrupt controller support
Date: Tue, 20 Sep 2016 18:00:55 +0200
Message-ID: <1474387259-18926-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This v6 fix useless mask in .free callback of stm32 exti driver (thanks
Thomas).
I resend only patches concerning STM32 EXTI driver (as pinctrl part has
already been applied by Linus W.)


The series adds support to EXTI interrupt controller and GPIO IRQ support in
STM32 pinctrl driver.

The STM32 external interrupt controller consists of edge detectors that
generate interrupts requests or wake-up events.

Each line can be independently configured as interrupt or wake-up source,
and triggers either on rising, fallin or both edges. Each line can also
be masked independently.

Regards 

Alex

Changes since v5:
-----------------
 - Fix .free callback according to Thomas

Changes since v4:
-----------------
 - Fix bad copy/paste in stm32 exti driver
 - Remove GPIOLIB_IRQCHIP config in stm32 pinctrl driver 

Changes since v3:
-----------------
 - Review domain dealloc/free irq in stm32 pinctrl driver
 - Review domain dealloc/free irq in stm32 exti driver
 - Fix remarks on coding style

Changes since v2:
-----------------
 - Define irq_chip for GPIO banks
 - Use hierarchical domain for GPIO banks
 - Improve search loop inside stm32_exti handler 
 - Rebased on top of v4.8-rc1

Changes since v1:
-----------------
 - Rebased on top of v4.6-rc1
 - Change variable name from virq to irq (Linus W.)


Alexandre TORGUE (4):
  Documentation: dt-bindings: Document STM32 EXTI controller bindings
  drivers: irqchip: Add STM32 external interrupts support
  ARM: STM32: Select external interrupts controller
  ARM: dts: Add EXTI controller node to stm32f429

 .../interrupt-controller/st,stm32-exti.txt         |  20 ++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/stm32f429.dtsi                   |   8 +
 drivers/irqchip/Kconfig                            |   4 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-stm32-exti.c                   | 201 +++++++++++++++++++++
 6 files changed, 235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/st,stm32-exti.txt
 create mode 100644 drivers/irqchip/irq-stm32-exti.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
