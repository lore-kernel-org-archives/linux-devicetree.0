From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 00/23] U300 device tree series
Date: Mon, 22 Apr 2013 11:51:11 +0200
Message-ID: <1366624271-6088-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This converts the U300 machine to use device tree exclusively,
and deletes the static board data and selects USE_OF.

This will be followed by a series for multiplatform, and a
final vacuum-cleaning step removing the non-DT support from
the drivers only used by U300.

But for now let's get the device tree conversion done first.

I'm seeking ACKs from apropriate subsystem maintainers.

Linus Walleij (23):
  ARM: u300: fix ages old copy/paste bug
  ARM: u300: enabled delaytimer on the U300
  ARM: u300: device tree support for the timer
  pinctrl: u300 device tree support
  pinctrl: coh901: add device tree support
  ARM: u300: basic device tree support
  i2c: stu300: device tree support
  ARM: u300: register I2C bus drivers from device tree
  watchdog: coh901327: devicetree support
  ARM: u300: add the COH 901 327 watchdog to device tree
  rtc: coh901331: add devicetree support
  ARM: u300: add RTC to device tree
  regulator: ab3100: refactor probe to use IDs
  regulator: ab3100: device tree support
  ARM: u300: set up board power from device tree
  ARM: u300: support regulators in the device tree
  ARM: u300: enable MMC/SD card from device tree
  dma: coh901318: add devicetree support
  ARM: u300: add the COH 901 318 DMAC to device tree
  ARM: u300: add SPI PL022 to the device tree
  ARM: u300: probe the U300 dummy-spichip from device tree
  ARM: u300: add FSMC flash into the device tree
  ARM: u300: delete all static board data

 Documentation/devicetree/bindings/arm/ste-u300.txt |  22 +
 .../bindings/gpio/gpio-stericsson-coh901.txt       |   9 +
 .../devicetree/bindings/i2c/i2c-st-ddci2c.txt      |  15 +
 .../bindings/timer/stericsson-u300-apptimer.txt    |  18 +
 .../bindings/watchdog/stericsson-coh901327.txt     |  15 +
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/ste-u300.dts                     | 256 +++++++++
 arch/arm/mach-u300/Makefile                        |   2 -
 arch/arm/mach-u300/core.c                          | 573 ++++-----------------
 arch/arm/mach-u300/dummyspichip.c                  |   6 +
 arch/arm/mach-u300/i2c.c                           | 285 ----------
 arch/arm/mach-u300/i2c.h                           |  23 -
 arch/arm/mach-u300/include/mach/u300-regs.h        |   2 +-
 arch/arm/mach-u300/regulator.c                     |  36 +-
 arch/arm/mach-u300/spi.c                           | 102 ----
 arch/arm/mach-u300/spi.h                           |  26 -
 arch/arm/mach-u300/timer.c                         | 106 ++--
 arch/arm/mach-u300/u300-gpio.h                     |  70 ---
 drivers/dma/coh901318.c                            |   5 +
 drivers/i2c/busses/i2c-stu300.c                    |  12 +
 drivers/mfd/ab3100-core.c                          |   1 +
 drivers/pinctrl/pinctrl-coh901.c                   |   9 +
 drivers/pinctrl/pinctrl-u300.c                     |   7 +
 drivers/regulator/ab3100.c                         | 209 ++++++--
 drivers/rtc/rtc-coh901331.c                        |   6 +
 drivers/watchdog/coh901327_wdt.c                   |   6 +
 27 files changed, 763 insertions(+), 1060 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/ste-u300.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-st-ddci2c.txt
 create mode 100644 Documentation/devicetree/bindings/timer/stericsson-u300-apptimer.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
 create mode 100644 arch/arm/boot/dts/ste-u300.dts
 delete mode 100644 arch/arm/mach-u300/i2c.c
 delete mode 100644 arch/arm/mach-u300/i2c.h
 delete mode 100644 arch/arm/mach-u300/spi.c
 delete mode 100644 arch/arm/mach-u300/spi.h
 delete mode 100644 arch/arm/mach-u300/u300-gpio.h

-- 
1.7.11.3
