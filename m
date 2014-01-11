From: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Subject: (unknown)
Date: Fri, 10 Jan 2014 19:37:02 -0500
Message-ID: <0a923e$51jae5@icp-osb-irony-out9.iinet.net.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

>From f3b6db2e9607c22d1a7e16de9c4872539f4d786c Mon Sep 17 00:00:00 2001
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Date: Sat, 11 Jan 2014 10:03:58 +1000
Subject: [PATCH] ARM: parameter initrd must override FDT initrd

The initrd_start and initrd_end as set by FDT was overriding
the phys_initrd_start and phys_initrd_size set by the initrd=
kernel parameter.  This patch will ignore the initrd_start
and initrd_end set earlier if phys_initrd_start and
phys_initrd_size (as set by the initrd= parameter) are set.

Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
---
 arch/arm/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 1f7b19a..819c539 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -345,10 +345,11 @@ void __init arm_memblock_init(struct meminfo *mi,
 #endif
 #ifdef CONFIG_BLK_DEV_INITRD
 	/* FDT scan will populate initrd_start */
-	if (initrd_start) {
+	if (initrd_start && !phys_initrd_size) {
 		phys_initrd_start = __virt_to_phys(initrd_start);
 		phys_initrd_size = initrd_end - initrd_start;
 	}
+	initrd_start = initrd_end = 0;
 	if (phys_initrd_size &&
 	    !memblock_is_region_memory(phys_initrd_start, phys_initrd_size)) {
 		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
