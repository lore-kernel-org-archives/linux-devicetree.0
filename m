From: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [PATCH 0/4] Add DesignWare EP support
Date: Mon, 14 May 2018 17:17:24 +0100
Message-ID: <cover.1526314398.git.gustavo.pimentel@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, lorenzo.pieralisi@arm.com, Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
List-Id: devicetree@vger.kernel.org

The PCIe controller dual mode is capable of operating in RC mode as well
as EP mode by configuration option. Till now only RC mode was supported,
with this patch is add EP support to the DesignWare driver.

Gustavo Pimentel (4):
  bindings: PCI: designware: Example update
  PCI: dwc: Add support for EP mode
  bindings: PCI: designware: Add support for EP in DesignWare driver
  misc: pci_endpoint_test: Add DesignWare EP entry

 .../devicetree/bindings/pci/designware-pcie.txt    |  24 +++-
 drivers/misc/pci_endpoint_test.c                   |   1 +
 drivers/pci/dwc/Kconfig                            |  41 ++++--
 drivers/pci/dwc/pcie-designware-ep.c               |   3 +
 drivers/pci/dwc/pcie-designware-plat.c             | 149 +++++++++++++++++++--
 drivers/pci/endpoint/functions/pci-epf-test.c      |   7 +
 include/linux/pci-epc.h                            |   8 ++
 7 files changed, 206 insertions(+), 27 deletions(-)

-- 
2.7.4
