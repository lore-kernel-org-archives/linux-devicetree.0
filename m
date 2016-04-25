From: Wadim Egorov <w.egorov@phytec.de>
Subject: [PATCH v3 0/8] Add support for rk818
Date: Mon, 25 Apr 2016 15:20:40 +0200
Message-ID: <1461590448-47685-1-git-send-email-w.egorov@phytec.de>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, dianders@chromium.org, zyw@rock-chips.com
List-Id: devicetree@vger.kernel.org

Changes since v2:
- Split refactoring patch into 2 patches so this can be more easily reviewed
- Added Acked-by from Mark Brown in patch 5
- Added Acked-by from Rob Herring in patch 6
- Added Acked-by from Stephen Boyd in patch 7
- Added Acked-by from Alexandre Belloni in patch 8

Wadim Egorov (8):
  drivers: mfd: rk808: rename rk808 struct to rk8xx
  mfd: RK808: Add RK818 support
  regulator: rk808: remove linear range definitions with a single range
  regulator: rk808: Migrate to regulator core's simplified DT parsing
    code
  regulator: rk808: Add regulator driver for RK818
  mfd: dt-bindings: Add RK818 device tree bindings document
  clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808
  rtc: Kconfig: Name RK818 in Kconfig for RTC_DRV_RK808

 Documentation/devicetree/bindings/mfd/rk808.txt |  37 +-
 drivers/clk/Kconfig                             |   4 +-
 drivers/clk/clk-rk808.c                         |  20 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 253 +++++++++++---
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 427 +++++++++++++-----------
 drivers/rtc/Kconfig                             |   4 +-
 drivers/rtc/rtc-rk808.c                         |  50 +--
 include/linux/mfd/rk808.h                       | 164 ++++++++-
 10 files changed, 675 insertions(+), 292 deletions(-)

-- 
1.9.1

