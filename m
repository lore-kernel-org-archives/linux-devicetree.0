From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 0/5] rk808: Add RK805 support
Date: Fri, 10 Mar 2017 10:00:47 +0800
Message-ID: <1489111252-22175-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc: huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, w.egorov@phytec.de, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

change in V2:
PATCH V2 1/5: NO change in V2
PATCH V2 2/5: add rk805 BUCK ILMAX define
PATCH V2 3/5: NO change in V2
PATCH V2 4/5: setting RK805 BUCK ILMAX in pre init
PATCH V2 5/5: Add RK805 device tree bindings document

Elaine Zhang (5):
  mfd: rk808: fix up the chip id get failed
  linux: mfd: rk808: add rk805 regs addr and ID
  regulator: rk808: Add regulator driver for RK805
  mfd: rk808: Add RK805 support
  mfd: dt-bindings: Add RK805 device tree bindings document

 Documentation/devicetree/bindings/mfd/rk808.txt |  20 +++-
 drivers/clk/Kconfig                             |   4 +-
 drivers/mfd/Kconfig                             |   4 +-
 drivers/mfd/rk808.c                             | 138 ++++++++++++++++++++++--
 drivers/regulator/Kconfig                       |   4 +-
 drivers/regulator/rk808-regulator.c             |  66 ++++++++++++
 drivers/rtc/Kconfig                             |   4 +-
 include/linux/mfd/rk808.h                       | 116 ++++++++++++++++++++
 8 files changed, 341 insertions(+), 15 deletions(-)

-- 
1.9.1
