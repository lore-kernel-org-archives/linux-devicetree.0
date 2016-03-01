From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/4] regulator: Add support for configuration of active-discharge
Date: Tue, 1 Mar 2016 18:08:11 +0530
Message-ID: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

This series add the common regulator DT property  for configuration
of active discharge and implementing this in regulator core.
Also implementing the regulator ops for MAX77620 to configure
active discharge.

This is based on discussion on patch and comment from Mark Brown:
[PATCH V6 7/8] DT: regulator: add DT binding doc for regulator of PMIC max77620/max20024

> +- maxim,disable-active-discharge:    boolean, Disable active discharge.

That's something I've seen other regulators do, can we make it a standard property with an op?


Laxman Dewangan (4):
  regulator: DT: Add DT property for active-discharge configuration
  regulator: core: Add support for active-discharge configuration
  regulator: helper: Add helper to configure active-discharge using
    regmap
  regulator: max77620: Add support to configure active-discharge

 .../devicetree/bindings/regulator/regulator.txt    |  5 +++++
 drivers/regulator/core.c                           | 10 ++++++++++
 drivers/regulator/helpers.c                        | 23 ++++++++++++++++++++++
 drivers/regulator/max77620-regulator.c             |  9 +++++++++
 drivers/regulator/of_regulator.c                   |  5 +++++
 include/linux/regulator/driver.h                   | 17 ++++++++++++++++
 include/linux/regulator/machine.h                  |  4 ++++
 7 files changed, 73 insertions(+)

-- 
2.1.4
