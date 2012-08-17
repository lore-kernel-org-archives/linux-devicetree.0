From: Bill Huang <bilhuang@nvidia.com>
Subject: [PATCH 0/2] mfd: dt: add power off support for Tegra20/Tegra30
Date: Fri, 17 Aug 2012 02:16:27 -0700
Message-ID: <1345194989-11614-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net
Cc: broonie@opensource.wolfsonmicro.com, ldewangan@nvidia.com, thierry.reding@avionic-design.de, swarren@wwwdotorg.org, xxie@nvidia.com, lrg@slimlogic.co.uk, jhovold@gmail.com, kyle.manna@fuel7.com, rklein@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>
List-Id: devicetree@vger.kernel.org

This patch series add new property into regulator DT for telling whether or not
to hook pmic's power off routine to system call "pm_power_off".

Patch 1 add power off support for Tegra20 boards using TPS6586x
Patch 2 add power off support for Tegra30 boards using TPS65910

Verified on Seaboard (Tegra20) and Cardhu (Tegra30)

Bill Huang (2):
  mfd: dt: tps6586x: Add power off control
  mfd: dt: tps65910: add power off control

 Documentation/devicetree/bindings/mfd/tps65910.txt |    4 +++
 .../devicetree/bindings/regulator/tps6586x.txt     |    6 +++++
 drivers/mfd/tps6586x.c                             |   19 +++++++++++++++++
 drivers/mfd/tps65910.c                             |   22 ++++++++++++++++++++
 include/linux/mfd/tps6586x.h                       |    1 +
 include/linux/mfd/tps65910.h                       |    3 ++
 6 files changed, 55 insertions(+), 0 deletions(-)

-- 
1.7.4.1
