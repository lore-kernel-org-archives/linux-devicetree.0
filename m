From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/5 RfC] pintrl: meson: add support for GPIO IRQs
Date: Sun, 7 May 2017 18:19:22 +0200
Message-ID: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series is partially based on a series Jerome Brunet
submitted about half a year ago. Due to open questions this series never
made it to mainline, see https://patchwork.kernel.org/patch/9384431/

This new attempt uses GPIOLIB_IRQCHIP resulting in less needed code.
Included is also support for using two parent IRQs in case
of IRQ_TYPE_EDGE_BOTH, like in the vendor driver.

Worth to be mentioned is also that I had to work around a strange
issue with spurious interrupts resulting in a deadlock.
The affected critical section in __setup_irq is executed with interrupts
disabled, nevertheless spurious GPIO IRQs result in a deadlock what
seems to indicate that they are handled on the same CPU.
I didn't find a better explanation than a possible HW flaw so far.

The series was successfully tested on a Odroid-C2, e.g. with removing
polling for SD card insertion/removal from the mmc driver.

Heiner Kallweit (5):
  pinctrl: meson: add interrupts to pinctrl data
  pinctrl: meson: document GPIO IRQ DT binding
  pinctrl: meson: add DT node for GPIO IRQ on Meson GX
  pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
  pinctrl: meson: add support for GPIO interrupts

 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt |  30 ++
 arch/arm/boot/dts/meson8.dtsi                      |  13 +
 arch/arm/boot/dts/meson8b.dtsi                     |  13 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  13 +
 drivers/pinctrl/Kconfig                            |   1 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c         |  22 +-
 drivers/pinctrl/meson/pinctrl-meson-gxl.c          |  20 +-
 drivers/pinctrl/meson/pinctrl-meson.c              | 338 ++++++++++++++++++++-
 drivers/pinctrl/meson/pinctrl-meson.h              |  27 +-
 drivers/pinctrl/meson/pinctrl-meson8.c             |  20 +-
 drivers/pinctrl/meson/pinctrl-meson8b.c            |  32 +-
 11 files changed, 482 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt

-- 
2.12.2

