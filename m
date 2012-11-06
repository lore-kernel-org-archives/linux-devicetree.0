From: Qing Xu <qingx@marvell.com>
Subject: [PATCH 0/7] mfd: update on max8925 for DT support
Date: Tue,  6 Nov 2012 15:35:05 +0800
Message-ID: <1352187305-9660-1-git-send-email-qingx@marvell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: qingx@marvell.com, sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, haojian.zhuang@gmail.com, cxie4@marvell.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Qing Xu <qingx@marvell.com>

1. add irqdomain for max8925, it is necessary for dt support
2. bug fix in max8925 mfd devices'irq base and device registry failure
3. support DT for max8925 mfd devices

Qing Xu (7):
  mfd: max8925: add irqdomain for dt
  mfd: max8925: fix mfd device register failure
  mfd: max8925: fix onkey driver irq base
  mfd: max8925: support dt for power supply
  mfd: max8925: support dt for regulator
  mfd: max8925: support dt for backlight
  mfd: max8925: add dts

 arch/arm/boot/dts/mmp2-brownstone.dts |  166 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/mmp2.dtsi           |    4 +-
 drivers/input/misc/max8925_onkey.c    |    3 -
 drivers/mfd/max8925-core.c            |  107 +++++++++++++--------
 drivers/mfd/max8925-i2c.c             |   32 ++++++-
 drivers/power/max8925_power.c         |   57 ++++++++++-
 drivers/regulator/max8925-regulator.c |   35 +++++++-
 drivers/video/backlight/max8925_bl.c  |   31 ++++++-
 include/linux/mfd/max8925.h           |   12 ++-
 9 files changed, 389 insertions(+), 58 deletions(-)
