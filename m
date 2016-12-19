From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/3] of/overlay: add API function to count and pop last
Date: Mon, 19 Dec 2016 02:10:33 +0100
Message-ID: <1482109835-9000-2-git-send-email-xypron.glpk@gmx.de>
References: <1482109835-9000-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482109835-9000-1-git-send-email-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

To allow building interfaces which are not id based
two new functions are added to the device tree
overlay API:

of_overlay_count        - counts the loaded overlays
of_overlay_destroy_last - removes the last overlay loaded

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 Documentation/devicetree/overlay-notes.txt |  7 +++--
 drivers/of/overlay.c                       | 50 ++++++++++++++++++++++++++++++
 include/linux/of.h                         | 12 +++++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.txt b/Documentation/devicetree/overlay-notes.txt
index d418a6ce9812..7c8099c81e91 100644
--- a/Documentation/devicetree/overlay-notes.txt
+++ b/Documentation/devicetree/overlay-notes.txt
@@ -89,17 +89,20 @@ Overlay in-kernel API
 
 The API is quite easy to use.
 
-1. Call of_overlay_create() to create and apply an overlay. The return value
+Call of_overlay_create() to create and apply an overlay. The return value
 is a cookie identifying this overlay.
 
-2. Call of_overlay_destroy() to remove and cleanup the overlay previously
+Call of_overlay_destroy() to remove and cleanup the overlay previously
 created via the call to of_overlay_create(). Removal of an overlay that
 is stacked by another will not be permitted.
+Or call of_overlay_destroy_last() to remove the most recent overlay.
 
 Finally, if you need to remove all overlays in one-go, just call
 of_overlay_destroy_all() which will remove every single one in the correct
 order.
 
+Call of_overlay_count() to determine the number of loaded overlays.
+
 Overlay DTS Format
 ------------------
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 0d4cda7050e0..bd30253b26f9 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -587,3 +587,53 @@ int of_overlay_destroy_all(void)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_overlay_destroy_all);
+
+/**
+ * of_overlay_destroy_last() - Removes the last overlay from the system
+ *
+ * It is allways possible to delete the last overlay.
+ *
+ * Returns 0 on success, or a negative error number
+ */
+int of_overlay_destroy_last(void)
+{
+	struct of_overlay *ov, *ovn;
+	int id;
+
+	mutex_lock(&of_mutex);
+
+	list_for_each_entry_safe_reverse(ov, ovn, &ov_list, node) {
+		id = ov->id;
+		mutex_unlock(&of_mutex);
+		return of_overlay_destroy(id);
+	}
+
+	mutex_unlock(&of_mutex);
+
+	pr_info("destroy: No overlay to destroy");
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(of_overlay_destroy_last);
+
+/**
+ * of_overlay_count - Counts number of loaded overlays
+ *
+ * Returns number of loaded overlays
+ */
+int of_overlay_count(void)
+{
+	struct of_overlay *ov, *ovn;
+	int count = 0;
+
+	mutex_lock(&of_mutex);
+
+	list_for_each_entry_safe(ov, ovn, &ov_list, node) {
+		++count;
+	}
+
+	mutex_unlock(&of_mutex);
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_overlay_count);
diff --git a/include/linux/of.h b/include/linux/of.h
index d72f01009297..73c8826c543b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1281,15 +1281,22 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 /* ID based overlays; the API for external users */
+int of_overlay_count(void);
 int of_overlay_create(struct device_node *tree);
 int of_overlay_destroy(int id);
 int of_overlay_destroy_all(void);
+int of_overlay_destroy_last(void);
 
 int of_overlay_notifier_register(struct notifier_block *nb);
 int of_overlay_notifier_unregister(struct notifier_block *nb);
 
 #else
 
+static int of_overlay_count(void)
+{
+	return -ENOTSUPP;
+}
+
 static inline int of_overlay_create(struct device_node *tree)
 {
 	return -ENOTSUPP;
@@ -1305,6 +1312,11 @@ static inline int of_overlay_destroy_all(void)
 	return -ENOTSUPP;
 }
 
+static inline int of_overlay_destroy_last(void)
+{
+	return -ENOTSUPP;
+}
+
 static inline int of_overlay_notifier_register(struct notifier_block *nb)
 {
 	return 0;
-- 
2.11.0
