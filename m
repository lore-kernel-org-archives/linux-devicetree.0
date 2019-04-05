From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v4 0/5] PHY: Add support for SERDES in TI's AM654 platform
Date: Fri, 5 Apr 2019 16:38:29 +0530
Message-ID: <20190405110834.13083-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, rogerq@ti.com
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series
  *) adds support for SERDES module in am654
  *) modifies phy_reset API to invoke pm_runtime_get/pm_runtime_put since
the reset callback can access registers.
  *) Add *release* phy_ops to be invoked when the consumer relinquishes
PHY

Changes from v3:
  *) Moved SERDES driver to use regfield
  *) Removed reg-names binding and updated Documentation for
     power-domains

Changes from v2:
  *) Fix typos pointed out by Roger
  *) Add dt-binding Documentation in a new file ti,phy-am654-serdes.txt
  *) Add Roger's patch to support all CLKSEL values.

Changes from v1:
  *) Add *release* phy ops
  *) Populate release phy_ops in phy-am654-serdes to cleanup
initializations done in of_xlate

Kishon Vijay Abraham I (4):
  phy: core: Add *release* phy_ops invoked when the consumer
    relinquishes PHY
  phy: core: Invoke pm_runtime_get_*/pm_runtime_put_* before invoking
    reset callback
  dt-bindings: phy: ti: Add dt binding documentation for SERDES in
    AM654x SoC
  phy: ti: Add a new SERDES driver for TI's AM654x SoC

Roger Quadros (1):
  phy: ti: am654-serdes: Support all clksel values

 .../bindings/phy/ti,phy-am654-serdes.txt      |  82 +++
 drivers/phy/phy-core.c                        |  11 +
 drivers/phy/ti/Kconfig                        |  12 +
 drivers/phy/ti/Makefile                       |   1 +
 drivers/phy/ti/phy-am654-serdes.c             | 658 ++++++++++++++++++
 include/dt-bindings/phy/phy-am654-serdes.h    |  13 +
 include/linux/phy/phy.h                       |   2 +
 7 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.txt
 create mode 100644 drivers/phy/ti/phy-am654-serdes.c
 create mode 100644 include/dt-bindings/phy/phy-am654-serdes.h

-- 
2.17.1
