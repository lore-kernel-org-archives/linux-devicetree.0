From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v2 0/2] phy: intel-lgm-sdxc: Add support for SDXC PHY
Date: Wed, 28 Aug 2019 20:43:13 +0800
Message-ID: <20190828124315.48448-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com, vadivel.muruganx.ramuthevar@linux.intel.com
List-Id: devicetree@vger.kernel.org

Add support for SDXC PHY on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
Ramuthevar Vadivel Murugan (2):
  dt-bindings: phy: intel-sdxc-phy: Add YAML schema for LGM SDXC PHY
  changes in v2:
     - As per Rob's review comments added syscon properties.

  phy: intel-lgm-sdxc: Add support for SDXC PHY
   changes in v2: 
    - No change

 .../bindings/phy/intel,lgm-sdxc-phy.yaml           |  50 +++++++
 drivers/phy/intel/Kconfig                          |   6 +
 drivers/phy/intel/Makefile                         |   1 +
 drivers/phy/intel/phy-intel-sdxc.c                 | 144 +++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
 create mode 100644 drivers/phy/intel/phy-intel-sdxc.c

-- 
2.11.0
