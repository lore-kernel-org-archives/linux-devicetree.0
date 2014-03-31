From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 0/6] Arizona Regulator Updates v4
Date: Mon, 31 Mar 2014 12:59:41 +0100
Message-ID: <1396267187-30580-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, sameo@linux.intel.com, lgirdwood@gmail.com, ckeepax@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series of patches are small fixes/improvements to the
Arizona regulators. The main thing added is proper device
tree bindings for getting the regulator init_data.

Changes Since v3:
  - We now only process the DT information if there is no
    pdata, similar to arizona-core.
  - DT binding documention factored out into a seperate
    patch as requested.

Thanks,
Charles

Charles Keepax (6):
  mfd: arizona: Factor out read of device tree GPIOs
  regulator: arizona-ldo1: Move setup processing from arizona-core
  regulator: arizona-ldo1: Add processing of init_data from device tree
  mfd: arizona: Update DT binding to support LDO1 init_data
  regulator: arizona-micsupp: Add processing of init_data from device
    tree
  mfd: arizona: Update DT binding to support MICVDD init_data

 Documentation/devicetree/bindings/mfd/arizona.txt |    9 +++
 drivers/mfd/arizona-core.c                        |   43 +++++++-----
 drivers/regulator/arizona-ldo1.c                  |   73 +++++++++++++++++++++
 drivers/regulator/arizona-micsupp.c               |   53 +++++++++++++++
 include/linux/mfd/arizona/core.h                  |    3 +
 5 files changed, 164 insertions(+), 17 deletions(-)

-- 
1.7.2.5
