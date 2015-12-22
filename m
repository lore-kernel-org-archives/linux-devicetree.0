From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] pci: Add host controller driver for Cavium ThunderX PCIe
Date: Mon, 21 Dec 2015 17:53:40 -0800
Message-ID: <1450749222-15966-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Some Cavium ThunderX processors require quirky access methods for the
config space of the PCIe bridge.

There are two patches:

1) Refactor code in pci-host-generic so that it can more easily be
   used by other drivers.

2) Add the ThunderX PCIe driver, which leverages the code in
   pci-host-generic

David Daney (2):
  PCI: generic: Refactor code to enable reuse by other drivers.
  pci, pcie-thunder-pem: Add PCIe host driver for ThunderX processors.

 .../devicetree/bindings/pci/pcie-thunder-pem.txt   |  43 ++++
 drivers/pci/host/Kconfig                           |   6 +
 drivers/pci/host/Makefile                          |   1 +
 drivers/pci/host/pci-host-generic.c                |  53 ++--
 drivers/pci/host/pci-host-generic.h                |  56 ++++
 drivers/pci/host/pcie-thunder-pem.c                | 283 +++++++++++++++++++++
 6 files changed, 407 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/pcie-thunder-pem.txt
 create mode 100644 drivers/pci/host/pci-host-generic.h
 create mode 100644 drivers/pci/host/pcie-thunder-pem.c

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
