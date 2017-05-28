From: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RfC v4 0/6] pintrl: meson: add support for GPIO IRQs
Date: Sun, 28 May 2017 20:40:30 +0200
Message-ID: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series is partially based on a series Jerome Brunet
submitted about half a year ago. Due to open questions this series never
made it to mainline, see https://patchwork.kernel.org/patch/9384431/

This new attempt uses GPIOLIB_IRQCHIP resulting in less needed code.
Included is also support for using two parent IRQs in case
of IRQ_TYPE_EDGE_BOTH, like in the vendor driver.

The series was successfully tested on a Odroid-C2, e.g. with removing
polling for SD card insertion/removal from the mmc driver.

Changes in v2:
- separate the GPIO IRQ controller from the pinctrl driver
- minor improvements to the GPIO IRQ controller

Changes in v3:
- replace the request_irq based allocation of parent irq's with
  chained irq handling, this also fixes the spurious interrupts issue
  and allows to remove the workaround code.
  Last but not least the parent irq's are no longer visible in
  /proc/interrupts.
- minor improvements to the GPIO IRQ controller

Changes in v4:
- separate the gpio-independent interrupt controller part and make
  it a driver under drivers/irqchip

Heiner Kallweit (7):
  pinctrl: meson: add interrupts to pinctrl data
  irqchip: add Amlogic Meson GPIO irqchip driver
  dt-bindings: add Amlogic Meson GPIO interrupt-controller DT binding documentation
  ARM(64): dts: meson: add GPIO interrupt-controller support
  pinctrl: meson: add support for GPIO interrupts
  ARM(64): dts: meson: mark gpio controllers as interrupt controllers and update binding documentation

.../amlogic,meson-gpio-intc.txt                    |  26 ++
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   4 +
 arch/arm/boot/dts/meson8.dtsi                      |  12 +
 arch/arm/boot/dts/meson8b.dtsi                     |  12 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   8 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   4 +
 drivers/irqchip/Kconfig                            |   3 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-meson-gpio.c                   | 280 +++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   2 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  22 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  20 +-
 drivers/pinctrl/meson/pinctrl-meson.c              | 164 +++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h              |  15 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  20 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  32 ++-
 17 files changed, 582 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 drivers/irqchip/irq-meson-gpio.c

-- 
2.13.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
