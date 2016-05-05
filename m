From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 0/2] pci: host: Broadcom STB PCIE RC controller support
Date: Thu,  5 May 2016 12:14:58 -0700
Message-ID: <1462475700-1654-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, bhelgaas@google.com, arnd@arndb.de, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for Broadcom STB SoC's PCIe root complex driver.

This was primarily tested on BCM7445 (ARM) and BCM7435 (MIPS).

Jim is the original author, and I picked up our downstream 4.1 driver and
updated it to utilize the non-ARM hw_pci functions as well as made some
stylistic changes.

Thanks!

Jim Quinlan (2):
  Documentation: DT: bindings: Add Broadcom STB PCIe bindings
  pci: host: Add Broadcom STB PCIE RC controller

 .../devicetree/bindings/pci/brcm,brcmstb-pcie.txt  |  98 +++
 MAINTAINERS                                        |   1 +
 drivers/pci/host/Kconfig                           |  17 +
 drivers/pci/host/Makefile                          |   2 +
 drivers/pci/host/pcie-brcmstb-msi.c                | 305 ++++++++
 drivers/pci/host/pcie-brcmstb.c                    | 772 +++++++++++++++++++++
 drivers/pci/host/pcie-brcmstb.h                    | 169 +++++
 7 files changed, 1364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/brcm,brcmstb-pcie.txt
 create mode 100644 drivers/pci/host/pcie-brcmstb-msi.c
 create mode 100644 drivers/pci/host/pcie-brcmstb.c
 create mode 100644 drivers/pci/host/pcie-brcmstb.h

-- 
2.1.0
