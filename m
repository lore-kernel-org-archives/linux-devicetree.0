From: Todd Poynor <toddpoynor@gmail.com>
Subject: [PATCH] drivers: base: initcall_debug logs for driver probe times
Date: Tue, 19 Jun 2018 19:39:03 -0700
Message-ID: <20180620023903.242758-1-toddpoynor@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

From: Todd Poynor <toddpoynor@google.com>

Add initcall_debug logs for each driver device probe call, for example:

   probe of a3800000.ramoops returned after 3007 usecs

This replaces the previous code added to report times for deferred
probes.  It also reports OF platform bus device creates that were
formerly lumped together in a single entry for function
of_platform_default_populate_init, as well as helping to annotate other
initcalls that involve device probing.

Signed-off-by: Todd Poynor <toddpoynor@google.com>
---
 drivers/base/dd.c | 50 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 1435d7281c66..56db446a467a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -62,26 +62,6 @@ static bool initcalls_done;
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
@@ -125,11 +105,7 @@ static void deferred_probe_work_func(struct work_struct *work)
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
@@ -527,6 +503,25 @@ static int really_probe(struct device *dev, struct device_driver *drv)
 	return ret;
 }
 
+/*
+ * For initcall_debug, show the driver probe time.
+ */
+static int really_probe_debug(struct device *dev, struct device_driver *drv)
+{
+	ktime_t calltime, delta, rettime;
+	unsigned long long duration;
+	int ret;
+
+	calltime = ktime_get();
+	ret = really_probe(dev, drv);
+	rettime = ktime_get();
+	delta = ktime_sub(rettime, calltime);
+	duration = (unsigned long long) ktime_to_ns(delta) >> 10;
+	printk(KERN_DEBUG "probe of %s returned after %lld usecs\n",
+	       dev_name(dev), duration);
+	return ret;
+}
+
 /**
  * driver_probe_done
  * Determine if the probe sequence is finished or not.
@@ -585,7 +580,10 @@ int driver_probe_device(struct device_driver *drv, struct device *dev)
 		pm_runtime_get_sync(dev->parent);
 
 	pm_runtime_barrier(dev);
-	ret = really_probe(dev, drv);
+	if (initcall_debug && !initcalls_done)
+		ret = really_probe_debug(dev, drv);
+	else
+		ret = really_probe(dev, drv);
 	pm_request_idle(dev);
 
 	if (dev->parent)
-- 
2.18.0.rc1.244.gcf134e6275-goog
