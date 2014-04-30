From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] powerpc: fix skipping call to early_init_fdt_scan_reserved_mem
Date: Wed, 30 Apr 2014 01:03:52 -0500
Message-ID: <1398837832-30052-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

The call to early_init_fdt_scan_reserved_mem will be skipped if
reserved-ranges is not found. Move the call earlier so that it is called
unconditionally.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Tested-by: Stephen Chivers <schivers-SmukeSwxQOQ@public.gmane.org>
---
I found this issue in testing of my fdt clean-up series (thanks to 
Stephen). Since the reserved memory support is new, I don't think it is 
critical to fix this for 3.15. I plan to include this with my fdt series 
for 3.16 unless I hear otherwise.

Rob

 arch/powerpc/kernel/prom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 668aa47..d657549 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -567,6 +567,8 @@ static void __init early_reserve_mem_dt(void)
 	unsigned long i, len, dt_root;
 	const __be32 *prop;
 
+	early_init_fdt_scan_reserved_mem();
+
 	dt_root = of_get_flat_dt_root();
 
 	prop = of_get_flat_dt_prop(dt_root, "reserved-ranges", &len);
@@ -589,8 +591,6 @@ static void __init early_reserve_mem_dt(void)
 			memblock_reserve(base, size);
 		}
 	}
-
-	early_init_fdt_scan_reserved_mem();
 }
 
 static void __init early_reserve_mem(void)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
