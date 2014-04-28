From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/2] TPS65917: Drivers for TPS65917 PMIC
Date: Mon, 28 Apr 2014 10:58:24 +0530
Message-ID: <1398662906-4398-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, Keerthy <j-keerthy@ti.com>
List-Id: devicetree@vger.kernel.org

The TPS65917 chip is a power management IC for Portable Navigation Systems
and Tablet Computing devices. It contains the following components:

 - Regulators.
 - GPADC.
 - Over Temperature warning and Shut down.

This patch series adds support for TPS65917 mfd device. At this time only
the regulator functionality is made available.

The closest drivers are PALMAS series drivers.
The register set is changed. Bit-field defenitions are changed.
Hence based on the PALMAS drivers and created a new set of drivers
with code changes as required.

The patches are boot tested on DRA7-EVM.

Keerthy (2):
  MFD: TPS65917: Add driver for the TPS65917 PMIC
  Regulators: TPS65917: Add Regulator driver for TPS65917 PMIC

 drivers/mfd/Kconfig                    |   10 +
 drivers/mfd/Makefile                   |    1 +
 drivers/mfd/tps65917.c                 |  542 ++++++++++++
 drivers/regulator/Kconfig              |   12 +
 drivers/regulator/Makefile             |    1 +
 drivers/regulator/tps65917-regulator.c |  903 +++++++++++++++++++
 include/linux/mfd/tps65917.h           | 1508 ++++++++++++++++++++++++++++++++
 7 files changed, 2977 insertions(+)
 create mode 100644 drivers/mfd/tps65917.c
 create mode 100644 drivers/regulator/tps65917-regulator.c
 create mode 100644 include/linux/mfd/tps65917.h

-- 
1.7.9.5
