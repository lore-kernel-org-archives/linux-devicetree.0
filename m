From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 00/19] PCI: Cleanup pci-keystone driver
Date: Mon, 15 Oct 2018 18:37:02 +0530
Message-ID: <20181015130721.5535-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Murali Karicheri <m-karicheri2@ti.com>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series was sent as part of RFC series [1]

The PCIe controller in AM654 uses Synopsys core revision 4.90a and uses
the same TI wrapper as used in keystone2 with certain modification.
Hence AM654 will use the same pci wrapper driver pci-keystone.c

In preparation for adding AM654 support, cleanup pci-keystone driver
here.

Most of the cleanups here are trivial with major modification being
merging pci-keystone-dw.c and pci-keystone.c

Cleaning-up irq handling in the RFC series is dropped here as it has
few comments to be addressed.

Other patches which are part of the RFC series will be sent separately.

[1] -> https://lore.kernel.org/patchwork/cover/989487/

Kishon Vijay Abraham I (19):
  PCI: keystone: Use quirk to limit MRRS for K2G
  PCI: keystone: Use quirk to set MRRS for PCI host bridge
  PCI: keystone: Move dw_pcie_setup_rc out of ks_pcie_establish_link()
  PCI: keystone: Do not initiate link training multiple times
  PCI: keystone: Remove unused argument from ks_dw_pcie_host_init()
  PCI: keystone: Merge pci-keystone-dw.c and pci-keystone.c
  PCI: keystone: Remove redundant platform_set_drvdata
  PCI: keystone: Use uniform function naming convention
  dt-bindings: PCI: keystone: Add bindings to get device control module
  PCI: keystone: Use syscon APIs to get device id from control module
  PCI: keystone: Cleanup PHY handling
  PCI: keystone: Invoke pm_runtime APIs to enable clock
  PCI: keystone: Cleanup configuration space access
  PCI: keystone: Get number of OB windows from DT and cleanup MEM space
    configuration
  PCI: keystone: Cleanup set_dbi_mode and get_dbi_mode
  PCI: keystone: Cleanup ks_pcie_link_up()
  PCI: keystone: Add debug error message for all errors
  PCI: keystone: Reorder header file in alphabetical order
  PCI: keystone: Cleanup macros defined in pci-keystone.c

 .../devicetree/bindings/pci/pci-keystone.txt  |   3 +
 MAINTAINERS                                   |   2 +-
 drivers/pci/controller/dwc/Makefile           |   2 +-
 drivers/pci/controller/dwc/pci-keystone-dw.c  | 484 -----------
 drivers/pci/controller/dwc/pci-keystone.c     | 794 +++++++++++++++---
 drivers/pci/controller/dwc/pci-keystone.h     |  57 --
 drivers/pci/controller/dwc/pcie-designware.h  |   4 +
 7 files changed, 692 insertions(+), 654 deletions(-)
 delete mode 100644 drivers/pci/controller/dwc/pci-keystone-dw.c
 delete mode 100644 drivers/pci/controller/dwc/pci-keystone.h

-- 
2.17.1
