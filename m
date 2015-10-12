From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH V2 3/3] of/irq: fix guards for irq_of_parse_and_map prototype
Date: Mon, 12 Oct 2015 14:43:24 +0200
Message-ID: <1444653804-25544-4-git-send-email-jogo@openwrt.org>
References: <1444653804-25544-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444653804-25544-1-git-send-email-jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since OF is now a userselectable config symbol, having OF=y but OF_IRQ=n
is a valid combination for non-OF platforms, and OF=y does not guarantee
anymore that OF_IRQ is enabled (or we are building for SPARC).

Fixes the following build error with OF=y, IRQ_DOMAIN=n and SPI=y:

drivers/built-in.o: In function `spi_register_master':
(.text+0xc3ae): undefined reference to `irq_of_parse_and_map'
Makefile:935: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

Signed-off-by: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
---
v1 -> v2:
 * no changes

 include/linux/of_irq.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index a58e2e5..580818d 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -70,7 +70,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
 }
 #endif
 
-#if defined(CONFIG_OF)
+#if defined(CONFIG_OF_IRQ) || defined(CONFIG_SPARC)
 /*
  * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
  * implements it differently.  However, the prototype is the same for all,
@@ -78,7 +78,7 @@ static inline void of_msi_configure(struct device *dev, struct device_node *np)
  */
 extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
 
-#else /* !CONFIG_OF */
+#else /* !CONFIG_OF && !CONFIG_SPARC */
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
 						int index)
 {
-- 
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
