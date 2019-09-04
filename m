From: Dilip Kota <eswara.kota@linux.intel.com>
Subject: [PATCH v3 0/2] PCI: Add Intel PCIe Driver and respective dt-binding yaml file
Date: Wed,  4 Sep 2019 18:10:29 +0800
Message-ID: <cover.1567585181.git.eswara.kota@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, lorenzo.pieralisi@arm.com, robh@kernel.org, martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, hch@infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com, Dilip Kota <eswara.kota@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Intel PCIe is synopsys based controller utilizes the Designware
framework for host initialization and intel application
specific register configurations.

Changes on v3:
        Compared to v2, map_irq() patch is removed as it is no longer
          required for Intel PCIe driver. Intel PCIe driver does platform
          specific interrupt configuration during core initialization. So
          changed the subject line too.
        Address v2 review comments for DT binding and PCIe driver

Dilip Kota (2):
  dt-bindings: PCI: intel: Add YAML schemas for the PCIe RC controller
  dwc: PCI: intel: Intel PCIe RC controller driver

 .../devicetree/bindings/pci/intel,lgm-pcie.yaml    | 137 ++++
 drivers/pci/controller/dwc/Kconfig                 |  13 +
 drivers/pci/controller/dwc/Makefile                |   1 +
 drivers/pci/controller/dwc/pcie-intel-axi.c        | 840 +++++++++++++++++++++
 4 files changed, 991 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/intel,lgm-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-intel-axi.c

-- 
2.11.0
