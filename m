From: Ley Foon Tan <lftan@altera.com>
Subject: [PATCH v2 0/5] Altera PCIe host controller driver with MSI support
Date: Fri, 31 Jul 2015 18:15:10 +0800
Message-ID: <1438337715-22594-1-git-send-email-lftan@altera.com>
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
To: Bjorn Helgaas <bhelgaas@google.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: devicetree@vger.kernel.org, lftan.linux@gmail.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ley Foon Tan <lftan@altera.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is the 2nd version of patch set to add support for Altera PCIe host
controller with MSI feature on Altera FPGA device families. This patchset
have resolved all comments in v1. Thanks everyone for reviewing.

It is based on patch series from Marc Zyngier "Per-device MSI domain &
platform MSI" [1] to get rid of struct msi_controller.

[1]: https://lkml.org/lkml/2015/7/23/172

v1->v2 changes:
- arm: socfpga: remove ununsed ARCH_SUPPORTS_MSI and PCI from Kconfig
- pci: host: remove depends on OF from Kconfig
- pci: host: remove depends PCIE_ALTERA from Kconfig
- pci: host: change pcie-altera to tristate in Kconfig
- pcie-altera: remove unnecessary newlines and .owner
- pcie-altera: remove altera_pcie_map_irq
- pcie-altera: remove dependency on hw_pci and use pci_scan_root_bus
- pcie-altera-msi: change to use phys_addr_t
- pcie-altera-msi: change to use irq_set_chained_handler
- pcie-altera-msi: add inner_domain
- pcie-altera-msi: add add MSI_FLAG_PCI_MSIX flag
- pcie-altera-msi: return -EINVAL for altera_msi_set_affinity
- pcie-altera-msi: return PTR_ERR() instead of -EADDRNOTAVAIL
- change to use write_relaxed and read_relaxed

History:
-------
[v1]: https://lkml.org/lkml/2015/7/28/395

Ley Foon Tan (5):
  arm: add msi.h to Kbuild
  pci:host: Add Altera PCIe host controller driver
  pci: altera: Add Altera PCIe MSI driver
  Documentation: dt-bindings: pci: altera pcie device tree binding
  MAINTAINERS: Add Altera PCIe and MSI drivers maintainer

 .../devicetree/bindings/pci/altera-pcie-msi.txt    |  27 ++
 .../devicetree/bindings/pci/altera-pcie.txt        |  49 ++
 MAINTAINERS                                        |  16 +
 arch/arm/include/asm/Kbuild                        |   1 +
 drivers/pci/host/Kconfig                           |  15 +
 drivers/pci/host/Makefile                          |   2 +
 drivers/pci/host/pcie-altera-msi.c                 | 324 +++++++++++++
 drivers/pci/host/pcie-altera.c                     | 526 +++++++++++++++++++++
 8 files changed, 960 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/altera-pcie-msi.txt
 create mode 100644 Documentation/devicetree/bindings/pci/altera-pcie.txt
 create mode 100644 drivers/pci/host/pcie-altera-msi.c
 create mode 100644 drivers/pci/host/pcie-altera.c

-- 
1.8.2.1
