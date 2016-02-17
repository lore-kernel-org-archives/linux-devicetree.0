From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH 1/1] of/overlay: of overlay callbacks
Date: Wed, 17 Feb 2016 11:41:25 -0600
Message-ID: <1455730885-1514-2-git-send-email-atull@opensource.altera.com>
References: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Add overlay callback functionality.

When DT overlays are being added, some drivers/subsystems
will want to know about the changes before they go into the
live tree.  Similarly there is a need for post-remove
callbacks.

Each handler is registered with a of_device_id.  When
an overlay target matches a handler's id, the handler
gets called.

The following 4 cases are handled: pre-apply, post-apply,
pre-remove, and post-remove.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/of/overlay.c |   90 +++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/of.h   |   31 +++++++++++++++++
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8225081..ee88e4e 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -20,9 +20,13 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/idr.h>
+#include <linux/list.h>
 
 #include "of_private.h"
 
+static DEFINE_SPINLOCK(of_overlay_handler_lock);
+static LIST_HEAD(of_overlay_handler_list);
+
 /**
  * struct of_overlay_info - Holds a single overlay info
  * @target:	target of the overlay operation
@@ -56,6 +60,80 @@ struct of_overlay {
 static int of_overlay_apply_one(struct of_overlay *ov,
 		struct device_node *target, const struct device_node *overlay);
 
+/*
+ * Send overlay callbacks to handlers that match.  This call is blocking.  In
+ * the case OF_OVERLAY_PRE_APPLY, return error for the first handler that fails.
+ * Otherwise, notify all the matching handlers and return success.
+ */
+static int send_overlay_callbacks(struct of_overlay *ov, int type)
+{
+	int i, ret;
+
+	spin_lock(&of_overlay_handler_lock);
+
+	for (i = 0; i < ov->count; i++) {
+		struct of_overlay_info *ovinfo = &ov->ovinfo_tab[i];
+		struct of_overlay_handler *handler;
+		int (*callback)(struct of_overlay_msg *msg);
+		struct of_overlay_msg msg_data;
+
+		msg_data.target = ovinfo->target;
+		msg_data.overlay = ovinfo->overlay;
+
+		list_for_each_entry(handler, &of_overlay_handler_list, node) {
+			msg_data.priv = handler->priv;
+			switch (type) {
+			case OF_OVERLAY_PRE_APPLY:
+				callback = handler->pre_apply_callback;
+				break;
+			case OF_OVERLAY_POST_APPLY:
+				callback = handler->post_apply_callback;
+				break;
+			case OF_OVERLAY_PRE_REMOVE:
+				callback = handler->pre_remove_callback;
+				break;
+			case OF_OVERLAY_POST_REMOVE:
+				callback = handler->post_remove_callback;
+				break;
+			default:
+				continue;
+			};
+			if (!callback)
+				continue;
+			if (of_match_node(handler->of_match, ovinfo->target)) {
+				ret = callback(&msg_data);
+				if ((ret < 0) && (type == OF_OVERLAY_PRE_APPLY)) {
+					spin_unlock(&of_overlay_handler_lock);
+					return ret;
+				}
+				continue;
+			}
+		}
+	}
+
+	spin_unlock(&of_overlay_handler_lock);
+
+	return 0;
+}
+
+int of_overlay_handler_register(struct of_overlay_handler *handler)
+{
+	spin_lock(&of_overlay_handler_lock);
+	list_add_tail(&handler->node, &of_overlay_handler_list);
+	spin_unlock(&of_overlay_handler_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_overlay_handler_register);
+
+void of_overlay_handler_unregister(struct of_overlay_handler *handler)
+{
+	spin_lock(&of_overlay_handler_lock);
+	list_del(&handler->node);
+	spin_unlock(&of_overlay_handler_lock);
+}
+EXPORT_SYMBOL_GPL(of_overlay_handler_unregister);
+
 static int of_overlay_apply_single_property(struct of_overlay *ov,
 		struct device_node *target, struct property *prop)
 {
@@ -370,6 +448,13 @@ int of_overlay_create(struct device_node *tree)
 		goto err_free_idr;
 	}
 
+	err = send_overlay_callbacks(ov, OF_OVERLAY_PRE_APPLY);
+	if (err < 0) {
+		pr_err("%s: Pre apply handler failed (err=%d)\n",
+		       __func__, err);
+		goto err_free_idr;
+	}
+
 	/* apply the overlay */
 	err = of_overlay_apply(ov);
 	if (err) {
@@ -389,6 +474,8 @@ int of_overlay_create(struct device_node *tree)
 	/* add to the tail of the overlay list */
 	list_add_tail(&ov->node, &ov_list);
 
+	send_overlay_callbacks(ov, OF_OVERLAY_POST_APPLY);
+
 	mutex_unlock(&of_mutex);
 
 	return id;
@@ -509,9 +596,10 @@ int of_overlay_destroy(int id)
 		goto out;
 	}
 
-
+	send_overlay_callbacks(ov, OF_OVERLAY_PRE_REMOVE);
 	list_del(&ov->node);
 	__of_changeset_revert(&ov->cset);
+	send_overlay_callbacks(ov, OF_OVERLAY_POST_REMOVE);
 	of_free_overlay_info(ov);
 	idr_remove(&ov_idr, id);
 	of_changeset_destroy(&ov->cset);
diff --git a/include/linux/of.h b/include/linux/of.h
index dc6e396..def9481 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -101,9 +101,33 @@ static inline int of_node_is_attached(struct device_node *node)
 	return node && node->kobj.state_in_sysfs;
 }
 
+/* Callback types */
+#define OF_OVERLAY_PRE_APPLY	(0)
+#define OF_OVERLAY_POST_APPLY	(1)
+#define OF_OVERLAY_PRE_REMOVE	(2)
+#define OF_OVERLAY_POST_REMOVE	(3)
+
+struct of_overlay_msg {
+	struct device_node *overlay;
+	struct device_node *target;
+	void *priv;
+};
+
+struct of_overlay_handler {
+	int (*pre_apply_callback)(struct of_overlay_msg *msg);
+	int (*post_apply_callback)(struct of_overlay_msg *msg);
+	int (*pre_remove_callback)(struct of_overlay_msg *msg);
+	int (*post_remove_callback)(struct of_overlay_msg *msg);
+	const struct of_device_id *of_match;
+	struct list_head node;
+	void *priv;
+};
+
 #ifdef CONFIG_OF_DYNAMIC
 extern struct device_node *of_node_get(struct device_node *node);
 extern void of_node_put(struct device_node *node);
+extern int of_overlay_handler_register(struct of_overlay_handler *handler);
+extern void of_overlay_handler_unregister(struct of_overlay_handler *handler);
 #else /* CONFIG_OF_DYNAMIC */
 /* Dummy ref counting routines - to be implemented later */
 static inline struct device_node *of_node_get(struct device_node *node)
@@ -111,6 +135,13 @@ static inline struct device_node *of_node_get(struct device_node *node)
 	return node;
 }
 static inline void of_node_put(struct device_node *node) { }
+static int of_overlay_handler_register(struct of_overlay_handler *handler)
+{
+	return -EINVAL;
+}
+static void of_overlay_handler_unregister(struct of_overlay_handler *handler)
+{
+}
 #endif /* !CONFIG_OF_DYNAMIC */
 
 /* Pointer for first entry in chain of all nodes. */
-- 
1.7.9.5
