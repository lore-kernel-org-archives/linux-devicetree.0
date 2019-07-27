From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/4] Lantiq VRX200/ARX300 PCIe PHY driver
Date: Sat, 27 Jul 2019 14:04:11 +0200
Message-ID: <20190727120415.15859-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, kishon@ti.com, paul.burton@mips.com, ralf@linux-mips.org
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, hauke@hauke-m.de, mark.rutland@arm.com, ms@dev.tdt.de, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Various Lantiq (now Intel) SoCs contain one or more PCIe controllers
and PHYs.
This adds a driver for the PCIe PHYs found on the Lantiq VRX200 and
ARX300 SoCs. GRX390 should also be supported as far as I can tell,
but I don't have any of these devices to further verify that.

I have tested this PCIe PHY driver with the out-of-tree PCIe controller
driver in OpenWrt: [0]

dependencies for this series:
none

patches 1-3 should go through the PHY tree
patch 4 should go through the mips tree

I am aware that this series is too late for the v5.3 development cycle.
Getting review comments is still appreciated so this can be queued early
in the v5.4 development cycle.


Changes since v2 at [2]:
- added Rob's Reviewed-by to the dt-bindings patch (thank you!)

Changes since v1 at [1]:
- many thanks to Rob for giving me many hints regarding the .yaml bindings!
- update the .yaml binding license to (GPL-2.0-only OR BSD-2-Clause)
- changed the property lantiq,rcu to type phandle
- add the optional big-endian and little-endian boolean properties
- use numeric values for the clock phandles in the example to make the
  dt_binding_check build happy
- replaced two mdelay(1); with usleep_range(1000, 2000); in patch #2
  (spotted and reported by Hauke off-list)


[0] https://github.com/xdarklight/openwrt/commits/lantiq-mainline-pcie-phy-20190702
[1] https://patchwork.kernel.org/cover/11028797/
[2] https://patchwork.kernel.org/cover/11031421/


Martin Blumenstingl (4):
  dt-bindings: phy: add binding for the Lantiq VRX200 and ARX300 PCIe
    PHYs
  phy: lantiq: vrx200-pcie: add a driver for the Lantiq VRX200 PCIe PHY
  phy: enable compile-testing for the Lantiq PHY drivers
  MIPS: lantiq: update the clock alias' for the mainline PCIe PHY driver

 .../bindings/phy/lantiq,vrx200-pcie-phy.yaml  |  95 ++++
 arch/mips/lantiq/xway/sysctrl.c               |  16 +-
 drivers/phy/Makefile                          |   2 +-
 drivers/phy/lantiq/Kconfig                    |  11 +
 drivers/phy/lantiq/Makefile                   |   1 +
 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c   | 494 ++++++++++++++++++
 .../dt-bindings/phy/phy-lantiq-vrx200-pcie.h  |  11 +
 7 files changed, 621 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/lantiq,vrx200-pcie-phy.yaml
 create mode 100644 drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c
 create mode 100644 include/dt-bindings/phy/phy-lantiq-vrx200-pcie.h

-- 
2.22.0
