From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/3] PHY: Add support for SERDES in TI's AM654 platform
Date: Mon, 21 Jan 2019 12:18:10 +0530
Message-ID: <20190121064813.18444-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Patch series adds support for SERDES module in am654. This also
modifies phy_reset API to invoke pm_runtime_get/pm_runtime_put since
the reset callback can access registers.

Kishon Vijay Abraham I (3):
  phy: core: Invoke pm_runtime_get_*/pm_runtime_put_* before invoking
    reset callback
  dt-bindings: phy: ti: Add dt binding documentation for SERDES in
    AM654x SoC
  phy: ti: Add a new SERDES driver for TI's AM654x SoC

 .../devicetree/bindings/phy/ti-phy.txt        |  77 +++
 drivers/phy/phy-core.c                        |   6 +
 drivers/phy/ti/Kconfig                        |  11 +
 drivers/phy/ti/Makefile                       |   1 +
 drivers/phy/ti/phy-am654-serdes.c             | 528 ++++++++++++++++++
 include/dt-bindings/phy/phy-am654-serdes.h    |  13 +
 6 files changed, 636 insertions(+)
 create mode 100644 drivers/phy/ti/phy-am654-serdes.c
 create mode 100644 include/dt-bindings/phy/phy-am654-serdes.h

-- 
2.17.1
