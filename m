From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 3/5] arm: exynos: Add generic cluster power control functions
Date: Fri,  2 May 2014 20:55:31 +0530
Message-ID: <1399044331-15707-1-git-send-email-a.kesavan@samsung.com>
References: <1398528348-21214-4-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398528348-21214-4-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Dave.Martin-5wv7dgnIgG8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inderpal.s-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add generic cluster power control functions for exynos based SoCS
for cluster power up/down and to know the cluster status.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-exynos/common.h   |    3 +++
 arch/arm/mach-exynos/pm.c       |   30 ++++++++++++++++++++++++++++++
 arch/arm/mach-exynos/regs-pmu.h |    6 ++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index a7dbb5f..03b8bb2 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -66,5 +66,8 @@ extern void exynos_sys_powerdown_conf(enum sys_powerdown mode);
 extern void exynos_cpu_powerdown(int cpu);
 extern void exynos_cpu_powerup(int cpu);
 extern int  exynos_cpu_power_state(int cpu);
+extern void exynos_cluster_powerdown(int cluster);
+extern void exynos_cluster_powerup(int cluster);
+extern int  exynos_cluster_power_state(int cluster);
 
 #endif /* __ARCH_ARM_MACH_EXYNOS_COMMON_H */
diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index 6651028..f02d864 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -136,6 +136,36 @@ int exynos_cpu_power_state(int cpu)
 			S5P_CORE_LOCAL_PWR_EN);
 }
 
+/**
+ * exynos_common_powerdown : power down the specified cluster
+ * @cluster : the cluster to power down
+ */
+void exynos_cluster_powerdown(int cluster)
+{
+	__raw_writel(0, EXYNOS_COMMON_CONFIGURATION(cluster));
+}
+
+/**
+ * exynos_cluster_powerup : power up the specified cluster
+ * @cluster : the cluster to power up
+ */
+void exynos_cluster_powerup(int cluster)
+{
+	__raw_writel(S5P_CORE_LOCAL_PWR_EN,
+		     EXYNOS_COMMON_CONFIGURATION(cluster));
+}
+
+/**
+ * exynos_cluster_power_state : returns the power state of the cluster
+ * @cluster : the cluster to retrieve the power state from
+ *
+ */
+int exynos_cluster_power_state(int cluster)
+{
+	return (__raw_readl(EXYNOS_COMMON_STATUS(cluster)) &
+			S5P_CORE_LOCAL_PWR_EN);
+}
+
 /* For Cortex-A9 Diagnostic and Power control register */
 static unsigned int save_arm_register[2];
 
diff --git a/arch/arm/mach-exynos/regs-pmu.h b/arch/arm/mach-exynos/regs-pmu.h
index 0bdfcbc..6685ebf 100644
--- a/arch/arm/mach-exynos/regs-pmu.h
+++ b/arch/arm/mach-exynos/regs-pmu.h
@@ -127,6 +127,12 @@
 #define EXYNOS_ARM_CORE_STATUS(_nr)		\
 			(EXYNOS_ARM_CORE_CONFIGURATION(_nr) + 0x4)
 
+#define EXYNOS_ARM_COMMON_CONFIGURATION		S5P_PMUREG(0x2500)
+#define EXYNOS_COMMON_CONFIGURATION(_nr)	\
+			(EXYNOS_ARM_COMMON_CONFIGURATION + (0x80 * (_nr)))
+#define EXYNOS_COMMON_STATUS(_nr)		\
+			(EXYNOS_COMMON_CONFIGURATION(_nr) + 0x4)
+
 /* Only for EXYNOS4210 */
 #define S5P_CMU_CLKSTOP_LCD1_LOWPWR	S5P_PMUREG(0x1154)
 #define S5P_CMU_RESET_LCD1_LOWPWR	S5P_PMUREG(0x1174)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
