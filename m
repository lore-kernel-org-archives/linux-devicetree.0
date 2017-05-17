From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RfC v3 0/7] pintrl: meson: add support for GPIO IRQs
Date: Wed, 17 May 2017 22:02:42 +0200
Message-ID: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>
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

Known open issues:
- location of the irqchip driver and its DT binding documentation

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

Heiner Kallweit (7):
  pinctrl: meson: add interrupts to pinctrl data
  pinctrl: meson: document GPIO IRQ DT binding
  pinctrl: meson: add DT node for GPIO IRQ on Meson GX
  pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
  pinctrl: meson: improve meson_get_bank and export it
  pinctrl: meson: add support for GPIO interrupts
  pinctrl: meson: add interrupt controller to GPIO DT nodes

 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt |  30 ++
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  |   4 +
 arch/arm/boot/dts/meson8.dtsi                      |  15 +
 arch/arm/boot/dts/meson8b.dtsi                     |  15 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  13 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   4 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/meson/Makefile                     |   2 +-
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  22 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  20 +-
 drivers/pinctrl/meson/pinctrl-meson-irq.c          | 320 +++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson.c              |  62 ++--
 drivers/pinctrl/meson/pinctrl-meson.h              |  19 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  20 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  32 ++-
 16 files changed, 502 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-irq.c

-- 
2.13.0

