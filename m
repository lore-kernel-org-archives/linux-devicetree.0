From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] PCI: Add support for Cavium ThunderX RC and on-SoC devices.
Date: Thu, 17 Sep 2015 15:41:31 -0700
Message-ID: <1442529694-1792-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

The Cavium ThunderX arm64 based SoC needs a little bit of special
handling for both its PCIe Root Complexes as well as on-SoC devices
(which all appear as PCIe devices).

1/3 - Small change to allow SRIOV BARs to be given fixed addresses in
      the header fixup.

2/3 - Add quirks to support fixed BAR addresses for all on-SoC devices,
      including SRIOV BARs in the NIC.

3/3 - Add config spaces accessors to pci-host-generic driver for ThunderX RC.

This patch set depends on:

https://lkml.org/lkml/2015/9/17/799

David Daney (3):
  PCI: Allow quirks to override SRIOV BARs.
  PCI: Add quirks for devices found on Cavium ThunderX SoCs.
  PCI: generic: Add support for Cavium ThunderX PCIe root complexes.

 .../devicetree/bindings/pci/host-generic-pci.txt   |  8 +-
 drivers/pci/host/Kconfig                           |  6 ++
 drivers/pci/host/Makefile                          |  1 +
 drivers/pci/host/pci-host-generic.c                | 29 +++++++
 drivers/pci/host/quirks-thunder.c                  | 95 ++++++++++++++++++++++
 drivers/pci/iov.c                                  |  9 +-
 6 files changed, 143 insertions(+), 5 deletions(-)
 create mode 100644 drivers/pci/host/quirks-thunder.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
