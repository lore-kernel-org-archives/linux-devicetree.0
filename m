From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 04/29] arc: use unflatten_and_copy_device_tree
Date: Mon,  7 Oct 2013 11:29:12 -0500
Message-ID: <1381163377-21044-5-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Use the common unflatten_and_copy_device_tree to copy the built-in FDT
out of init section.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Acked-by: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arc/include/asm/mach_desc.h |  1 -
 arch/arc/kernel/devtree.c        | 15 ---------------
 arch/arc/kernel/setup.c          |  3 +--
 3 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/arch/arc/include/asm/mach_desc.h b/arch/arc/include/asm/mach_desc.h
index 9998dc8..d3e9c0a 100644
--- a/arch/arc/include/asm/mach_desc.h
+++ b/arch/arc/include/asm/mach_desc.h
@@ -82,6 +82,5 @@ __attribute__((__section__(".arch.info.init"))) = {	\
 };
 
 extern struct machine_desc *setup_machine_fdt(void *dt);
-extern void __init copy_devtree(void);
 
 #endif
diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 2340af0..eeb613a 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -100,18 +100,3 @@ struct machine_desc * __init setup_machine_fdt(void *dt)
 
 	return mdesc_best;
 }
-
-/*
- * Copy the flattened DT out of .init since unflattening doesn't copy strings
- * and the normal DT APIs refs them from orig flat DT
- */
-void __init copy_devtree(void)
-{
-	void *alloc = early_init_dt_alloc_memory_arch(
-			be32_to_cpu(initial_boot_params->totalsize), 64);
-	if (alloc) {
-		memcpy(alloc, initial_boot_params,
-				be32_to_cpu(initial_boot_params->totalsize));
-		initial_boot_params = alloc;
-	}
-}
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 2c68bc7e..710bf89 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -346,8 +346,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_arch_memory();
 
 	/* copy flat DT out of .init and then unflatten it */
-	copy_devtree();
-	unflatten_device_tree();
+	unflatten_and_copy_device_tree();
 
 	/* Can be issue if someone passes cmd line arg "ro"
 	 * But that is unlikely so keeping it as it is
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
