From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH v2 0/3] PCI: Add map irq callback in dwc framework and add Intel PCIe driver
Date: Tue, 20 Aug 2019 17:39:34 +0800
Message-ID: <cover.1566208109.git.eswara.kota@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Intel PCIe is synopsys based controller utilizes the Designware
framework for host initialization and intel application
specific register configurations.

Intel PCIe driver also uses the Irq map callback for platform
specific register configurations while Irq mapping. So submitting
the Intel pcie driver series with dwc irq map callback change.

Changes on v2:
	Submitting user(intel pcie driver) changes along with core changes.

Dilip Kota (3):
  PCI: dwc: Add map irq callback
  dt-bindings: PCI: intel: Add YAML schemas for the PCIe RC controller
  dwc: PCI: intel: Intel PCIe RC controller driver

 .../devicetree/bindings/pci/intel-pcie.yaml        | 133 +++
 drivers/pci/controller/dwc/Kconfig                 |  13 +
 drivers/pci/controller/dwc/Makefile                |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c  |   6 +-
 drivers/pci/controller/dwc/pcie-designware.h       |   1 +
 drivers/pci/controller/dwc/pcie-intel-axi.c        | 900 +++++++++++++++++
 6 files changed, 1053 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/intel-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-intel-axi.c

-- 
2.11.0
