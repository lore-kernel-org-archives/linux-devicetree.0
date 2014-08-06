From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: Allow mem_reserve of memory with a base address of zero
Date: Wed, 6 Aug 2014 16:30:04 -0400
Message-ID: <1407357004-31713-1-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

__reserved_mem_reserve_reg() won't reserve memory if the base address
is zero. This change removes the check for a base address of zero and
allows it to be reserved.

Allowing the first 4K of memory to be reserved will help solve a
problem on some ARM systems where the the first 16K of memory is
unused and becomes allocable memory. This will prevent this memory
from being used for DMA by drivers like the USB OHCI driver which
consider a physical address of zero to be illegal.

Signed-off-by: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 9aa012e..379ad4f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -453,7 +453,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
 		size = dt_mem_next_cell(dt_root_size_cells, &prop);
 
-		if (base && size &&
+		if (size &&
 		    early_init_dt_reserve_memory_arch(base, size, nomap) == 0)
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %ld MiB\n",
 				uname, &base, (unsigned long)size / SZ_1M);
-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
