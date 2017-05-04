From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/3] of: fix sparse warnings in fdt, irq, and resolver code
Date: Thu,  4 May 2017 13:00:35 -0500
Message-ID: <20170504180035.12834-3-robh@kernel.org>
References: <20170504180035.12834-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504180035.12834-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

sparse generates the following warnings in drivers/of/:

../drivers/of/fdt.c:63:36: warning: cast to restricted __be32
../drivers/of/fdt.c:68:33: warning: cast to restricted __be32
../drivers/of/irq.c:105:88: warning: incorrect type in initializer (different base types)
../drivers/of/irq.c:105:88:    expected restricted __be32
../drivers/of/irq.c:105:88:    got int
../drivers/of/irq.c:526:35: warning: incorrect type in assignment (different modifiers)
../drivers/of/irq.c:526:35:    expected int ( *const [usertype] irq_init_cb )( ... )
../drivers/of/irq.c:526:35:    got void const *const data
../drivers/of/resolver.c:95:42: warning: incorrect type in assignment (different base types)
../drivers/of/resolver.c:95:42:    expected unsigned int [unsigned] [usertype] <noident>
../drivers/of/resolver.c:95:42:    got restricted __be32 [usertype] <noident>

All these are harmless type mismatches fixed by adjusting the types.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/of/fdt.c       | 4 ++--
 drivers/of/irq.c       | 2 +-
 drivers/of/resolver.c  | 2 +-
 include/linux/of_irq.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e33f7818bc6c..a0972219ccfc 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -48,8 +48,8 @@ void of_fdt_limit_memory(int limit)
 	const void *val;
 	int nr_address_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
 	int nr_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
-	const uint32_t *addr_prop;
-	const uint32_t *size_prop;
+	const __be32 *addr_prop;
+	const __be32 *size_prop;
 	int root_offset;
 	int cell_size;
 
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 7c56b72d1dc6..d11437cb1187 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -102,7 +102,7 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
 	struct device_node *ipar, *tnode, *old = NULL, *newpar = NULL;
 	__be32 initial_match_array[MAX_PHANDLE_ARGS];
 	const __be32 *match_array = initial_match_array;
-	const __be32 *tmp, *imap, *imask, dummy_imask[] = { [0 ... MAX_PHANDLE_ARGS] = ~0 };
+	const __be32 *tmp, *imap, *imask, dummy_imask[] = { [0 ... MAX_PHANDLE_ARGS] = cpu_to_be32(~0) };
 	u32 intsize = 1, addrsize, newintsize = 0, newaddrsize = 0;
 	int imaplen, match, i, rc = -EINVAL;
 
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 7ae9863cb0a4..771f4844c781 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -92,7 +92,7 @@ static void adjust_overlay_phandles(struct device_node *overlay,
 		if (phandle == OF_PHANDLE_ILLEGAL)
 			continue;
 
-		*(uint32_t *)prop->value = cpu_to_be32(overlay->phandle);
+		*(__be32 *)prop->value = cpu_to_be32(overlay->phandle);
 	}
 
 	for_each_child_of_node(overlay, child)
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 1e0deb8e8494..ec6b11deb773 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -8,7 +8,7 @@
 #include <linux/ioport.h>
 #include <linux/of.h>
 
-typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
+typedef int const (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 
 /*
  * Workarounds only applied to 32bit powermac machines
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
