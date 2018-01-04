From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] PCI: move DT PCI functions to PCI core
Date: Thu,  4 Jan 2018 15:12:12 -0600
Message-ID: <20180104211215.11344-1-robh@kernel.org>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Frank Rowand <frowand.list@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Most subsystem specific functions have been moved into the respective
subsystems. Only PCI and networking remain. This series moves most of the
PCI related code to drivers/pci/of.c. Some bus address functions for PCI
remain in of/address.c because we don't have infrastructure to split up
the per bus helper functions.

I expect Bjorn to take this series, so PPC maintainers please ack.

Rob

Rob Herring (3):
  PCI: move OF related PCI functions into PCI core
  powerpc/pci: use of_irq_parse_and_map_pci helper
  PCI: make of_irq_parse_pci static

 arch/arm/mach-mvebu/Kconfig      |   1 -
 arch/powerpc/kernel/pci-common.c |   8 +-
 drivers/of/Kconfig               |  16 --
 drivers/of/Makefile              |   2 -
 drivers/of/address.c             |   8 +-
 drivers/of/of_pci.c              | 384 -----------------------------
 drivers/of/of_pci_irq.c          | 131 ----------
 drivers/pci/of.c                 | 505 +++++++++++++++++++++++++++++++++++++++
 include/linux/of_pci.h           |   8 +-
 9 files changed, 510 insertions(+), 553 deletions(-)
 delete mode 100644 drivers/of/of_pci.c
 delete mode 100644 drivers/of/of_pci_irq.c
