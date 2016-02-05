From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/3] Add host controller drivers for Cavium ThunderX PCI
Date: Fri,  5 Feb 2016 15:41:12 -0800
Message-ID: <1454715675-17512-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Some Cavium ThunderX processors require quirky access methods for the
config space of the PCIe bridge.

There are now three patches:

1) Refactor code in pci-host-generic so that it can more easily be
   used by other drivers.  This splits the driver for CAM and ECAM
   access methods to a separate file from the common host driver code.

2) Add the ThunderX PCIe driver to external PCIe buses, which
   leverages the code in pci-host-generic

3) Add ThunderX PCI driver for internel SoC buses used on early
   ThunderX chip revisions.

Changes from v4: Added patch 3/3.  Stylistic changes to 2/3 suggested
by Bjorn Helgaas.  When expanding config write width to 32-bits, mask
out unintened writes to W1C bits, also suggested by Bjorn Helgaas.

Changes from v3: Add some Acked-by, rebased to v4.5.0-rc1

Changes from v2: Improve device tree binding example as noted by Rob
Herring.  Rename pcie-thunder-pem.* to pci-thunder-pem.* for better
consistency.  Update MAINTAINERS to reflect the changes.

Changes from v1: Split CAM and ECAM code from common driver code as
suggested by Arnd Bergmann.  Fix spelling errors in
pcie-thunder-pem.txt

David Daney (3):
  PCI: generic: Refactor code to enable reuse by other drivers.
  pci, pci-thunder-pem: Add PCIe host driver for ThunderX processors.
  pci, pci-thunder-ecam: Add driver for ThunderX-pass1 on-chip devices

 .../devicetree/bindings/pci/pci-thunder-ecam.txt   |  30 ++
 .../devicetree/bindings/pci/pci-thunder-pem.txt    |  43 +++
 MAINTAINERS                                        |   9 +
 drivers/pci/host/Kconfig                           |  18 ++
 drivers/pci/host/Makefile                          |   3 +
 drivers/pci/host/pci-host-common.c                 | 194 +++++++++++
 drivers/pci/host/pci-host-common.h                 |  47 +++
 drivers/pci/host/pci-host-generic.c                | 181 +----------
 drivers/pci/host/pci-thunder-ecam.c                | 358 +++++++++++++++++++++
 drivers/pci/host/pci-thunder-pem.c                 | 332 +++++++++++++++++++
 10 files changed, 1038 insertions(+), 177 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-thunder-ecam.txt
 create mode 100644 Documentation/devicetree/bindings/pci/pci-thunder-pem.txt
 create mode 100644 drivers/pci/host/pci-host-common.c
 create mode 100644 drivers/pci/host/pci-host-common.h
 create mode 100644 drivers/pci/host/pci-thunder-ecam.c
 create mode 100644 drivers/pci/host/pci-thunder-pem.c

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
