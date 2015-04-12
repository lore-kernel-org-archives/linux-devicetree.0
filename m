From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/fdt: Remove "reg" data prints from early_init_dt_scan_memory
Date: Sun, 12 Apr 2015 13:16:26 -0700
Message-ID: <1428869786-26897-1-git-send-email-f.fainelli@gmail.com>
References: <55259B4D.2020304@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55259B4D.2020304-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 51975db0b7333 ("of/flattree: merge early_init_dt_scan_memory()
common code") consolidated some code from PowerPC (typically
big-endian), and ended-up adding a pr_debug() printing reg properties in
big-endian (DT native) format, not CPU endian.

This debug print suffers from two problems:
- we only print 4 "reg" values, while there could be more on typical
  systems having multiple memory ranges
- we print these 4 "reg" values in FDT endianess, that is big-endian,
  and these values could be confusing for little-endian configurations

Since we are already printing the base address and size of the memory
regions parsed by early_init_dt_scan_memory() later in a way that is
both endian correct, and takes into account arbitrary number of memory
banks, just remove that part of the debug print.

Suggested-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Patch against devicetree/next

 drivers/of/fdt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3a896c9..34bdc4d 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -879,8 +879,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 
 	endp = reg + (l / sizeof(__be32));
 
-	pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
-	    uname, l, reg[0], reg[1], reg[2], reg[3]);
+	pr_debug("memory scan node %s, reg size %d,\n", uname, l);
 
 	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
 		u64 base, size;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
