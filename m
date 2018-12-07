From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v5 0/2] Add new UniPhier PCIe host driver
Date: Fri,  7 Dec 2018 09:53:10 +0900
Message-ID: <1544143992-16385-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: devicetree@vger.kernel.org

This series adds PCIe host controller driver for Socionext UniPhier SoCs.
This controller is based on the DesignWare PCIe core. This driver
supports LD20 and PXs3 SoCs.

v4: https://www.spinics.net/lists/linux-pci/msg78278.html

About legacy IRQ, it might be necessary to share common view from
keystone driver that have been cleaned up[1].

[1] https://lore.kernel.org/patchwork/patch/989541/

Changes since v4:
- fix an issue of using the wrong value to mask IRQ mask register

Changes since v3:
- dt-bindings: fix INTX numbering of legacy interrupt map
- change interrupts to level ones
- remove .xlate function
- merge uniphier_pcie_ltssm_disable() into uniphier_pcie_ltssm_enable()
- remove an error message on uniphier_pcie_establish_link()
- change the order between irq_domain_add_liniear() and
  irq_set_chained_handler_and_data()
- replace dummy_irq_chip with uniphier_pcie_irq_chip and its functions
- add dependency on CONFIG_HAS_IOMEM
- MAINTAINERS: add pcie-uniphier entry

Changes since v2:
- dt-bindings: remove a comment that the node name isn't important
- dt-bindings: remove "intx" interrupt
- dt-bindings: define 'legacy-interrupt-controller' node and its properties
- return an error value when link up fails
- remove devm_request_irq() and a handler for MSI IRQ
- use chained interrupt instead of devm_request_irq() for legacy IRQ
- add unipher_pcie_config_legacy_irq() to get legacy IRQ from
  'legacy-interrupt controller' node
- replace 4 statments to handle INTX with for_each_set_bit()
- remove initialization of pp->root_bus_nr
- remove indivisual interrupt enable bit definitions
- rename 'irq_domain' member to 'legacy_irq_domain' in private structure
- use pci_irqd_intx_xlate() for irq_domain_ops.xlate function

Changes since v1:
- follow capitalization conventions in the descriptions
- use C style comments except for the SPDX line

Kunihiko Hayashi (2):
  dt-bindings: PCI: Add UniPhier PCIe host controller description
  PCI: uniphier: Add UniPhier PCIe host controller support

 .../devicetree/bindings/pci/uniphier-pcie.txt      |  81 ++++
 MAINTAINERS                                        |   7 +
 drivers/pci/controller/dwc/Kconfig                 |  10 +
 drivers/pci/controller/dwc/Makefile                |   1 +
 drivers/pci/controller/dwc/pcie-uniphier.c         | 471 +++++++++++++++++++++
 5 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/uniphier-pcie.txt
 create mode 100644 drivers/pci/controller/dwc/pcie-uniphier.c

-- 
2.7.4
