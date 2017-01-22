From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 2/9] drm: debugfs: Remove all files automatically on cleanup
Date: Sun, 22 Jan 2017 19:11:10 +0100
Message-ID: <20170122181117.8210-3-noralf@tronnes.org>
References: <20170122181117.8210-1-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170122181117.8210-1-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of having the drivers call drm_debugfs_remove_files() in
their drm_driver->debugfs_cleanup hook, do it automatically by
traversing minor->debugfs_list.
Also use debugfs_remove_recursive() so drivers who add their own
debugfs files don't have to keep track of them for removal.

Signed-off-by: Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
---
 drivers/gpu/drm/drm_debugfs.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 37fd612..0510ce2 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -218,6 +218,19 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 }
 EXPORT_SYMBOL(drm_debugfs_remove_files);
 
+static void drm_debugfs_remove_all_files(struct drm_minor *minor)
+{
+	struct drm_info_node *node, *tmp;
+
+	mutex_lock(&minor->debugfs_lock);
+	list_for_each_entry_safe(node, tmp, &minor->debugfs_list, list) {
+		debugfs_remove(node->dent);
+		list_del(&node->list);
+		kfree(node);
+	}
+	mutex_unlock(&minor->debugfs_lock);
+}
+
 /**
  * Cleanup the debugfs filesystem resources.
  *
@@ -245,9 +258,9 @@ int drm_debugfs_cleanup(struct drm_minor *minor)
 		}
 	}
 
-	drm_debugfs_remove_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES, minor);
+	drm_debugfs_remove_all_files(minor);
 
-	debugfs_remove(minor->debugfs_root);
+	debugfs_remove_recursive(minor->debugfs_root);
 	minor->debugfs_root = NULL;
 
 	return 0;
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
