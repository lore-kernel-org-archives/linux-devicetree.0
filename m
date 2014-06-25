From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/3] dra7: Add PCIe support
Date: Wed, 25 Jun 2014 23:26:44 +0530
Message-ID: <1403719007-9352-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, jg1.han@samsung.com, bhelgaas@google.com, mohit.kumar@st.com, linux-kernel@vger.kernel.org
Cc: kishon@ti.com, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

[1] is split into separate series in order for individual subsystem
Maintainers to pick up the patches. This series handles the PCIe
support for DRA7.

Rebased to 3.16-rc2.

[1] -> https://lkml.org/lkml/2014/5/29/258

Kishon Vijay Abraham I (3):
  PCI: designware: Configuration space should be specified in 'reg'
  PCI: designware: use untranslated address while programming ATU
  PCI: host: pcie-dra7xx: add support for pcie-dra7xx controller

 .../devicetree/bindings/pci/designware-pcie.txt    |    4 +
 Documentation/devicetree/bindings/pci/ti-pci.txt   |   59 +++
 drivers/pci/host/Kconfig                           |   10 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pci-dra7xx.c                      |  458 ++++++++++++++++++++
 drivers/pci/host/pcie-designware.c                 |   66 ++-
 drivers/pci/host/pcie-designware.h                 |    4 +
 7 files changed, 589 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/ti-pci.txt
 create mode 100644 drivers/pci/host/pci-dra7xx.c

-- 
1.7.9.5

