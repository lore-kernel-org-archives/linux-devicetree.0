From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/5] mfd: sec-core: Add support S2MPS13 PMIC device
Date: Mon, 17 Nov 2014 09:42:55 +0900
Message-ID: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org, mturquette@linaro.org, a.zummo@towertech.it
Cc: lgirdwood@gmail.com, sbkim73@samsung.com, sameo@linux.intel.com, geunsik.lim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

This patchset adds Samsung S2MPS13 PMIC device driver in existing S2MPS11 PMIC
driver. The S2MPS13 has just the differnet number of regulator from existing
S2MPS14 PMIC and RTC/CLOCK IP of S2MPS13 is the same with S2MPS14. S2MPS13
PMIC has LDO[1-40] and BUCK[1-10] regulators.

Chanwoo Choi (5):
  mfd: sec-core: Add support for S2MPS13 device
  regulator: s2mps11: Add support S2MPS13 regulator device
  clk: s2mps11: Add the support for S2MPS13 PMIC clock
  rtc: s5m: Add the support for S2MPS13 RTC
  mfd: s2mps11: Add binding documentation for Samsung S2MPS13 PMIC

 Documentation/devicetree/bindings/mfd/s2mps11.txt |  22 +--
 drivers/clk/clk-s2mps11.c                         |  24 +++
 drivers/mfd/sec-core.c                            |  31 ++++
 drivers/mfd/sec-irq.c                             |  23 ++-
 drivers/regulator/Kconfig                         |  10 +-
 drivers/regulator/s2mps11.c                       | 102 +++++++++++-
 drivers/rtc/rtc-s5m.c                             |  15 +-
 include/linux/mfd/samsung/core.h                  |   2 +
 include/linux/mfd/samsung/s2mps13.h               | 186 ++++++++++++++++++++++
 9 files changed, 390 insertions(+), 25 deletions(-)
 create mode 100644 include/linux/mfd/samsung/s2mps13.h

-- 
1.8.5.5
