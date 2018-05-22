Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v4 1/4] base: devcon: add graph parse in device_connection_find_match()
Date: Tue, 22 May 2018 21:01:06 +0900
Message-Id: <1526990469-20739-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: heikki.krogerus@linux.intel.com, hdegoede@redhat.com, andy.shevchenko@gmail.com, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds graph parsing in device_connection_find_match().
The match function will be called with fwnode pointer in struct
device_connection. So, a caller can check the matching by using it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/driver-api/device_connection.rst |  2 +-
 drivers/base/devcon.c                          | 15 +++++++++++++++
 include/linux/device.h                         |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/device_connection.rst b/Documentation/driver-api/device_connection.rst
index affbc556..cc6b1da 100644
--- a/Documentation/driver-api/device_connection.rst
+++ b/Documentation/driver-api/device_connection.rst
@@ -19,7 +19,7 @@ Device connections alone do not create a dependency between the two devices.
 They are only descriptions which are not tied to either of the devices directly.
 A dependency between the two devices exists only if one of the two endpoint
 devices requests a reference to the other. The descriptions themselves can be
-defined in firmware (not yet supported) or they can be built-in.
+defined in firmware or they can be built-in.
 
 Usage
 -----
diff --git a/drivers/base/devcon.c b/drivers/base/devcon.c
index d427e80..374bb39 100644
--- a/drivers/base/devcon.c
+++ b/drivers/base/devcon.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/property.h>
 
 static DEFINE_MUTEX(devcon_lock);
 static LIST_HEAD(devcon_list);
@@ -31,10 +32,24 @@ void *device_connection_find_match(struct device *dev, const char *con_id,
 	struct device_connection *con;
 	void *ret = NULL;
 	int ep;
+	struct device_connection graph;
+	struct fwnode_handle *fwnode_ep;
+	struct fwnode_handle *remote;
 
 	if (!match)
 		return NULL;
 
+	fwnode_graph_for_each_endpoint(dev->fwnode, fwnode_ep) {
+		remote = fwnode_graph_get_remote_port_parent(fwnode_ep);
+		if (!remote)
+			continue;
+
+		graph.fwnode = remote;
+		ret = match(&graph, 0, data);
+		if (!IS_ERR(ret))
+			return ret;
+	}
+
 	mutex_lock(&devcon_lock);
 
 	list_for_each_entry(con, &devcon_list, list) {
diff --git a/include/linux/device.h b/include/linux/device.h
index 0059b99..175907b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -734,11 +734,13 @@ struct device_dma_parameters {
  * struct device_connection - Device Connection Descriptor
  * @endpoint: The names of the two devices connected together
  * @id: Unique identifier for the connection
+ * @fwnode: fwnode pointer for finding a connection from graph
  * @list: List head, private, for internal use only
  */
 struct device_connection {
 	const char		*endpoint[2];
 	const char		*id;
+	struct fwnode_handle	*fwnode;
 	struct list_head	list;
 };
 
-- 
1.9.1
