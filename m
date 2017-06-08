From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v6 0/9] pinctrl: meson: add support for GPIO IRQs
Date: Thu, 8 Jun 2017 21:14:51 +0200
Message-ID: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
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

Changes in v5:
- smaller changes based on review comments
- split DT patches per ARM / ARM64

Changes in v6:
- based on suggestion by Rob Herring: rename DT property parent-interrupts to interrupts

Heiner Kallweit (7):
  pinctrl: meson: add interrupts to pinctrl data
  irqchip: add Amlogic Meson GPIO irqchip driver
  dt-bindings: add Amlogic Meson GPIO interrupt-controller DT binding documentation
  ARM: dts: meson: add GPIO interrupt-controller support
  ARM64: dts: meson: add GPIO interrupt-controller support
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
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-meson-gpio.c                   | 296 +++++++++++++++++++++
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  22 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  20 +-
 drivers/pinctrl/meson/pinctrl-meson.c              | 170 +++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h              |  15 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  20 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  32 ++-
 17 files changed, 605 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 drivers/irqchip/irq-meson-gpio.c

-- 
2.13.0
