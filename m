From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH 0/8] Amazon's Annapurna Labs DT-based PCIe host controller
 driver
Date: Thu, 11 Jul 2019 17:50:03 +0300
Message-ID: <20190710164519.17883-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

This series adds support for Amazon's Annapurna Labs DT-based PCIe host
controller driver.
Additionally, it adds 3 quirks (ACS, VPD and MSI-X) and 2 generic DWC patch=
es.

Regarding the 2nd DWC patch (PCI flags support), do you think this should
be done in the context of a host-bridge driver at all (as opposed to PCI
system-wide code)?


Ali Saidi (1):
  PCI: Add ACS quirk for Amazon Annapurna Labs root ports

Jonathan Chocron (7):
  PCI: Add Amazon's Annapurna Labs vendor ID
  PCI/VPD: Add VPD release quirk for Amazon Annapurna Labs host bridge
  PCI: Add quirk to disable MSI support for Amazon's Annapurna Labs host
    bridge
  dt-bindings: PCI: Add Amazon's Annapurna Labs PCIe host bridge binding
  PCI: al: Add support for DW based driver type
  PCI: dw: Add validation that PCIe core is set to correct mode
  PCI: dw: Add support for PCI_PROBE_ONLY/PCI_REASSIGN_ALL_BUS flags

 .../devicetree/bindings/pci/pcie-al.txt       |  45 ++
 MAINTAINERS                                   |   1 +
 drivers/pci/controller/dwc/Kconfig            |  11 +
 drivers/pci/controller/dwc/pcie-al.c          | 397 ++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-ep.c   |   8 +
 .../pci/controller/dwc/pcie-designware-host.c |  31 +-
 drivers/pci/quirks.c                          |  27 ++
 drivers/pci/vpd.c                             |  12 +
 include/linux/pci_ids.h                       |   2 +
 9 files changed, 530 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt

--=20
2.17.1
