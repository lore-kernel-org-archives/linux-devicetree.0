From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 0/3] of/irq: fix guards and dummies for OF=y and OF_IRQ=n
Date: Mon,  7 Sep 2015 14:37:14 +0200
Message-ID: <1441629437-23769-1-git-send-email-jogo@openwrt.org>
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

The following three patches fix these issues by shuffling the prototypes
and dummy implementations around (adding one where necessary), and make
the guard for irq_of_parse_and_map more specific.

Based on devicetree/next.

Jonas Gorski (3):
  of/irq: add a dummy of_msi_configure if OF_IRQ=n
  of/irq: fix guards of of_irq_find_parent and of_msi_configure
  of/irq: fix guards for irq_of_parse_and_map prototype

 include/linux/of_irq.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
