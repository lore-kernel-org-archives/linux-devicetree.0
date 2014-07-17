From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 0/4] dra7: Add PCIe support
Date: Thu, 17 Jul 2014 14:30:39 +0530
Message-ID: <1405587643-13808-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, mohit.kumar-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kishon-l0cyMroinI0@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes from v2:
* Added myself as MAINTAINER of pcie dra7xx driver

Changes from v1:
* fixed dw_pcie_prog_viewport_io_outbound() to use untranslated address
* split dra7xx patch into driver part and documentation part

[1] is split into separate series in order for individual subsystem
Maintainers to pick up the patches. This series handles the PCIe
support for DRA7.

Rebased to pci -next.

[1] -> https://lkml.org/lkml/2014/5/29/258

Kishon Vijay Abraham I (4):
  PCI: designware: Configuration space should be specified in 'reg'
  PCI: designware: use untranslated address while programming ATU
  Documentation: pci: ti: Add dt binding documentation for PCIe in
    DRA7xx
  PCI: host: pcie-dra7xx: add support for pcie-dra7xx controller

 .../devicetree/bindings/pci/designware-pcie.txt    |    4 +
 Documentation/devicetree/bindings/pci/ti-pci.txt   |   59 +++
 MAINTAINERS                                        |    8 +
 drivers/pci/host/Kconfig                           |   10 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pci-dra7xx.c                      |  458 ++++++++++++++++++++
 drivers/pci/host/pcie-designware.c                 |   72 ++-
 drivers/pci/host/pcie-designware.h                 |    4 +
 8 files changed, 600 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/ti-pci.txt
 create mode 100644 drivers/pci/host/pci-dra7xx.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
