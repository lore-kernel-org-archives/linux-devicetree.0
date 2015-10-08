From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/4] MSI, of, irqchip/gicv3-its: Handle "msi-map" properties.
Date: Thu,  8 Oct 2015 15:10:46 -0700
Message-ID: <1444342250-6196-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

The first patch from Mark Rutland adds the OF device tree binding
description, which explains what we are attempting to do here.  For
MSI messages on GICv3 systems there is some side-band data that
accompanies the message, this data is specified in the OF device tree
"msi-map" property of the PCI host driver.

The second patch adds a parser to get the required information out of
the device tree.

The third patch creates the pci_msi_domain_get_msi_rid() function to
make it more convenient to generate the proper PCI/MSI requester id.

The final patch converts gicv3-its to use the new infrastructure.

Changes from v1: Factor out the device tree access code to a separate
function in drivers/of/irq.c

Changes from v2: Added the pci_msi_domain_get_msi_rid() patch to
generalize the support a bit more.

Changes from v3: Added Acked-by to 2/4.  Simplified and improved
pci_msi_domain_get_msi_rid() as suggested by Marc Zyngier in 3/4.  1/4
and 4/4 unchanged.

Changes from v4: Added Reviewed-by to 3/4 and 4/4

David Daney (3):
  of/irq: Add new function of_msi_map_rid()
  PCI/MSI:  Add helper function pci_msi_domain_get_msi_rid().
  irqchip/gic-v3-its:  Add handling of PCI requester id.

Mark Rutland (1):
  Docs: dt: Add PCI MSI map bindings

 Documentation/devicetree/bindings/pci/pci-msi.txt | 220 ++++++++++++++++++++++
 drivers/irqchip/irq-gic-v3-its-pci-msi.c          |   4 +-
 drivers/of/irq.c                                  |  84 +++++++++
 drivers/pci/msi.c                                 |  30 +++
 include/linux/msi.h                               |   1 +
 include/linux/of_irq.h                            |   7 +
 6 files changed, 343 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/pci-msi.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
