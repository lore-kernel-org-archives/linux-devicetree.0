From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 03/12] of/platform: add of_platform_device_ensure()
Date: Fri, 24 Apr 2015 16:47:19 +0200
Message-ID: <1429886848-5843-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

This function ensures that the device that encloses the passed device
node is registered, and thus probed if the corresponding driver has been
registered already.

This function can be used by drivers to ensure that a dependency is
fulfilled.
---
 drivers/of/platform.c       | 28 ++++++++++++++++++++++++++++
 include/linux/of_platform.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a01f57c..a71c36e 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -214,6 +214,34 @@ struct platform_device *of_platform_device_create(struct device_node *np,
 }
 EXPORT_SYMBOL(of_platform_device_create);
 
+/**
+ * of_platform_device_ensure - Ensure that device has been registered
+ * @np: pointer to node to create device for
+ *
+ * Ensures that a device has been registered for the given node.
+ */
+void of_platform_device_ensure(struct device_node *np)
+{
+	struct device_node *node;
+	struct platform_device *pdev;
+
+	/* Get the device that contains this node */
+	for(node = np;
+	    node && !of_get_property(node, "compatible", NULL);
+	    node = node->parent);
+
+	/* If it's in a non-simple bus, probe that one instead */
+	if (node->parent &&
+	    !of_node_is_root(node->parent) &&
+	    !of_match_node(of_default_bus_match_table, node->parent))
+		node = node->parent;
+
+	pdev = of_platform_device_create(node, NULL, NULL);
+	if (IS_ERR(pdev))
+		pr_debug("%s: creation of platform device failed\n", np->full_name);
+}
+EXPORT_SYMBOL_GPL(of_platform_device_ensure);
+
 #ifdef CONFIG_ARM_AMBA
 static struct amba_device *of_amba_device_create(struct device_node *node,
 						 const char *bus_id,
diff --git a/include/linux/of_platform.h b/include/linux/of_platform.h
index 611a691..ee6fa45 100644
--- a/include/linux/of_platform.h
+++ b/include/linux/of_platform.h
@@ -67,6 +67,8 @@ extern struct platform_device *of_platform_device_create(struct device_node *np,
 extern int of_platform_bus_probe(struct device_node *root,
 				 const struct of_device_id *matches,
 				 struct device *parent);
+
+extern void of_platform_device_ensure(struct device_node *np);
 #ifdef CONFIG_OF_ADDRESS
 extern int of_platform_populate(struct device_node *root,
 				const struct of_device_id *matches,
-- 
2.3.6
