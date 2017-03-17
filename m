From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v4 0/7] rk808: Add RK805 support
Date: Fri, 17 Mar 2017 15:06:10 +0800
Message-ID: <1489734377-1716-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, w.egorov@phytec.de, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

change in v4:
PATCH V4 1/7: NO change in V4
PATCH V4 2/7: rename the commit message
PATCH V4 3/7: NO change in V4
PATCH V4 4/7: Split this patch up into subsystems patch 5/7 6/7
PATCH V4 5/7: new added
PATCH V4 6/7: new added
PATCH V4 7/7: NO change in V4


change in V3:
PATCH V3 1/5: NO change in V3
PATCH V3 2/5: add rk805 RTC INT MASK define
PATCH V3 3/5: RK805 set suspend enable and disable is different from rk808
              use rk805_regs_ops and rk805_switch_ops
PATCH V3 4/5: fix up the shutdown func
              use pm_shutdown_prepare_fn to prepare shutdown
              and pm_pwroff_fn pull down gpio to shut down rk805
              it will update in the future(after rk808 support gpio func)
PATCH V3 5/5: NO change in V3

change in V2:
PATCH V2 1/5: NO change in V2
PATCH V2 2/5: add rk805 BUCK ILMAX define
PATCH V2 3/5: NO change in V2
PATCH V2 4/5: setting RK805 BUCK ILMAX in pre init
PATCH V2 5/5: Add RK805 device tree bindings document

Elaine Zhang (7):
  mfd: rk808: fix up the chip id get failed
  mfd: rk808: add rk805 regs addr and ID
  regulator: rk808: Add regulator driver for RK805
  mfd: rk808: Add RK805 support
  clk: Kconfig: Name RK805 in Kconfig for COMMON_CLK_RK808
  rtc: Kconfig: Name RK805 in Kconfig for RTC_DRV_RK808
  mfd: dt-bindings: Add RK805 device tree bindings document

 Documentation/devicetree/bindings/mfd/rk808.txt |  20 +++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 143 +++++++++++++++++++++++-
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             | 130 +++++++++++++++++++++
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 120 ++++++++++++++++++++
 8 files changed, 414 insertions(+), 15 deletions(-)

-- 
1.9.1
