From: Rob Herring <robh@kernel.org>
Subject: [PATCH 4/6] of: move kobj_to_device_node() into dynamic.c
Date: Thu,  5 Oct 2017 14:44:20 -0500
Message-ID: <20171005194422.26224-5-robh@kernel.org>
References: <20171005194422.26224-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

The only user of kobj_to_device_node() is in dynamic.c, so move it
there. This avoids having to make it conditional once kobject is
configurable.

Cc: Nicolas Pitre <nico@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/dynamic.c    | 5 +++++
 drivers/of/of_private.h | 6 ------
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 301b6db2b48d..9d6ba18c529f 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -16,6 +16,11 @@
 
 #include "of_private.h"
 
+static struct device_node *kobj_to_device_node(struct kobject *kobj)
+{
+	return container_of(kobj, struct device_node, kobj);
+}
+
 /**
  * of_node_get() - Increment refcount of a node
  * @node:	Node to inc refcount, NULL is supported to simplify writing of
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 3ae12ffbf547..cc86a974f35f 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -35,12 +35,6 @@ extern struct mutex of_mutex;
 extern struct list_head aliases_lookup;
 extern struct kset *of_kset;
 
-
-static inline struct device_node *kobj_to_device_node(struct kobject *kobj)
-{
-	return container_of(kobj, struct device_node, kobj);
-}
-
 #if defined(CONFIG_OF_DYNAMIC)
 extern int of_property_notify(int action, struct device_node *np,
 			      struct property *prop, struct property *old_prop);
-- 
2.11.0
