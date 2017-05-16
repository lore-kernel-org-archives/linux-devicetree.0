From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH] irqchip: aspeed: Add AST2500 compatible string
Date: Tue, 16 May 2017 15:57:47 +0800
Message-ID: <20170516075747.23067-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In addition to introducing the new compatible string the bindings
description is reworked to be more generic.

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 .../bindings/interrupt-controller/aspeed,ast2400-vic.txt         | 9 +++++----
 drivers/irqchip/irq-aspeed-vic.c                                 | 3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
index 6c6e85324b9d..e3fea0758d25 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
@@ -1,12 +1,13 @@
 Aspeed Vectored Interrupt Controller
 
-These bindings are for the Aspeed AST2400 interrupt controller register layout.
-The SoC has an legacy register layout, but this driver does not support that
-mode of operation.
+These bindings are for the Aspeed interrupt controller. The AST2400 and
+AST2500 SoC families include a legacy register layout before a re-designed
+layout, but the bindings do not prescribe the use of one or the other.
 
 Required properties:
 
-- compatible : should be "aspeed,ast2400-vic".
+- compatible : "aspeed,ast2400-vic"
+               "aspeed,ast2500-vic"
 
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Specifies the number of cells needed to encode an
diff --git a/drivers/irqchip/irq-aspeed-vic.c b/drivers/irqchip/irq-aspeed-vic.c
index d24451d5bf8a..1c908ce25a9f 100644
--- a/drivers/irqchip/irq-aspeed-vic.c
+++ b/drivers/irqchip/irq-aspeed-vic.c
@@ -227,4 +227,5 @@ static int __init avic_of_init(struct device_node *node,
 	return 0;
 }
 
-IRQCHIP_DECLARE(aspeed_new_vic, "aspeed,ast2400-vic", avic_of_init);
+IRQCHIP_DECLARE(ast2400_vic, "aspeed,ast2400-vic", avic_of_init);
+IRQCHIP_DECLARE(ast2500_vic, "aspeed,ast2500-vic", avic_of_init);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
