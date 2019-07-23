From: Jonathan Chocron <jonnyc@amazon.com>
Subject: [PATCH v3 0/8] Amazon's Annapurna Labs DT-based PCIe host controller driver
Date: Tue, 23 Jul 2019 12:25:25 +0300
Message-ID: <20190723092529.11310-1-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.pieralisi@arm.com, bhelgaas@google.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, alisaidi@amazon.com, ronenk@amazon.com, barakw@amazon.com, talel@amazon.com, hanochu@amazon.com, hhhawa@amazon.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jonnyc@amazon.com
List-Id: devicetree@vger.kernel.org

This series adds support for Amazon's Annapurna Labs DT-based PCIe host
controller driver.
Additionally, it adds 3 quirks (ACS, VPD and MSI-X) and 2 generic DWC patches.

Regarding the 2nd DWC patch (PCI flags support), do you think this should
be done in the context of a host-bridge driver at all (as opposed to PCI
system-wide code)?

Changes since v2:
- Added al_pcie_controller_readl/writel() wrappers
- Reorganized local vars in several functions according to reverse
  tree structure
- Removed unnecessary check of ret value
- Changed return type of al_pcie_config_prepare() from int to void
- Removed check if link is up from probe() [done internally in
  dw_pcie_rd/wr_conf()]

Changes since v1:
- Added comment regarding 0x0031 being used as a dev_id for non root-port devices as well
- Fixed different message/comment/print wordings
- Added panic stacktrace to commit message of MSI-x quirk patch
- Changed to pci_warn() instead of dev_warn()
- Added unit_address after node_name in dt-binding
- Updated Kconfig help description
- Used GENMASK and FIELD_PREP/GET where appropriate
- Removed leftover field from struct al_pcie and moved all ptrs to
  the beginning
- Re-wrapped function definitions and invocations to use fewer lines
- Change %p to %px in dbg prints in rd/wr_conf() functions
- Removed validation that the port is configured to RC mode (as this is
  added generically in PATCH 7/8)
- Removed unnecessary variable initializations
- Swtiched to %pR for printing resources


Ali Saidi (1):
  PCI: Add ACS quirk for Amazon Annapurna Labs root ports

Jonathan Chocron (7):
  PCI: Add Amazon's Annapurna Labs vendor ID
  PCI/VPD: Add VPD release quirk for Amazon's Annapurna Labs Root Port
  PCI: Add quirk to disable MSI-X support for Amazon's Annapurna Labs
    Root Port
  dt-bindings: PCI: Add Amazon's Annapurna Labs PCIe host bridge binding
  PCI: al: Add support for DW based driver type
  PCI: dw: Add validation that PCIe core is set to correct mode
  PCI: dw: Add support for PCI_PROBE_ONLY/PCI_REASSIGN_ALL_BUS flags

 .../devicetree/bindings/pci/pcie-al.txt       |  45 +++
 MAINTAINERS                                   |   3 +-
 drivers/pci/controller/dwc/Kconfig            |  12 +
 drivers/pci/controller/dwc/pcie-al.c          | 367 ++++++++++++++++++
 .../pci/controller/dwc/pcie-designware-ep.c   |   8 +
 .../pci/controller/dwc/pcie-designware-host.c |  31 +-
 drivers/pci/quirks.c                          |  34 ++
 drivers/pci/vpd.c                             |  16 +
 include/linux/pci_ids.h                       |   2 +
 9 files changed, 513 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/pcie-al.txt

-- 
2.17.1
