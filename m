From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v7 0/9] pinctrl: meson: add support for GPIO IRQs
Date: Sat, 10 Jun 2017 23:37:18 +0200
Message-ID: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

This patch series is partially based on a series Jerome Brunet
submitted about half a year ago. Due to open questions this series never
made it to mainline, see https://patchwork.kernel.org/patch/9384431/

This new attempt uses GPIOLIB_IRQCHIP resulting in less needed code.

The series was successfully tested on a Odroid-C2.

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

Changes in v5:
- smaller changes based on review comments
- split DT patches per ARM / ARM64

Changes in v6:
- based on suggestion by Rob Herring: rename DT property parent-interrupts to interrupts

Changes in v7:
- remove patch 1 as it was applied to the pinctrl tree already
- add patch 5 as prerequisite for reworked patch 6
- remove IRQ_TYPE_EDGE_BOTH support from patch 6

Heiner Kallweit (7):
  irqchip: add Amlogic Meson GPIO irqchip driver
  dt-bindings: add Amlogic Meson GPIO interrupt-controller DT binding documentation
  ARM: dts: meson: add GPIO interrupt-controller support
  ARM64: dts: meson: add GPIO interrupt-controller support
  gpiolib: export gpiochip_irq_reqres and gpiochip_irq_relres
  pinctrl: meson: add support for GPIO interrupts
  pinctrl: meson: update DT binding documentation
  ARM: dts: meson: mark gpio controllers as interrupt controllers
  ARM64: dts: meson: mark gpio controllers as interrupt controllers

.../amlogic,meson-gpio-intc.txt                    |  26 ++
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   4 +
 arch/arm/boot/dts/meson8.dtsi                      |  12 +
 arch/arm/boot/dts/meson8b.dtsi                     |  12 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |   8 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   4 +
 drivers/gpio/gpiolib.c                             |   6 +-
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-meson-gpio.c                   | 295 +++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/meson/pinctrl-meson.c              | 176 +++++++++++-
 include/linux/gpio/driver.h                        |   3 +
 14 files changed, 554 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 drivers/irqchip/irq-meson-gpio.c

-- 
2.13.1
