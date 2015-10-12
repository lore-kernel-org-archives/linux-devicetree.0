From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 0/3] of/irq: fix guards and dummies for OF=y and OF_IRQ=n
Date: Mon, 12 Oct 2015 14:43:21 +0200
Message-ID: <1444653804-25544-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Historically OF was only selectable by arch code, which usually also used
IRQ_DOMAIN, thus making OF_IRQ and OF interchangeable for !SPARC.

Since OF is now a user selectable symbol, it is now easy to create a
situation where OF=y and OF_IRQ=n, by not enabling IRQ_DOMAIN on e.g.
x86.

This causes linking errors as for a few functions the prototype guard
was OF, which is too broad and does not catch all combinations. Recently
added of_msi_configure is even missing a dummy implementation.

The following three patches fix these issues by moving of_msi_configure
to under the right guard and add a dummy implementation, make
of_irq_find_parent static as there are no external users, and make the
guard for irq_of_parse_and_map more specific.

Based on robh/linux.git#for-next, as the tree from MAINTAINERS haven't
been updated for a while. I hope that is the right git to use.

Changes v1 -> v2:
 * merge the of_msi_configure into one patch
 * make of_irq_find_parent static and remove the prototype/dummy
 * rebased onto robh/linux.git#for-next

Jonas Gorski (3):
  of/irq: move of_msi_configure to the right guard and add a dummy
  of/irq: make of_irq_find_parent static
  of/irq: fix guards for irq_of_parse_and_map prototype

 drivers/of/irq.c       |  2 +-
 include/linux/of_irq.h | 15 ++++++---------
 2 files changed, 7 insertions(+), 10 deletions(-)

-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
