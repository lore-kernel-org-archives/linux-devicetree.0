From: Brendan Jackman <brendan.jackman@arm.com>
Subject: [RFC 2/6] cpuidle: Add public funcion to get driver from CPU index
Date: Wed, 24 Aug 2016 14:48:18 +0100
Message-ID: <20160824134822.3591-3-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ulf.hansson@linaro.org, khilman@kernel.org, rjw@rjwysocki.net
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Axel Haslam <ahaslam+renesas@baylibre.com>, devicetree@vger.kernel.org, Marc Titinger <mtitinger+renesas@baylibre.com>, Lina Iyer <lina.iyer@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

This will be used to enable the PSCI driver to get a reference to the
cpuidle driver, in absence of a registered cpuidle_device, in order to
get the idle states that the cpuidle driver init discovered.
---
 drivers/cpuidle/driver.c | 14 +++++++-------
 include/linux/cpuidle.h  |  3 +++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index 9e0ec15..9cb4300 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -24,13 +24,13 @@ DEFINE_SPINLOCK(cpuidle_driver_lock);
 static DEFINE_PER_CPU(struct cpuidle_driver *, cpuidle_drivers);
 
 /**
- * __cpuidle_get_cpu_driver - return the cpuidle driver tied to a CPU.
+ * cpuidle_get_cpu_driver - return the cpuidle driver tied to a CPU.
  * @cpu: the CPU handled by the driver
  *
  * Returns a pointer to struct cpuidle_driver or NULL if no driver has been
  * registered for @cpu.
  */
-static struct cpuidle_driver *__cpuidle_get_cpu_driver(int cpu)
+struct cpuidle_driver *cpuidle_get_cpu_driver(int cpu)
 {
 	return per_cpu(cpuidle_drivers, cpu);
 }
@@ -49,7 +49,7 @@ static inline void __cpuidle_unset_driver(struct cpuidle_driver *drv)
 
 	for_each_cpu(cpu, drv->cpumask) {
 
-		if (drv != __cpuidle_get_cpu_driver(cpu))
+		if (drv != cpuidle_get_cpu_driver(cpu))
 			continue;
 
 		per_cpu(cpuidle_drivers, cpu) = NULL;
@@ -71,7 +71,7 @@ static inline int __cpuidle_set_driver(struct cpuidle_driver *drv)
 
 	for_each_cpu(cpu, drv->cpumask) {
 
-		if (__cpuidle_get_cpu_driver(cpu)) {
+		if (cpuidle_get_cpu_driver(cpu)) {
 			__cpuidle_unset_driver(drv);
 			return -EBUSY;
 		}
@@ -87,13 +87,13 @@ static inline int __cpuidle_set_driver(struct cpuidle_driver *drv)
 static struct cpuidle_driver *cpuidle_curr_driver;
 
 /**
- * __cpuidle_get_cpu_driver - return the global cpuidle driver pointer.
+ * cpuidle_get_cpu_driver - return the global cpuidle driver pointer.
  * @cpu: ignored without the multiple driver support
  *
  * Return a pointer to a struct cpuidle_driver object or NULL if no driver was
  * previously registered.
  */
-static inline struct cpuidle_driver *__cpuidle_get_cpu_driver(int cpu)
+inline struct cpuidle_driver *cpuidle_get_cpu_driver(int cpu)
 {
 	return cpuidle_curr_driver;
 }
@@ -321,7 +321,7 @@ struct cpuidle_driver *cpuidle_get_driver(void)
 	int cpu;
 
 	cpu = get_cpu();
-	drv = __cpuidle_get_cpu_driver(cpu);
+	drv = cpuidle_get_cpu_driver(cpu);
 	put_cpu();
 
 	return drv;
diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
index e32c72b..8435577 100644
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -134,6 +134,7 @@ extern int cpuidle_enter(struct cpuidle_driver *drv,
 extern void cpuidle_reflect(struct cpuidle_device *dev, int index);
 
 extern int cpuidle_register_driver(struct cpuidle_driver *drv);
+extern struct cpuidle_driver *cpuidle_get_cpu_driver(int cpu);
 extern struct cpuidle_driver *cpuidle_get_driver(void);
 extern struct cpuidle_driver *cpuidle_driver_ref(void);
 extern void cpuidle_driver_unref(void);
@@ -168,6 +169,8 @@ static inline int cpuidle_enter(struct cpuidle_driver *drv,
 static inline void cpuidle_reflect(struct cpuidle_device *dev, int index) { }
 static inline int cpuidle_register_driver(struct cpuidle_driver *drv)
 {return -ENODEV; }
+static inline struct cpuidle_driver *cpuidle_get_cpu_driver(int cpu)
+{return NULL; }
 static inline struct cpuidle_driver *cpuidle_get_driver(void) {return NULL; }
 static inline struct cpuidle_driver *cpuidle_driver_ref(void) {return NULL; }
 static inline void cpuidle_driver_unref(void) {}
-- 
2.9.3
