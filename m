From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH next v11 06/11] device connection: Add fwnode_connection_find_match()
Date: Thu, 29 Aug 2019 17:22:33 +0800
Message-ID: <1567070558-29417-7-git-send-email-chunfeng.yun@mediatek.com>
References: <1567070558-29417-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567070558-29417-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

The fwnode_connection_find_match() function is exactly the
same as device_connection_find_match(), except it takes
struct fwnode_handle as parameter instead of struct device.
That allows locating device connections before the device
entries have been created.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v11: no changes

v10:
  revert changes of v9

v9:
  replace signed-off-by by suggested-by Heikki

v8: no changes

v7:
  rebased on Rafael's tree [1] (after rc4), provided by Heikki

[1] https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/log/?h=linux-next

v6:
  new patch
---
 drivers/base/devcon.c  | 43 ++++++++++++++++++++++++++++++------------
 include/linux/device.h | 10 +++++++---
 2 files changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/base/devcon.c b/drivers/base/devcon.c
index 1d488dc5dd0c..14e2178e09f8 100644
--- a/drivers/base/devcon.c
+++ b/drivers/base/devcon.c
@@ -12,9 +12,6 @@
 static DEFINE_MUTEX(devcon_lock);
 static LIST_HEAD(devcon_list);
 
-typedef void *(*devcon_match_fn_t)(struct device_connection *con, int ep,
-				   void *data);
-
 static void *
 fwnode_graph_devcon_match(struct fwnode_handle *fwnode, const char *con_id,
 			  void *data, devcon_match_fn_t match)
@@ -60,6 +57,34 @@ fwnode_devcon_match(struct fwnode_handle *fwnode, const char *con_id,
 	return NULL;
 }
 
+/**
+ * fwnode_connection_find_match - Find connection from a device node
+ * @fwnode: Device node with the connection
+ * @con_id: Identifier for the connection
+ * @data: Data for the match function
+ * @match: Function to check and convert the connection description
+ *
+ * Find a connection with unique identifier @con_id between @fwnode and another
+ * device node. @match will be used to convert the connection description to
+ * data the caller is expecting to be returned.
+ */
+void *fwnode_connection_find_match(struct fwnode_handle *fwnode,
+				   const char *con_id, void *data,
+				   devcon_match_fn_t match)
+{
+	void *ret;
+
+	if (!fwnode || !match)
+		return NULL;
+
+	ret = fwnode_graph_devcon_match(fwnode, con_id, data, match);
+	if (ret)
+		return ret;
+
+	return fwnode_devcon_match(fwnode, con_id, data, match);
+}
+EXPORT_SYMBOL_GPL(fwnode_connection_find_match);
+
 /**
  * device_connection_find_match - Find physical connection to a device
  * @dev: Device with the connection
@@ -83,15 +108,9 @@ void *device_connection_find_match(struct device *dev, const char *con_id,
 	if (!match)
 		return NULL;
 
-	if (fwnode) {
-		ret = fwnode_graph_devcon_match(fwnode, con_id, data, match);
-		if (ret)
-			return ret;
-
-		ret = fwnode_devcon_match(fwnode, con_id, data, match);
-		if (ret)
-			return ret;
-	}
+	ret = fwnode_connection_find_match(fwnode, con_id, data, match);
+	if (ret)
+		return ret;
 
 	mutex_lock(&devcon_lock);
 
diff --git a/include/linux/device.h b/include/linux/device.h
index 8ae3f4b47293..93626476c9ae 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1009,10 +1009,14 @@ struct device_connection {
 	struct list_head	list;
 };
 
+typedef void *(*devcon_match_fn_t)(struct device_connection *con, int ep,
+				   void *data);
+
+void *fwnode_connection_find_match(struct fwnode_handle *fwnode,
+				   const char *con_id, void *data,
+				   devcon_match_fn_t match);
 void *device_connection_find_match(struct device *dev, const char *con_id,
-				void *data,
-				void *(*match)(struct device_connection *con,
-					       int ep, void *data));
+				   void *data, devcon_match_fn_t match);
 
 struct device *device_connection_find(struct device *dev, const char *con_id);
 
-- 
2.23.0
