From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/6] PCI: generic: Misc. bug fixes/enhancements
Date: Tue, 22 Sep 2015 16:49:11 -0700
Message-ID: <1442965757-12925-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

While using the pci-host-generic driver to add PCI support for the
Cavium ThunderX processors, several bugs were discovered.  This patch
set fixes the bugs, a follow-on set will add the ThunderX support.

Changes from v2:

  - Added " PCI: generic: Claim device resources if PCI_PROBE_ONLY"

Changes from v1:

  - "PCI: generic: Allow bus default MSI controller to be specified."
    patch was dropped as it is no longer necessary.

  - "PCI: Make global and export pdev_fixup_irq()." and "PCI: generic:
    Only fixup irqs for bus we are creating." were rewritten to move
    the support into a somewhat more generic form in setup-irq.c.

  - Add some clarifying text to host-generic-pci.txt

  - Add some Acked-by:


David Daney (6):
  PCI: Add pci_bus_fixup_irqs().
  PCI: generic: Only fixup irqs for bus we are creating.
  PCI: generic: Quit clobbering our pci_ops.
  PCI: generic: Correct, and avoid overflow, in bus_max calculation.
  PCI: generic: Pass proper starting bus number to pci_scan_root_bus().
  PCI: generic: Claim device resources if PCI_PROBE_ONLY

 .../devicetree/bindings/pci/host-generic-pci.txt   |  4 +-
 drivers/pci/host/pci-host-generic.c                | 59 +++++++++++++++-------
 drivers/pci/setup-irq.c                            | 30 +++++++++++
 include/linux/pci.h                                |  4 ++
 4 files changed, 79 insertions(+), 18 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
