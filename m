From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] of: Fix memory block alignment in early_init_dt_add_memory_arch()
Date: Wed, 20 Aug 2014 17:10:31 +0200
Message-ID: <1408547431-24001-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If a memory block is not aligned to PAGE_SIZE, its base address must be
rounded up, not down, and its size must be reduced.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/fdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index f46a24ffa3fe..95fa81b8ca19 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -928,7 +928,11 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
 {
 	const u64 phys_offset = __pa(PAGE_OFFSET);
-	base &= PAGE_MASK;
+
+	if (!PAGE_ALIGNED(base)) {
+		size -= PAGE_SIZE - (base & ~PAGE_MASK);
+		base = PAGE_ALIGN(base);
+	}
 	size &= PAGE_MASK;
 
 	if (base > MAX_PHYS_ADDR) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
