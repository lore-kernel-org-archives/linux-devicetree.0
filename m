Return-Path: <SRS0=/YiW=SE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from retiisi.org.uk ([95.216.213.190]:37234 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725959AbfDBKam (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Apr 2019 06:30:42 -0400
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Date: Tue,  2 Apr 2019 13:30:37 +0300
Message-Id: <20190402103037.8517-1-sakari.ailus@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

fwnode_graph_get_endpoint_by_id() is intended for obtaining local
endpoints by a given local port. fwnode_graph_get_endpoint_by_id() is
slightly different from its OF counterpart is
of_graph_get_endpoint_by_regs(): instead of using -1 as a value to signify
that a port or an endpoint number does not matter, it uses flags to look
for equal or greater endpoint. The port number is always fixed. It also
returns only remote endpoints that belong to an available device, a
behaviour that can be turned off with a flag.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Improved function synopsis and argument descriptions, including flags

- Make flags unsigned long (was an enum)

- Change the disabled bool to enabled_only and reversed its meaning

- Cleaned up figuring out whether a remote device related to and endpoint
  is available

- Removed not so useful comments and improved some of the remaining ones

- Converted the flags enum to pre-processor macros

 drivers/base/property.c  | 75 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h | 18 ++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8b91ab380d14..348b37e64944 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -984,6 +984,81 @@ fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port_id,
 EXPORT_SYMBOL_GPL(fwnode_graph_get_remote_node);
 
 /**
+ * fwnode_graph_get_endpoint_by_id - get endpoint by port and endpoint numbers
+ * @fwnode: parent fwnode_handle containing the graph
+ * @port: identifier of the port node
+ * @endpoint: identifier of the endpoint node under the port node
+ * @flags: fwnode lookup flags
+ *
+ * Return the fwnode handle of the local endpoint corresponding the port and
+ * endpoint IDs or NULL if not found.
+ *
+ * If FWNODE_GRAPH_ENDPOINT_NEXT is passed in @flags and the specified endpoint
+ * has not been found, look for the closest endpoint ID greater than the
+ * specified one and return the endpoint that corresponds to it, if present.
+ *
+ * Do not return endpoints that belong to disabled devices, unless
+ * FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * The returned endpoint needs to be released by calling fwnode_handle_put() on
+ * it when it is not needed any more.
+ */
+struct fwnode_handle *
+fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
+				u32 port, u32 endpoint, unsigned long flags)
+{
+	struct fwnode_handle *ep = NULL, *best_ep = NULL;
+	unsigned int best_ep_id = 0;
+	bool endpoint_next = flags & FWNODE_GRAPH_ENDPOINT_NEXT;
+	bool enabled_only = !(flags & FWNODE_GRAPH_DEVICE_DISABLED);
+
+	while ((ep = fwnode_graph_get_next_endpoint(fwnode, ep))) {
+		struct fwnode_endpoint fwnode_ep = { 0 };
+		int ret;
+
+		if (enabled_only) {
+			struct fwnode_handle *dev_node;
+			bool available;
+
+			dev_node = fwnode_graph_get_remote_port_parent(ep);
+			available = fwnode_device_is_available(dev_node);
+			fwnode_handle_put(dev_node);
+			if (!available)
+				continue;
+		}
+
+		ret = fwnode_graph_parse_endpoint(ep, &fwnode_ep);
+		if (ret < 0)
+			continue;
+
+		if (fwnode_ep.port != port)
+			continue;
+
+		if (fwnode_ep.id == endpoint)
+			return ep;
+
+		if (!endpoint_next)
+			continue;
+
+		/*
+		 * If the endpoint that has just been found is not the first
+		 * matching one and the ID of the one found previously is closer
+		 * to the requested endpoint ID, skip it.
+		 */
+		if (fwnode_ep.id < endpoint ||
+		    (best_ep && best_ep_id < fwnode_ep.id))
+			continue;
+
+		fwnode_handle_put(best_ep);
+		best_ep = fwnode_handle_get(ep);
+		best_ep_id = fwnode_ep.id;
+	}
+
+	return best_ep;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_endpoint_by_id);
+
+/**
  * fwnode_graph_parse_endpoint - parse common endpoint node properties
  * @fwnode: pointer to endpoint fwnode_handle
  * @endpoint: pointer to the fwnode endpoint data structure
diff --git a/include/linux/property.h b/include/linux/property.h
index 65d3420dd5d1..a29369c89e6e 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -13,6 +13,7 @@
 #ifndef _LINUX_PROPERTY_H_
 #define _LINUX_PROPERTY_H_
 
+#include <linux/bits.h>
 #include <linux/fwnode.h>
 #include <linux/types.h>
 
@@ -304,6 +305,23 @@ struct fwnode_handle *
 fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
 			     u32 endpoint);
 
+/*
+ * Fwnode lookup flags
+ *
+ * @FWNODE_GRAPH_ENDPOINT_NEXT: In the case of no exact match, look for the
+ *				closest endpoint ID greater than the specified
+ *				one.
+ * @FWNODE_GRAPH_DEVICE_DISABLED: That the device to which the remote
+ *				  endpoint of the given endpoint belongs to,
+ *				  may be disabled.
+ */
+#define FWNODE_GRAPH_ENDPOINT_NEXT	BIT(0)
+#define FWNODE_GRAPH_DEVICE_DISABLED	BIT(1)
+
+struct fwnode_handle *
+fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
+				u32 port, u32 endpoint, unsigned long flags);
+
 #define fwnode_graph_for_each_endpoint(fwnode, child)			\
 	for (child = NULL;						\
 	     (child = fwnode_graph_get_next_endpoint(fwnode, child)); )
-- 
2.11.0
