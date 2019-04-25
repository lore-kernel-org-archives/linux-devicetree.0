From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v3 0/2] MT7621 PCIe PHY
Date: Thu, 25 Apr 2019 17:41:20 +0200
Message-ID: <20190425154122.24122-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com
Cc: linux-kernel@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devicetree@vger.kernel.org, john@phrozen.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, neil@brown.name
List-Id: devicetree@vger.kernel.org

This series adds support for the PCIe PHY found in the Mediatek
MT7621 SoC.

This is the first attempt to get feedback of what is missing in
this driver to be promoted from staging.

There is also a 'mt7621-pci' driver which is the controller part
which is still in staging and is a client of this phy.

Both drivers have been tested together in a gnubee1 board.

Changes in v3:
    - Recollect Rob's Reviewed-by of bindings.
    - Make Kishon Vijay suggested changes in v2:
    (See https://lkml.org/lkml/2019/4/17/53)
        - Kconfig:
            * Add depends on COMPILE_TEST
            * Select REGMAP_MMIO
        - Make use of 'soc_device_attribute' and 'soc_device_match'
        - Use regmap mmio API instead of directly 'readl' and 'writel'.
        - Use 'platform_get_resource' instead of 'of_address_to_resource'.

Changes in v2:
    - Reorder patches to get bindings first in the series.
    - Don't use child nodes in the device tree. Use #phy-cells=1 instead.
    - Update driver code with new 'xlate' function for the new device tree.
    - Minor changes in driver's macros changing some spaces to tabs.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

Sergio Paracuellos (2):
  dt-bindings: phy: Add binding for Mediatek MT7621 PCIe PHY
  phy: ralink: Add PHY driver for MT7621 PCIe PHY

 .../bindings/phy/mediatek,mt7621-pci-phy.txt  |  28 ++
 drivers/phy/ralink/Kconfig                    |   8 +
 drivers/phy/ralink/Makefile                   |   1 +
 drivers/phy/ralink/phy-mt7621-pci.c           | 423 ++++++++++++++++++
 4 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
 create mode 100644 drivers/phy/ralink/phy-mt7621-pci.c

-- 
2.19.1
