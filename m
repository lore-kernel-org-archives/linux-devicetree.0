Return-Path: <SRS0=n0G4=QW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:13589 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfBOQYj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Feb 2019 11:24:39 -0500
From: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v3 0/3] Add Microchip/Microsemi PolarFire SoC PCIe support
Date: Fri, 15 Feb 2019 16:24:21 +0000
Message-ID: <20190215162424.564-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Cc: Daire McNamara <daire.mcnamara@microchip.com>
List-ID: <devicetree@vger.kernel.org>

This v3 patch series adds support for PCIe IP block on Microsemi/Microchip PolarFire SoCs.

Updates since v2:

o Split out DT bindings and Vendor ID updates into their own
  patch from PCIe driver.

o Updated ChangeLog.

Updates since v1:

o Incorporate feedback from Bjorn Helgaas.

Thanx, Daire

Daire McNamara (3):
  PCI: Add vendor ID for Microsemi
  dt-bindings: PCI: microsemi: Add DT Bindings for Microsemi PCIe host
    controller
  PCI: microsemi: Add host driver for Microsemi PCIe controller

 .../bindings/pci/microsemi-pcie.txt           |  65 ++
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 drivers/pci/controller/Kconfig                |   8 +
 drivers/pci/controller/Makefile               |   1 +
 drivers/pci/controller/pcie-microsemi.c       | 764 ++++++++++++++++++
 5 files changed, 839 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/microsemi-pcie.txt
 create mode 100644 drivers/pci/controller/pcie-microsemi.c

-- 
2.17.0
