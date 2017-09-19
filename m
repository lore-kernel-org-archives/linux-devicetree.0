From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/2] device property: Add a macro for interating over graph endpoints
Date: Tue, 19 Sep 2017 12:39:12 +0300
Message-ID: <20170919093912.32356-3-sakari.ailus@linux.intel.com>
References: <20170919093912.32356-1-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20170919093912.32356-1-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, mika.westerberg@linux.intel.com, rafael@kernel.org, hverkuil@xs4all.nl
List-Id: devicetree@vger.kernel.org

Add a convenience macro for iterating over graph endpoints. Iterating over
graph endpoints using fwnode_graph_get_next_endpoint() is a recurring
pattern, and this macro allows calling that function in a slightly more
convenient way. For instance,

	for (child = NULL;
	     (child = fwnode_graph_get_next_endpoint(fwnode, child)); )

becomes

	fwnode_graph_for_each_endpoint(fwnode, child)

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/property.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/property.h b/include/linux/property.h
index 42069c20caee..f6189a3ac63c 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -293,6 +293,10 @@ struct fwnode_handle *
 fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
 			     u32 endpoint);
 
+#define fwnode_graph_for_each_endpoint(fwnode, child)			\
+	for (child = NULL;						\
+	     (child = fwnode_graph_get_next_endpoint(fwnode, child)); )
+
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
-- 
2.11.0

