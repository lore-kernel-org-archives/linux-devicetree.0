From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 00/11] ARM: davinci: modernize the timer support
Date: Tue, 26 Feb 2019 13:06:22 +0100
Message-ID: <20190226120633.18200-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, David Lechner <david@lechnology.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Sekhar,

merge window will be later than expected so I'm sending this now rebased
on top of your v5.1/soc branch - that way you'll be able to pick it up
early in the next release cycle.

---

This series removes the legacy timer code from mach-davinci in favor of
a new clocksource driver it introduces.

Patch 1 adds a new clocksource driver for davinci.

Patch 2 enables the new driver for device-tree based systems.

Patch 3 adds a WARN_ON() to the machine code of all davinci boards
which is triggered if clk_get() for the timer clock fails. This is needed
as the new driver expects the clock to be functional and doesn't check it.

Patches 4-5 and 7-10 switch the board files to using the new
clocksource driver while patch 6 moves some necessary defines to
a different place since we'll be removing the file that contains them.

Patch 11 removes legacy timer code.

v1 -> v2:

- changed the license to GPL-only
- dropped regmap usage due to the additional code paths making the
  code too slow
- minor code rearrangement
- fixed the da830 timer configuration
- correctly assign the timer halfs to clocksource and clockevent
- sqashed the commits adding WARN() when clk_get() fails
- used WARN_ON() and added a return when clk_get() fails to avoid
  entering the timer driver without a valid clock
- request the register range before iomapping it
- simplified the configuration structure (dropped the additional cmp struct)

v2 -> v3:

- use readl/writel_relaxed() instead of __raw variants in the clocksource
  driver
- request the memory region before remapping it
- add explanatory comments
- fixed licensing
- used pr_fmt macro
- correctly assign the clocksource name
- use DEFINE_RES_x macros when defining resources to avoid off-by-one
  bugs in resource's size
- tweak the commit messages
- don't delete the comments describing the timer usage
- other minor improvements
- rebased on top of Sekhar's soc branch
- dropped patch fixing the clocksource interrupts in device tree (already
  upstream)

Bartosz Golaszewski (11):
  clocksource: davinci-timer: new driver
  ARM: davinci: enable the clocksource driver for DT mode
  ARM: davinci: WARN_ON() if clk_get() fails
  ARM: davinci: da850: switch to using the clocksource driver
  ARM: davinci: da830: switch to using the clocksource driver
  ARM: davinci: move timer definitions to davinci.h
  ARM: davinci: dm355: switch to using the clocksource driver
  ARM: davinci: dm365: switch to using the clocksource driver
  ARM: davinci: dm644x: switch to using the clocksource driver
  ARM: davinci: dm646x: switch to using the clocksource driver
  ARM: davinci: remove legacy timer support

 arch/arm/Kconfig                            |   1 +
 arch/arm/mach-davinci/Makefile              |   3 +-
 arch/arm/mach-davinci/da830.c               |  40 +-
 arch/arm/mach-davinci/da850.c               |  45 +-
 arch/arm/mach-davinci/davinci.h             |   3 +
 arch/arm/mach-davinci/devices-da8xx.c       |   1 -
 arch/arm/mach-davinci/devices.c             |  19 -
 arch/arm/mach-davinci/dm355.c               |  22 +-
 arch/arm/mach-davinci/dm365.c               |  22 +-
 arch/arm/mach-davinci/dm644x.c              |  28 +-
 arch/arm/mach-davinci/dm646x.c              |  28 +-
 arch/arm/mach-davinci/include/mach/common.h |  17 -
 arch/arm/mach-davinci/include/mach/time.h   |  35 --
 arch/arm/mach-davinci/time.c                | 414 ------------------
 drivers/clocksource/Kconfig                 |   5 +
 drivers/clocksource/Makefile                |   1 +
 drivers/clocksource/timer-davinci.c         | 438 ++++++++++++++++++++
 include/clocksource/timer-davinci.h         |  44 ++
 18 files changed, 584 insertions(+), 582 deletions(-)
 delete mode 100644 arch/arm/mach-davinci/include/mach/time.h
 delete mode 100644 arch/arm/mach-davinci/time.c
 create mode 100644 drivers/clocksource/timer-davinci.c
 create mode 100644 include/clocksource/timer-davinci.h

-- 
2.20.1
