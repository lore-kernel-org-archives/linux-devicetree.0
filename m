From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/3] of: Add dummy of_irq_to_resource_table() for IRQ_OF=n
Date: Sun,  5 Apr 2015 16:59:25 +0200
Message-ID: <1428245965-19618-4-git-send-email-geert@linux-m68k.org>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428245965-19618-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

If CONFIG_IRQ_OF=n:

drivers/built-in.o: In function `of_device_alloc':
(.text+0x72bce): undefined reference to `of_irq_to_resource_table'
make: *** [vmlinux] Error 1

of_device_alloc() calls of_irq_to_resource_table() with nr_irqs = 0 due
to of_irq_count() already being a dummy, so just add a dummy for
of_irq_to_resource_table(), too.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/of_irq.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index bfec136a6d1e60f8..d884929a77479782 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -37,8 +37,6 @@ extern int of_irq_parse_one(struct device_node *device, int index,
 extern unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data);
 extern int of_irq_to_resource(struct device_node *dev, int index,
 			      struct resource *r);
-extern int of_irq_to_resource_table(struct device_node *dev,
-		struct resource *res, int nr_irqs);
 
 extern void of_irq_init(const struct of_device_id *matches);
 
@@ -46,6 +44,8 @@ extern void of_irq_init(const struct of_device_id *matches);
 extern int of_irq_count(struct device_node *dev);
 extern int of_irq_get(struct device_node *dev, int index);
 extern int of_irq_get_byname(struct device_node *dev, const char *name);
+extern int of_irq_to_resource_table(struct device_node *dev,
+		struct resource *res, int nr_irqs);
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -59,6 +59,11 @@ static inline int of_irq_get_byname(struct device_node *dev, const char *name)
 {
 	return 0;
 }
+static inline int of_irq_to_resource_table(struct device_node *dev,
+					   struct resource *res, int nr_irqs)
+{
+	return 0;
+}
 #endif
 
 #if defined(CONFIG_OF)
-- 
1.9.1
