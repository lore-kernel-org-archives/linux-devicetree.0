From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, Clk, GPIO, Power, Regulator
 and RTC due for the v5.3 merge window
Date: Thu, 27 Jun 2019 14:30:27 +0100
Message-ID: <20190627133027.GC2000@dell>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-clk-gpio-power-regulator-rtc-v5.3

for you to fetch changes up to f8c7f7ddd8ef0855d06cff5d1cc7713b556006a7:

  power: supply: Initial support for ROHM BD70528 PMIC charger block (2019-06-27 10:57:24 +0100)

----------------------------------------------------------------
Immutable branch between MFD, Clk, GPIO, Power, Regulator and RTC due for the v5.3 merge window

----------------------------------------------------------------
Matti Vaittinen (7):
      mfd: regulator: clk: Split rohm-bd718x7.h
      mfd: bd70528: Support ROHM bd70528 PMIC core
      clk: bd718x7: Support ROHM BD70528 clk block
      dt-bindings: mfd: Document first ROHM BD70528 bindings
      gpio: Initial support for ROHM bd70528 GPIO block
      rtc: bd70528: Initial support for ROHM bd70528 RTC
      power: supply: Initial support for ROHM BD70528 PMIC charger block

 .../devicetree/bindings/mfd/rohm,bd70528-pmic.txt  | 102 +++
 drivers/clk/Kconfig                                |   6 +-
 drivers/clk/clk-bd718x7.c                          |  24 +-
 drivers/gpio/Kconfig                               |  11 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-bd70528.c                        | 232 +++++++
 drivers/mfd/Kconfig                                |  17 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/rohm-bd70528.c                         | 316 +++++++++
 drivers/mfd/rohm-bd718x7.c                         |  23 +-
 drivers/power/supply/Kconfig                       |   9 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/bd70528-charger.c             | 743 +++++++++++++++++++++
 drivers/regulator/bd718x7-regulator.c              |  25 +-
 drivers/rtc/Kconfig                                |   8 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-bd70528.c                          | 500 ++++++++++++++
 include/linux/mfd/rohm-bd70528.h                   | 408 +++++++++++
 include/linux/mfd/rohm-bd718x7.h                   |  22 +-
 include/linux/mfd/rohm-generic.h                   |  20 +
 20 files changed, 2425 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd70528-pmic.txt
 create mode 100644 drivers/gpio/gpio-bd70528.c
 create mode 100644 drivers/mfd/rohm-bd70528.c
 create mode 100644 drivers/power/supply/bd70528-charger.c
 create mode 100644 drivers/rtc/rtc-bd70528.c
 create mode 100644 include/linux/mfd/rohm-bd70528.h
 create mode 100644 include/linux/mfd/rohm-generic.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
