From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/3] irqdomain fixes for 4.5-rc1
Date: Tue, 26 Jan 2016 13:52:24 +0000
Message-ID: <1453816347-32720-1-git-send-email-marc.zyngier@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This short series addresses a couple of shortcomings of the irqdomain
subsystem:

(1) The use of DOMAIN_BUS_ANY for looking up wired interrupts can
    result in interesting situations if a given interrupt controller
    implements both wired and message interrupts...

(2) Using DOMAIN_BUS_ANY for MSI lookup is completely redundant (it
    can never match with any of the existing drivers), and is likely
    to fail when we introduce HW similar to what is described in (1).

(3) platform_msi_domain_{alloc,free}_irqs need to be exported so that
    drivers using MSIs can be built as modules.

These patches are a pre-requisite for Thomas Petazzoni's work on the
MVEBU interrupt controller, which outlined the above issues:

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/395429.html

Thanks,

	M.

Marc Zyngier (2):
  irqdomain: Allow domain lookup with DOMAIN_BUS_WIRED token
  of: MSI: Simplify irqdomain lookup

Thomas Petazzoni (1):
  base: Export platform_msi_domain_{alloc,free}_irqs

 drivers/base/platform-msi.c |  2 ++
 drivers/of/irq.c            | 18 +++---------------
 include/linux/irqdomain.h   |  1 +
 kernel/irq/irqdomain.c      | 11 ++++++++---
 4 files changed, 14 insertions(+), 18 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
