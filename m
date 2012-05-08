From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 0/6 v3] Update TPS65910 to boot using devicetree
Date: Tue, 8 May 2012 11:42:37 -0700
Message-ID: <1336502563-31789-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rhyland Klein <rklein@nvidia.com>
List-Id: devicetree@vger.kernel.org

This patch set updates the tps65910 driver to boot using devicetree.

This patch set now uses the new addition to the of_regulator code,
of_regulator_match to find all the regulator init data for the device.

Rhyland Klein (6):
  mfd: tps65910: Commonize regmap access through header
  regulator: tps65910: Add device tree bindings
  mfd: tps65910: Add device-tree support
  regulator: tps65910 regulator: add device tree support
  mfd: tps65910-irq: Add devicetree init support
  ARM: Tegra: Add support for TPS65910 PMIC

 Documentation/devicetree/bindings/mfd/tps65910.txt |  133 ++++++++++++++
 arch/arm/boot/dts/tegra-cardhu.dts                 |   91 ++++++++++
 drivers/gpio/gpio-tps65910.c                       |   14 +-
 drivers/mfd/tps65910-irq.c                         |   55 ++++---
 drivers/mfd/tps65910.c                             |  120 +++++++++----
 drivers/regulator/tps65910-regulator.c             |  190 +++++++++++++++-----
 include/linux/mfd/tps65910.h                       |   29 +++-
 7 files changed, 523 insertions(+), 109 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65910.txt
