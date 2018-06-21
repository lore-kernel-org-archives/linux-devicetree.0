From: Todd Poynor <toddpoynor@gmail.com>
Subject: [PATCH v2] drivers: base: initcall_debug logs for driver probe times
Date: Wed, 20 Jun 2018 17:35:56 -0700
Message-ID: <20180621003556.65578-1-toddpoynor@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

From: Todd Poynor <toddpoynor@google.com>

Add initcall_debug logs for each driver device probe call, for example:

   probe of a3800000.ramoops returned 1 after 3007 usecs

This replaces the previous code added to report times for deferred
probes.  It also reports OF platform bus device creates that were
formerly lumped together in a single entry for function
of_platform_default_populate_init, as well as helping to annotate other
initcalls that involve device probing.

Remove restriction on printing probe times only during initcalls, since
initcall_debug now continues to show driver timing info past the boot
phase.

Signed-off-by: Todd Poynor <toddpoynor@google.com>
---
 drivers/base/dd.c | 50 +++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

Changes from v1:
* unsigned long long -> s64
* use ktime_to_us() instead of ktime_to_ns with shift
* print probe return value
* drop code that stopped output on end of initcall processing

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 1435d7281c66..6ea9c5cece71 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -53,7 +53,6 @@ static DEFINE_MUTEX(deferred_probe_mutex);
 static LIST_HEAD(deferred_probe_pending_list);
 static LIST_HEAD(deferred_probe_active_list);
 static atomic_t deferred_trigger_count = ATOMIC_INIT(0);
-static bool initcalls_done;
 
 /*
  * In some cases, like suspend to RAM or hibernation, It might be reasonable
@@ -62,26 +61,6 @@ static bool initcalls_done;
  */
 static bool defer_all_probes;
 
-/*
- * For initcall_debug, show the deferred probes executed in late_initcall
- * processing.
- */
-static void deferred_probe_debug(struct device *dev)
-{
-	ktime_t calltime, delta, rettime;
-	unsigned long long duration;
-
-	printk(KERN_DEBUG "deferred probe %s @ %i\n", dev_name(dev),
-	       task_pid_nr(current));
-	calltime = ktime_get();
-	bus_probe_device(dev);
-	rettime = ktime_get();
-	delta = ktime_sub(rettime, calltime);
-	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
-	printk(KERN_DEBUG "deferred probe %s returned after %lld usecs\n",
-	       dev_name(dev), duration);
-}
-
 /*
  * deferred_probe_work_func() - Retry probing devices in the active list.
  */
@@ -125,11 +104,7 @@ static void deferred_probe_work_func(struct work_struct *work)
 		device_pm_move_to_tail(dev);
 
 		dev_dbg(dev, "Retrying from deferred list\n");
-		if (initcall_debug && !initcalls_done)
-			deferred_probe_debug(dev);
-		else
-			bus_probe_device(dev);
-
+		bus_probe_device(dev);
 		mutex_lock(&deferred_probe_mutex);
 
 		put_device(dev);
@@ -237,7 +212,6 @@ static int deferred_probe_initcall(void)
 	driver_deferred_probe_trigger();
 	/* Sort as many dependencies as possible before exiting initcalls */
 	flush_work(&deferred_probe_work);
-	initcalls_done = true;
 	return 0;
 }
 late_initcall(deferred_probe_initcall);
@@ -527,6 +501,23 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 	return ret;
 }
 
+/*
+ * For initcall_debug, show the driver probe time.
+ */
+static int really_probe_debug(struct device *dev, struct device_driver *drv)
+{
+	ktime_t calltime, delta, rettime;
+	int ret;
+
+	calltime = ktime_get();
+	ret = really_probe(dev, drv);
+	rettime = ktime_get();
+	delta = ktime_sub(rettime, calltime);
+	printk(KERN_DEBUG "probe of %s returned %d after %lld usecs\n",
+	       dev_name(dev), ret, (s64) ktime_to_us(delta));
+	return ret;
+}
+
 /**
  * driver_probe_done
  * Determine if the probe sequence is finished or not.
@@ -585,7 +576,10 @@ int driver_probe_device(struct device_driver *drv, struct device *dev)
 		pm_runtime_get_sync(dev->parent);
 
 	pm_runtime_barrier(dev);
-	ret = really_probe(dev, drv);
+	if (initcall_debug)
+		ret = really_probe_debug(dev, drv);
+	else
+		ret = really_probe(dev, drv);
 	pm_request_idle(dev);
 
 	if (dev->parent)
-- 
2.18.0.rc1.244.gcf134e6275-goog
