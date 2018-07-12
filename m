From: frowand.list@gmail.com
Subject: [PATCH] of: overlay: update phandle cache on overlay apply and remove
Date: Thu, 12 Jul 2018 14:00:07 -0700
Message-ID: <1531429207-3245-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

A comment in the review of the patch adding the phandle cache said that
the cache would have to be updated when modules are applied and removed.
This patch implements the cache updates.

Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
Reported-by: Alan Tull <atull@kernel.org>
Suggested-by: Alan Tull <atull@kernel.org>
Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

Changes since RFC:
  - update code comment to mention race condition avoidance

For the RFC version of this patch, the 0day test reported a general
protection fault from the KASAN runtime memory debugger on x86_64
in qemu.  The GPF was in a devicetree unittest.

0day tested the patch on v4.17-rc1, with some other patches applied.
I was unable to replicate the GPF on v4.18-rc1 with just this patch
applied.  I was also unable to replicate the GPF on a clone of the
v4.17-rc1 0day repository, using the 0day kernel config.  I will
reply to this email with the 0day GPF report.


 drivers/of/base.c       |  6 +++---
 drivers/of/of_private.h |  2 ++
 drivers/of/overlay.c    | 11 +++++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 848f549164cd..466e3c8582f0 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -102,7 +102,7 @@ static u32 phandle_cache_mask;
  *   - the phandle lookup overhead reduction provided by the cache
  *     will likely be less
  */
-static void of_populate_phandle_cache(void)
+void of_populate_phandle_cache(void)
 {
 	unsigned long flags;
 	u32 cache_entries;
@@ -134,8 +134,7 @@ static void of_populate_phandle_cache(void)
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 }
 
-#ifndef CONFIG_MODULES
-static int __init of_free_phandle_cache(void)
+int of_free_phandle_cache(void)
 {
 	unsigned long flags;
 
@@ -148,6 +147,7 @@ static int __init of_free_phandle_cache(void)
 
 	return 0;
 }
+#if !defined(CONFIG_MODULES)
 late_initcall_sync(of_free_phandle_cache);
 #endif
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 891d780c076a..216175d11d3d 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -79,6 +79,8 @@ int of_resolve_phandles(struct device_node *tree);
 #if defined(CONFIG_OF_OVERLAY)
 void of_overlay_mutex_lock(void);
 void of_overlay_mutex_unlock(void);
+int of_free_phandle_cache(void);
+void of_populate_phandle_cache(void);
 #else
 static inline void of_overlay_mutex_lock(void) {};
 static inline void of_overlay_mutex_unlock(void) {};
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 7baa53e5b1d7..eda57ef12fd0 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -804,6 +804,8 @@ static int of_overlay_apply(const void *fdt, struct device_node *tree,
 		goto err_free_overlay_changeset;
 	}
 
+	of_populate_phandle_cache();
+
 	ret = __of_changeset_apply_notify(&ovcs->cset);
 	if (ret)
 		pr_err("overlay changeset entry notify error %d\n", ret);
@@ -1046,8 +1048,17 @@ int of_overlay_remove(int *ovcs_id)
 
 	list_del(&ovcs->ovcs_list);
 
+	/*
+	 * Disable phandle cache.  Avoids race condition that would arise
+	 * from removing cache entry when the associated node is deleted.
+	 */
+	of_free_phandle_cache();
+
 	ret_apply = 0;
 	ret = __of_changeset_revert_entries(&ovcs->cset, &ret_apply);
+
+	of_populate_phandle_cache();
+
 	if (ret) {
 		if (ret_apply)
 			devicetree_state_flags |= DTSF_REVERT_FAIL;
-- 
Frank Rowand <frank.rowand@sony.com>
