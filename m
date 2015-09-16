From: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2] of: Check for overlap in reserved memory regions
Date: Tue, 15 Sep 2015 18:30:36 -0700
Message-ID: <1442367036-15205-1-git-send-email-mitchelh@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Any overlap in the reserved memory regions (those specified in the
reserved-memory DT node) is a bug.  These bugs might go undetected as
long as the contested region isn't used simultaneously by multiple
software agents, which makes such bugs hard to debug.  Fix this by
printing a scary warning during boot if overlap is detected.

Signed-off-by: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
v1..v2:
  - Suggestions from Rob Herring (remove superfluous array and
    print statement)
---
 drivers/of/of_reserved_mem.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 726ebe792813..62f467b8ccae 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -1,7 +1,7 @@
 /*
  * Device tree based initialization code for reserved memory.
  *
- * Copyright (c) 2013, The Linux Foundation. All Rights Reserved.
+ * Copyright (c) 2013, 2015 The Linux Foundation. All Rights Reserved.
  * Copyright (c) 2013,2014 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  * Author: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
@@ -20,6 +20,7 @@
 #include <linux/mm.h>
 #include <linux/sizes.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/sort.h>
 
 #define MAX_RESERVED_REGIONS	16
 static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
@@ -197,12 +198,52 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 	return -ENOENT;
 }
 
+static int __init __rmem_cmp(const void *a, const void *b)
+{
+	const struct reserved_mem *ra = a, *rb = b;
+
+	return ra->base - rb->base;
+}
+
+static void __init __rmem_check_for_overlap(void)
+{
+	int i;
+
+	if (reserved_mem_count < 2)
+		return;
+
+	sort(reserved_mem, reserved_mem_count, sizeof(reserved_mem[0]),
+	     __rmem_cmp, NULL);
+	for (i = 0; i < reserved_mem_count - 1; i++) {
+		struct reserved_mem *this, *next;
+
+		this = &reserved_mem[i];
+		next = &reserved_mem[i + 1];
+		if (!(this->base && next->base))
+			continue;
+		if (this->base + this->size > next->base) {
+			phys_addr_t this_end, next_end;
+
+			this_end = this->base + this->size;
+			next_end = next->base + next->size;
+			WARN(1,
+			     "Reserved memory: OVERLAP DETECTED!\n%s (%pa--%pa) overlaps with %s (%pa--%pa)\n",
+			     this->name, &this->base, &this_end,
+			     next->name, &next->base, &next_end);
+		}
+	}
+}
+
 /**
  * fdt_init_reserved_mem - allocate and init all saved reserved memory regions
  */
 void __init fdt_init_reserved_mem(void)
 {
 	int i;
+
+	/* check for overlapping reserved regions */
+	__rmem_check_for_overlap();
+
 	for (i = 0; i < reserved_mem_count; i++) {
 		struct reserved_mem *rmem = &reserved_mem[i];
 		unsigned long node = rmem->fdt_node;
-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
