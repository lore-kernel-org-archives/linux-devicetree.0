From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 05/11] driver core: Add APIs to pause/resume sync state callbacks
Date: Fri, 12 Jul 2019 16:52:38 -0700
Message-ID: <20190712235245.202558-6-saravanak@google.com>
References: <20190712235245.202558-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712235245.202558-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Collins <collinsd@codeaurora.org>, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

When multiple devices are added after kernel init, some suppliers could be
added before their consumer devices get added. In these instances, the
supplier devices could get their sync_state callback called right after
they probe because the consumers haven't had a chance to create device
links to the suppliers.

This change adds APIs to pause/resume sync state callbacks so that when
multiple devices are added, their sync_state callback evaluation can be
postponed to happen after all of them are added.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 40 +++++++++++++++++++++++++++++++++-------
 drivers/of/platform.c  |  5 ++---
 include/linux/device.h |  6 ++++--
 3 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dce97b5f3536..b03e679faea4 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -46,7 +46,8 @@ early_param("sysfs.deprecated", sysfs_deprecated_setup);
 /* Device links support. */
 static LIST_HEAD(wait_for_suppliers);
 static DEFINE_MUTEX(wfs_lock);
-static bool supplier_sync_state_enabled;
+static LIST_HEAD(deferred_sync);
+static unsigned int supplier_sync_state_disabled;
 
 #ifdef CONFIG_SRCU
 static DEFINE_MUTEX(device_links_lock);
@@ -657,17 +658,38 @@ static void __device_links_supplier_sync_state(struct device *dev)
 	dev->state_synced = true;
 }
 
-int device_links_supplier_sync_state(struct device *dev, void *data)
+void device_links_supplier_sync_state_pause(void)
 {
 	device_links_write_lock();
-	__device_links_supplier_sync_state(dev);
+	supplier_sync_state_disabled++;
 	device_links_write_unlock();
-	return 0;
 }
 
-void device_links_supplier_sync_state_enable(void)
+void device_links_supplier_sync_state_resume(void)
 {
-	supplier_sync_state_enabled = true;
+	struct device *dev, *tmp;
+
+	device_links_write_lock();
+	if (!supplier_sync_state_disabled) {
+		WARN(true, "Unmatched sync_state pause/resume!");
+		goto out;
+	}
+	supplier_sync_state_disabled--;
+	if (supplier_sync_state_disabled)
+		goto out;
+
+	list_for_each_entry_safe(dev, tmp, &deferred_sync, links.defer_sync) {
+		__device_links_supplier_sync_state(dev);
+		list_del_init(&dev->links.defer_sync);
+	}
+out:
+	device_links_write_unlock();
+}
+
+static void __device_links_supplier_defer_sync(struct device *sup)
+{
+	if (list_empty(&sup->links.defer_sync))
+		list_add_tail(&sup->links.defer_sync, &deferred_sync);
 }
 
 /**
@@ -715,7 +737,9 @@ void device_links_driver_bound(struct device *dev)
 		WARN_ON(link->status != DL_STATE_CONSUMER_PROBE);
 		WRITE_ONCE(link->status, DL_STATE_ACTIVE);
 
-		if (supplier_sync_state_enabled)
+		if (supplier_sync_state_disabled)
+			__device_links_supplier_defer_sync(link->supplier);
+		else
 			__device_links_supplier_sync_state(link->supplier);
 	}
 
@@ -826,6 +850,7 @@ void device_links_driver_cleanup(struct device *dev)
 		WRITE_ONCE(link->status, DL_STATE_DORMANT);
 	}
 
+	list_del_init(&dev->links.defer_sync);
 	__device_links_no_driver(dev);
 
 	device_links_write_unlock();
@@ -1797,6 +1822,7 @@ void device_initialize(struct device *dev)
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.needs_suppliers);
+	INIT_LIST_HEAD(&dev->links.defer_sync);
 	dev->links.status = DL_DEV_NO_DRIVER;
 }
 EXPORT_SYMBOL_GPL(device_initialize);
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 4d12d6658999..56b718f09929 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -581,6 +581,7 @@ static int __init of_platform_default_populate_init(void)
 		return -ENODEV;
 
 	platform_bus_type.add_links = of_link_to_suppliers;
+	device_links_supplier_sync_state_pause();
 	/*
 	 * Handle certain compatibles explicitly, since we don't want to create
 	 * platform_devices for every node in /reserved-memory with a
@@ -604,9 +605,7 @@ arch_initcall_sync(of_platform_default_populate_init);
 
 static int __init of_platform_sync_state_init(void)
 {
-	device_links_supplier_sync_state_enable();
-	bus_for_each_dev(&platform_bus_type, NULL, NULL,
-			 device_links_supplier_sync_state);
+	device_links_supplier_sync_state_resume();
 	return 0;
 }
 late_initcall_sync(of_platform_sync_state_init);
diff --git a/include/linux/device.h b/include/linux/device.h
index d3c9e70052d8..0ea28cb8c77e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -926,12 +926,14 @@ enum dl_dev_state {
  * @suppliers: List of links to supplier devices.
  * @consumers: List of links to consumer devices.
  * @needs_suppliers: Hook to global list of devices waiting for suppliers.
+ * @defer_sync: Hook to global list of devices that have deferred sync_state.
  * @status: Driver status information.
  */
 struct dev_links_info {
 	struct list_head suppliers;
 	struct list_head consumers;
 	struct list_head needs_suppliers;
+	struct list_head defer_sync;
 	enum dl_dev_state status;
 };
 
@@ -1438,8 +1440,8 @@ struct device_link *device_link_add(struct device *consumer,
 				    struct device *supplier, u32 flags);
 void device_link_del(struct device_link *link);
 void device_link_remove(void *consumer, struct device *supplier);
-int device_links_supplier_sync_state(struct device *dev, void *data);
-void device_links_supplier_sync_state_enable(void);
+void device_links_supplier_sync_state_pause(void);
+void device_links_supplier_sync_state_resume(void);
 void device_link_remove_from_wfs(struct device *consumer);
 
 #ifndef dev_fmt
-- 
2.22.0.510.g264f2c817a-goog
