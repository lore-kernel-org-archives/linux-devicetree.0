From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: MT7621 PCIe PHY
Date: Thu, 14 Mar 2019 14:22:08 +0100
Message-ID: <20190314132210.654-1-sergio.paracuellos@gmail.com>
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

Thanks in advance for your time.

Best regards,
     Sergio Paracuellos

Sergio Paracuellos (2):
  phy: ralink: Add PHY driver for MT7621 PCIe PHY
  dt-bindings: phy: Add binding for Mediatek MT7621 PCIe PHY

 .../bindings/phy/mediatek,mt7621-pci-phy.txt  |  54 +++
 drivers/phy/ralink/Kconfig                    |   7 +
 drivers/phy/ralink/Makefile                   |   1 +
 drivers/phy/ralink/phy-mt7621-pci.c           | 387 ++++++++++++++++++
 4 files changed, 449 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt7621-pci-phy.txt
 create mode 100644 drivers/phy/ralink/phy-mt7621-pci.c

-- 
2.19.1
