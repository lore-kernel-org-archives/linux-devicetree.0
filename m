From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/17] ARM: davinci: modernize the timer support
Date: Fri, 11 Jan 2019 18:21:17 +0100
Message-ID: <20190111172134.30147-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series removes the legacy timer code from mach-davinci in favor of
a new clocksource driver it introduces.

The first patch fixes a device tree bug that's been around for a while.
Unfortunately any systems shipped with the buggy device will stop booting
once they switch to the new clocksource driver.

Patch 2 adds a new clocksource driver for davinci.

Patch 3 enables the new driver for device-tree based systems.

Patches 4-9 add a WARN() to the machine code of all davinci boards
which is triggered if clk_get() for the timer clock fails. This is needed
as the new driver expects the clock to be functional and doesn't check it.

Patches 10-11 and 13-16 switch the board files to using the new
clocksource driver while patch 12 moves some necessary defines to
a different place since we'll be removing the file that contains them.

Patch 17 removes legacy timer code.

Bartosz Golaszewski (17):
  ARM: dts: da850: fix interrupt numbers for clocksource
  clocksource: davinci-timer: new driver
  ARM: davinci: enable the clocksource driver for DT mode
  ARM: davinci: da850: WARN() if clk_get() fails
  ARM: davinci: da830: WARN() if clk_get() fails
  ARM: davinci: dm355: WARN() if clk_get() fails
  ARM: davinci: dm365: WARN() if clk_get() fails
  ARM: davinci: dm644x: WARN() if clk_get() fails
  ARM: davinci: dm646x: WARN() if clk_get() fails
  ARM: davinci: da850: switch to using the clocksource driver
  ARM: davinci: da830: switch to using the clocksource driver
  ARM: davinci: move timer definitions to davinci.h
  ARM: davinci: dm355: switch to using the clocksource driver
  ARM: davinci: dm365: switch to using the clocksource driver
  ARM: davinci: dm644x: switch to using the clocksource driver
  ARM: davinci: dm646x: switch to using the clocksource driver
  ARM: davinci: remove legacy timer support

 arch/arm/Kconfig                            |   1 +
 arch/arm/boot/dts/da850.dtsi                |   2 +-
 arch/arm/mach-davinci/Makefile              |   3 +-
 arch/arm/mach-davinci/da830.c               |  57 +--
 arch/arm/mach-davinci/da850.c               |  57 ++-
 arch/arm/mach-davinci/davinci.h             |   3 +
 arch/arm/mach-davinci/devices-da8xx.c       |   1 -
 arch/arm/mach-davinci/devices.c             |  19 -
 arch/arm/mach-davinci/dm355.c               |  37 +-
 arch/arm/mach-davinci/dm365.c               |  31 +-
 arch/arm/mach-davinci/dm644x.c              |  37 +-
 arch/arm/mach-davinci/dm646x.c              |  37 +-
 arch/arm/mach-davinci/include/mach/common.h |  17 -
 arch/arm/mach-davinci/include/mach/time.h   |  35 --
 arch/arm/mach-davinci/time.c                | 414 -------------------
 drivers/clocksource/Kconfig                 |   5 +
 drivers/clocksource/Makefile                |   1 +
 drivers/clocksource/timer-davinci.c         | 415 ++++++++++++++++++++
 include/clocksource/timer-davinci.h         |  35 ++
 19 files changed, 611 insertions(+), 596 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/include/mach/time.h
 delete mode 100644 arch/arm/mach-davinci/time.c
 create mode 100644 drivers/clocksource/timer-davinci.c
 create mode 100644 include/clocksource/timer-davinci.h

-- 
2.19.1
