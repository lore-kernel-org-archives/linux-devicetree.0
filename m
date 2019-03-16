Return-Path: <SRS0=sfcU=RT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from retiisi.org.uk ([95.216.213.190]:42584 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbfCPLgH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Mar 2019 07:36:07 -0400
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 1/1] device property: Add fwnode_graph_get_endpoint_by_id
Date: Sat, 16 Mar 2019 13:36:05 +0200
Message-Id: <20190316113605.12928-1-sakari.ailus@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
To: rafael@kernel.org
Cc: robh@kernel.org, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
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
since v1:

- Remove the PORT_NEXT flag.

- Replace the ENDPOINT_AVAILABLE flag with DEVICE_DISABLED flag and
  so effectively inverting its functionality.

- Rework the loop iterating over endpoint to find the best one. It's more
  simple and better commented now.

- Fixes in indentation and documentation (e.g. fwnode_node_put ->
  fwnode_handle_put).

 drivers/base/property.c  | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h | 19 ++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8b91ab380d14..7b908cadbdd5 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -984,6 +984,87 @@ fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port_id,
 EXPORT_SYMBOL_GPL(fwnode_graph_get_remote_node);
 
 /**
+ * fwnode_graph_get_endpoint_by_id - get endpoint node by port and endpoint
+ *				     numbers
+ * @fwnode: pointer to parent fwnode_handle containing the graph
+ * @port: identifier of the port node
+ * @endpoint: identifier of the endpoint node under the port node
+ * @flags: fwnode graph flags
+ *
+ * Returns the fwnode handle to the local endpoint corresponding the port and
+ * endpoint IDs or NULL if not found.
+ *
+ * Flags may be set in order to obtain the endpoint instead of just returning
+ * the specified one or none at all, or to only return endpoints that belong to
+ * a device that is available.
+ *
+ * Use fwnode_handle_put() on the endpoint fwnode handle when done using it.
+ */
+struct fwnode_handle *
+fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
+				u32 port, u32 endpoint,
+				enum fwnode_graph_get_endpoint_flags flags)
+{
+	struct fwnode_handle *ep = NULL, *best_ep = NULL;
+	unsigned int best_ep_id = 0;
+	bool endpoint_next = flags & FWNODE_GRAPH_ENDPOINT_NEXT;
+	bool disabled = flags & FWNODE_GRAPH_DEVICE_DISABLED;
+
+	while ((ep = fwnode_graph_get_next_endpoint(fwnode, ep))) {
+		struct fwnode_endpoint fwnode_ep = { 0 };
+		int ret;
+
+		/*
+		 * Check the device is available unless we're explicitly told
+		 * not to.
+		 */
+		if (!disabled) {
+			struct fwnode_handle *dev;
+
+			dev = fwnode_graph_get_remote_port_parent(ep);
+
+			if (!fwnode_device_is_available(dev)) {
+				fwnode_handle_put(dev);
+				continue;
+			}
+
+			fwnode_handle_put(dev);
+		}
+
+		ret = fwnode_graph_parse_endpoint(ep, &fwnode_ep);
+		if (ret < 0)
+			continue;
+
+		/* Check we have the right port. */
+		if (fwnode_ep.port != port)
+			continue;
+
+		/* Is this an exact match? If so, return it immediately. */
+		if (fwnode_ep.id == endpoint)
+			return ep;
+
+		/* Is an exact match needed? If so, skip this one. */
+		if (!endpoint_next)
+			continue;
+
+		/*
+		 * Is this endpoint better than we already had?
+		 */
+		if (fwnode_ep.id < endpoint ||
+		    (best_ep && best_ep_id < fwnode_ep.id))
+			continue;
+
+		/* Replace the one we had with the newly found one. */
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
index 3789ec755fb6..f3d924092890 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -304,6 +304,25 @@ struct fwnode_handle *
 fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
 			     u32 endpoint);
 
+/**
+ * enum fwnode_graph_get_endpoint_flags - Flags for finding an endpoint
+ *
+ * @FWNODE_GRAPH_ENDPOINT_NEXT: if no specified endpoint is found, obtain the
+ *				smallest endpoint number greater than specified
+ * @FWNODE_GRAPH_DEVICE_DISABLED that the device to which the remote
+ *				 endpoint of the given endpoint belongs to,
+ *				 may be disabled
+ */
+enum fwnode_graph_get_endpoint_flags {
+	FWNODE_GRAPH_ENDPOINT_NEXT	= 0x00000001,
+	FWNODE_GRAPH_DEVICE_DISABLED	= 0x00000002,
+};
+
+struct fwnode_handle *
+fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
+				u32 port, u32 endpoint,
+				enum fwnode_graph_get_endpoint_flags flags);
+
 #define fwnode_graph_for_each_endpoint(fwnode, child)			\
 	for (child = NULL;						\
 	     (child = fwnode_graph_get_next_endpoint(fwnode, child)); )
-- 
2.11.0
