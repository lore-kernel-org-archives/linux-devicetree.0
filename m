From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/5] drivers/bus: arm-cci: Add common control interface for ACE ports
Date: Fri, 11 Apr 2014 23:31:48 +0530
Message-ID: <1397239311-27717-3-git-send-email-a.kesavan@samsung.com>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397239311-27717-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

cci_disable_port_by_cpu() can be used to disable an arbitrary
ACE port, but there is no C-callable way to enable an ACE port.
Change cci_disable_port_by_cpu() to cci_control_port_by_cpu()
to allow us to disable and enable a CPU's ACE port.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/bus/arm-cci.c   |   13 +++++++------
 include/linux/arm-cci.h |    7 +++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 5a86da9..5668b40 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -763,10 +763,11 @@ static void notrace cci_port_control(unsigned int port, bool enable)
 }
 
 /**
- * cci_disable_port_by_cpu() - function to disable a CCI port by CPU
+ * cci_control_port_by_cpu() - function to control a CCI port by CPU
  *			       reference
  *
- * @mpidr: mpidr of the CPU whose CCI port should be disabled
+ * @mpidr: mpidr of the CPU whose CCI port should be enabled/disabled
+ * @enable: if true enables the port, if false disables it
  *
  * Disabling a CCI port for a CPU implies disabling the CCI port
  * controlling that CPU cluster. Code disabling CPU CCI ports
@@ -777,20 +778,20 @@ static void notrace cci_port_control(unsigned int port, bool enable)
  *	0 on success
  *	-ENODEV on port look-up failure
  */
-int notrace cci_disable_port_by_cpu(u64 mpidr)
+int notrace cci_control_port_by_cpu(u64 mpidr, bool enable)
 {
 	int cpu;
 	bool is_valid;
 	for (cpu = 0; cpu < nr_cpu_ids; cpu++) {
 		is_valid = cpu_port_is_valid(&cpu_port[cpu]);
 		if (is_valid && cpu_port_match(&cpu_port[cpu], mpidr)) {
-			cci_port_control(cpu_port[cpu].port, false);
+			cci_port_control(cpu_port[cpu].port, enable);
 			return 0;
 		}
 	}
 	return -ENODEV;
 }
-EXPORT_SYMBOL_GPL(cci_disable_port_by_cpu);
+EXPORT_SYMBOL_GPL(cci_control_port_by_cpu);
 
 /**
  * cci_enable_port_for_self() - enable a CCI port for calling CPU
@@ -936,7 +937,7 @@ int notrace __cci_control_port_by_index(u32 port, bool enable)
 	/*
 	 * CCI control for ports connected to CPUS is extremely fragile
 	 * and must be made to go through a specific and controlled
-	 * interface (ie cci_disable_port_by_cpu(); control by general purpose
+	 * interface (ie cci_control_port_by_cpu(); control by general purpose
 	 * indexing is therefore disabled for ACE ports.
 	 */
 	if (ports[port].type == ACE_PORT)
diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
index 79d6edf..c6c3ed0 100644
--- a/include/linux/arm-cci.h
+++ b/include/linux/arm-cci.h
@@ -29,7 +29,7 @@ struct device_node;
 #ifdef CONFIG_ARM_CCI
 extern bool cci_probed(void);
 extern int cci_ace_get_port(struct device_node *dn);
-extern int cci_disable_port_by_cpu(u64 mpidr);
+extern int cci_control_port_by_cpu(u64 mpidr, bool enable);
 extern int __cci_control_port_by_device(struct device_node *dn, bool enable);
 extern int __cci_control_port_by_index(u32 port, bool enable);
 #else
@@ -38,7 +38,10 @@ static inline int cci_ace_get_port(struct device_node *dn)
 {
 	return -ENODEV;
 }
-static inline int cci_disable_port_by_cpu(u64 mpidr) { return -ENODEV; }
+static inline int cci_disable_port_by_cpu(u64 mpidr, bool enable)
+{
+	return -ENODEV;
+}
 static inline int __cci_control_port_by_device(struct device_node *dn,
 					       bool enable)
 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
