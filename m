From: Brendan Jackman <brendan.jackman@arm.com>
Subject: [RFC 1/6] cpuidle: Rename cpuidle_get_{cpu->dev}_driver
Date: Wed, 24 Aug 2016 14:48:17 +0100
Message-ID: <20160824134822.3591-2-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ulf.hansson@linaro.org, khilman@kernel.org, rjw@rjwysocki.net
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Axel Haslam <ahaslam+renesas@baylibre.com>, devicetree@vger.kernel.org, Marc Titinger <mtitinger+renesas@baylibre.com>, Lina Iyer <lina.iyer@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

The current cpuidle_get_cpu_driver takes a cpuidle_device. Rename this
function to cpuidle_get_dev_driver, so that we can create a public
cpuidle_get_cpu_driver that takes a logcal CPU number.
---
 drivers/cpuidle/cpuidle.c | 10 +++++-----
 drivers/cpuidle/driver.c  |  8 ++++----
 drivers/cpuidle/sysfs.c   |  6 +++---
 include/linux/cpuidle.h   |  4 ++--
 kernel/sched/idle.c       |  2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index c73207a..3027a35 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -58,7 +58,7 @@ bool cpuidle_not_available(struct cpuidle_driver *drv,
 int cpuidle_play_dead(void)
 {
 	struct cpuidle_device *dev = __this_cpu_read(cpuidle_devices);
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 	int i;
 
 	if (!drv)
@@ -367,7 +367,7 @@ int cpuidle_enable_device(struct cpuidle_device *dev)
 	if (dev->enabled)
 		return 0;
 
-	drv = cpuidle_get_cpu_driver(dev);
+	drv = cpuidle_get_dev_driver(dev);
 
 	if (!drv || !cpuidle_curr_governor)
 		return -EIO;
@@ -407,7 +407,7 @@ EXPORT_SYMBOL_GPL(cpuidle_enable_device);
  */
 void cpuidle_disable_device(struct cpuidle_device *dev)
 {
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 
 	if (!dev || !dev->enabled)
 		return;
@@ -428,7 +428,7 @@ EXPORT_SYMBOL_GPL(cpuidle_disable_device);
 
 static void __cpuidle_unregister_device(struct cpuidle_device *dev)
 {
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 
 	list_del(&dev->device_list);
 	per_cpu(cpuidle_devices, dev->cpu) = NULL;
@@ -453,7 +453,7 @@ static void __cpuidle_device_init(struct cpuidle_device *dev)
 static int __cpuidle_register_device(struct cpuidle_device *dev)
 {
 	int ret;
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 
 	if (!try_module_get(drv->owner))
 		return -EINVAL;
diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index 389ade4..9e0ec15 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -329,20 +329,20 @@ struct cpuidle_driver *cpuidle_get_driver(void)
 EXPORT_SYMBOL_GPL(cpuidle_get_driver);
 
 /**
- * cpuidle_get_cpu_driver - return the driver registered for a CPU.
+ * cpuidle_get_dev_driver - return the driver registered for a cpuidle device.
  * @dev: a valid pointer to a struct cpuidle_device
  *
  * Returns a struct cpuidle_driver pointer, or NULL if no driver is registered
  * for the CPU associated with @dev.
  */
-struct cpuidle_driver *cpuidle_get_cpu_driver(struct cpuidle_device *dev)
+struct cpuidle_driver *cpuidle_get_dev_driver(struct cpuidle_device *dev)
 {
 	if (!dev)
 		return NULL;
 
-	return __cpuidle_get_cpu_driver(dev->cpu);
+	return cpuidle_get_cpu_driver(dev->cpu);
 }
-EXPORT_SYMBOL_GPL(cpuidle_get_cpu_driver);
+EXPORT_SYMBOL_GPL(cpuidle_get_dev_driver);
 
 /**
  * cpuidle_driver_ref - get a reference to the driver.
diff --git a/drivers/cpuidle/sysfs.c b/drivers/cpuidle/sysfs.c
index 832a2c3..9c35bdd 100644
--- a/drivers/cpuidle/sysfs.c
+++ b/drivers/cpuidle/sysfs.c
@@ -398,7 +398,7 @@ static int cpuidle_add_state_sysfs(struct cpuidle_device *device)
 	int i, ret = -ENOMEM;
 	struct cpuidle_state_kobj *kobj;
 	struct cpuidle_device_kobj *kdev = device->kobj_dev;
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(device);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(device);
 
 	/* state statistics */
 	for (i = 0; i < drv->state_count; i++) {
@@ -433,7 +433,7 @@ error_state:
  */
 static void cpuidle_remove_state_sysfs(struct cpuidle_device *device)
 {
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(device);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(device);
 	int i;
 
 	for (i = 0; i < drv->state_count; i++)
@@ -529,7 +529,7 @@ static int cpuidle_add_driver_sysfs(struct cpuidle_device *dev)
 {
 	struct cpuidle_driver_kobj *kdrv;
 	struct cpuidle_device_kobj *kdev = dev->kobj_dev;
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 	int ret;
 
 	kdrv = kzalloc(sizeof(*kdrv), GFP_KERNEL);
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index bb31373..e32c72b 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -151,7 +151,7 @@ extern int cpuidle_enable_device(struct cpuidle_device *dev);
 extern void cpuidle_disable_device(struct cpuidle_device *dev);
 extern int cpuidle_play_dead(void);
 
-extern struct cpuidle_driver *cpuidle_get_cpu_driver(struct cpuidle_device *dev);
+extern struct cpuidle_driver *cpuidle_get_dev_driver(struct cpuidle_device *dev);
 static inline struct cpuidle_device *cpuidle_get_device(void)
 {return __this_cpu_read(cpuidle_devices); }
 #else
@@ -187,7 +187,7 @@ static inline int cpuidle_enable_device(struct cpuidle_device *dev)
 {return -ENODEV; }
 static inline void cpuidle_disable_device(struct cpuidle_device *dev) { }
 static inline int cpuidle_play_dead(void) {return -ENODEV; }
-static inline struct cpuidle_driver *cpuidle_get_cpu_driver(
+static inline struct cpuidle_driver *cpuidle_get_dev_driver(
 	struct cpuidle_device *dev) {return NULL; }
 static inline struct cpuidle_device *cpuidle_get_device(void) {return NULL; }
 #endif
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 9fb873c..bb34461 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -128,7 +128,7 @@ static int call_cpuidle(struct cpuidle_driver *drv, struct cpuidle_device *dev,
 static void cpuidle_idle_call(void)
 {
 	struct cpuidle_device *dev = cpuidle_get_device();
-	struct cpuidle_driver *drv = cpuidle_get_cpu_driver(dev);
+	struct cpuidle_driver *drv = cpuidle_get_dev_driver(dev);
 	int next_state, entered_state;
 
 	/*
-- 
2.9.3
