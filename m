From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH] of: pass name argument for of_io_request_and_map as const char *
Date: Thu, 13 Nov 2014 02:17:02 +0800
Message-ID: <1415816222-32200-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The name argument for of_io_request_and_map is only passed to
request_mem_region, which is a macro of __request_region, which
takes a const name argument.

Make the name argument const, so when we pass const strings we
don't get the following warnings:

    warning: passing argument 3 of 'of_io_request_and_map' discards
    'const' qualifier from pointer target type [enabled by default]

    In file included from drivers/clk/sunxi/clk-sunxi.c:20:0:
    include/linux/of_address.h:108:15: note: expected 'char *' but
    argument is of type 'const char *'

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

I ran into this while switching some of the sunxi clock code to use
of_io_request_and_map.

---
 drivers/of/address.c       | 2 +-
 include/linux/of_address.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index afdb782..e02828f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -871,7 +871,7 @@ EXPORT_SYMBOL(of_iomap);
  *		return PTR_ERR(base);
  */
 void __iomem *of_io_request_and_map(struct device_node *np, int index,
-					char *name)
+					const char *name)
 {
 	struct resource res;
 	void __iomem *mem;
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 8cb14eb..d88e81b 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -106,7 +106,7 @@ extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
 void __iomem *of_iomap(struct device_node *node, int index);
 void __iomem *of_io_request_and_map(struct device_node *device,
-					int index, char *name);
+					int index, const char *name);
 #else
 
 #include <linux/io.h>
@@ -123,7 +123,7 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 }
 
 static inline void __iomem *of_io_request_and_map(struct device_node *device,
-					int index, char *name)
+					int index, const char *name)
 {
 	return IOMEM_ERR_PTR(-EINVAL);
 }
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
