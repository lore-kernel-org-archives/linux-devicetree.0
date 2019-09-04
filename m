From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v11 1/6] driver core: Add fwnode_to_dev() to look up device
 from fwnode
Date: Wed,  4 Sep 2019 14:11:20 -0700
Message-ID: <20190904211126.47518-2-saravanak@google.com>
References: <20190904211126.47518-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904211126.47518-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

It's often useful to look up a device that corresponds to a fwnode. So
add an API to do that irrespective of the bus on which the device has
been added to.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 7 +++++++
 include/linux/fwnode.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 2db62d98e395..510fabf8918c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2198,6 +2198,10 @@ int device_add(struct device *dev)
 					     BUS_NOTIFY_ADD_DEVICE, dev);
 
 	kobject_uevent(&dev->kobj, KOBJ_ADD);
+
+	if (dev->fwnode && !dev->fwnode->dev)
+		dev->fwnode->dev = dev;
+
 	bus_probe_device(dev);
 	if (parent)
 		klist_add_tail(&dev->p->knode_parent,
@@ -2342,6 +2346,9 @@ void device_del(struct device *dev)
 	kill_device(dev);
 	device_unlock(dev);
 
+	if (dev->fwnode && dev->fwnode->dev == dev)
+		dev->fwnode->dev = NULL;
+
 	/* Notify clients of device removal.  This call must come
 	 * before dpm_sysfs_remove().
 	 */
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index ababd6bc82f3..d8c6d231d577 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -17,6 +17,7 @@ struct device;
 struct fwnode_handle {
 	struct fwnode_handle *secondary;
 	const struct fwnode_operations *ops;
+	struct device *dev;
 };
 
 /**
@@ -123,5 +124,6 @@ struct fwnode_operations {
 		if (fwnode_has_op(fwnode, op))				\
 			(fwnode)->ops->op(fwnode, ## __VA_ARGS__);	\
 	} while (false)
+#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 #endif
-- 
2.23.0.187.g17f5b7556c-goog
