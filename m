From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 4/5] arm-cci: Split the code for PMU vs driver support
Date: Wed, 18 Mar 2015 12:24:41 +0000
Message-ID: <1426681482-23118-5-git-send-email-suzuki.poulose@arm.com>
References: <1426681482-23118-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426681482-23118-1-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

This patch separates the PMU driver code from the low level
CCI driver code and enables the PMU driver for ARM64.

Introduces config options for both.

 ARM_CCI400_PORT_CTRL=09- controls the low level driver code for
=09=09=09  CCI400 ports.
 ARM_CCI400_PMU =09- controls the PMU driver code
 ARM_CCI400_COMMON =09- Common defintions for CCI400

This patch also changes:
 ARM_CCI - common code for probing the CCI devices. This can be
   used for adding support for newer CCI versions(e.g, CCI-500).

Changes since V2:
  - Make ARM_CCI400_PMU default y (Suggested-by: Sudeep Holla)
Changes since V1 (Suggestions-by: Nicolas Pitre):
  - Renames
=09CONFIG_ARM_CCI400_MCPM =3D> CONFIG_ARM_CCI400_PORT_CTRL
=09CCI400_MCPM_PORTS_DATA =3D> CCI400_PORTS_DATA
  - Select ARM_CCI400_COMMON for ARM_CCI400_PORT_CTRL
  - Better documentation in the git commit log about the ARM_CCI config.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Acked-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/mach-exynos/Kconfig   |    2 +-
 arch/arm/mach-vexpress/Kconfig |    4 ++--
 drivers/bus/Kconfig            |   28 ++++++++++++++++++++++++----
 drivers/bus/arm-cci.c          |   24 ++++++++++++++++++++----
 include/linux/arm-cci.h        |    7 ++++++-
 5 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 603820e..81064cd 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -123,7 +123,7 @@ config SOC_EXYNOS5800
 config EXYNOS5420_MCPM
 =09bool "Exynos5420 Multi-Cluster PM support"
 =09depends on MCPM && SOC_EXYNOS5420
-=09select ARM_CCI
+=09select ARM_CCI400_PORT_CTRL
 =09select ARM_CPU_SUSPEND
 =09help
 =09  This is needed to provide CPU and cluster power management
diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfi=
g
index 3c2509b..daa7ab6 100644
--- a/arch/arm/mach-vexpress/Kconfig
+++ b/arch/arm/mach-vexpress/Kconfig
@@ -53,7 +53,7 @@ config ARCH_VEXPRESS_CORTEX_A5_A9_ERRATA
 config ARCH_VEXPRESS_DCSCB
 =09bool "Dual Cluster System Control Block (DCSCB) support"
 =09depends on MCPM
-=09select ARM_CCI
+=09select ARM_CCI400_PORT_CTRL
 =09help
 =09  Support for the Dual Cluster System Configuration Block (DCSCB).
 =09  This is needed to provide CPU and cluster power management
@@ -71,7 +71,7 @@ config ARCH_VEXPRESS_SPC
 config ARCH_VEXPRESS_TC2_PM
 =09bool "Versatile Express TC2 power management"
 =09depends on MCPM
-=09select ARM_CCI
+=09select ARM_CCI400_PORT_CTRL
 =09select ARCH_VEXPRESS_SPC
 =09select ARM_CPU_SUSPEND
 =09help
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index b99729e..79e297b 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -43,12 +43,32 @@ config OMAP_INTERCONNECT
 =09help
 =09  Driver to enable OMAP interconnect error handling driver.
=20
-config ARM_CCI
-=09bool "ARM CCI driver support"
+config ARM_CCI400_PORT_CTRL
+=09bool
 =09depends on ARM && OF && CPU_V7
+=09select ARM_CCI400_COMMON
+=09help
+=09  Low level power management driver for CCI400 cache coherent
+=09  interconnect for ARM platforms.
+
+config ARM_CCI400_PMU
+=09bool "ARM CCI400 PMU support"
+=09default y
+=09depends on ARM || ARM64
+=09depends on HW_PERF_EVENTS
+=09select ARM_CCI400_COMMON
 =09help
-=09  Driver supporting the CCI cache coherent interconnect for ARM
-=09  platforms.
+=09  Support for PMU events monitoring on the ARM CCI cache coherent
+=09  interconnect.
+
+=09  If unsure, say Y
+
+config ARM_CCI400_COMMON
+=09bool
+=09select ARM_CCI
+
+config ARM_CCI
+=09bool
=20
 config ARM_CCN
 =09bool "ARM CCN driver support"
diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index a23663c..054df84 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -32,6 +32,7 @@
 static void __iomem *cci_ctrl_base;
 static unsigned long cci_ctrl_phys;
=20
+#ifdef CONFIG_ARM_CCI400_PORT_CTRL
 struct cci_nb_ports {
 =09unsigned int nb_ace;
 =09unsigned int nb_ace_lite;
@@ -42,12 +43,19 @@ static const struct cci_nb_ports cci400_ports =3D {
 =09.nb_ace_lite =3D 3
 };
=20
+#define CCI400_PORTS_DATA=09(&cci400_ports)
+#else
+#define CCI400_PORTS_DATA=09(NULL)
+#endif
+
 static const struct of_device_id arm_cci_matches[] =3D {
-=09{.compatible =3D "arm,cci-400", .data =3D &cci400_ports },
+#ifdef CONFIG_ARM_CCI400_COMMON
+=09{.compatible =3D "arm,cci-400", .data =3D CCI400_PORTS_DATA },
+#endif
 =09{},
 };
=20
-#ifdef CONFIG_HW_PERF_EVENTS
+#ifdef CONFIG_ARM_CCI400_PMU
=20
 #define DRIVER_NAME=09=09"CCI-400"
 #define DRIVER_NAME_PMU=09=09DRIVER_NAME " PMU"
@@ -1022,14 +1030,16 @@ static int __init cci_platform_init(void)
 =09return platform_driver_register(&cci_platform_driver);
 }
=20
-#else /* !CONFIG_HW_PERF_EVENTS */
+#else /* !CONFIG_ARM_CCI400_PMU */
=20
 static int __init cci_platform_init(void)
 {
 =09return 0;
 }
=20
-#endif /* CONFIG_HW_PERF_EVENTS */
+#endif /* CONFIG_ARM_CCI400_PMU */
+
+#ifdef CONFIG_ARM_CCI400_PORT_CTRL
=20
 #define CCI_PORT_CTRL=09=090x0
 #define CCI_CTRL_STATUS=09=090xc
@@ -1460,6 +1470,12 @@ static int cci_probe_ports(struct device_node *np)
=20
 =09return 0;
 }
+#else /* !CONFIG_ARM_CCI400_PORT_CTRL */
+static inline int cci_probe_ports(struct device_node *np)
+{
+=09return 0;
+}
+#endif /* CONFIG_ARM_CCI400_PORT_CTRL */
=20
 static int cci_probe(void)
 {
diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
index aede5c7..521ec1f 100644
--- a/include/linux/arm-cci.h
+++ b/include/linux/arm-cci.h
@@ -30,12 +30,16 @@ struct device_node;
=20
 #ifdef CONFIG_ARM_CCI
 extern bool cci_probed(void);
+#else
+static inline bool cci_probed(void) { return false; }
+#endif
+
+#ifdef CONFIG_ARM_CCI400_PORT_CTRL
 extern int cci_ace_get_port(struct device_node *dn);
 extern int cci_disable_port_by_cpu(u64 mpidr);
 extern int __cci_control_port_by_device(struct device_node *dn, bool enabl=
e);
 extern int __cci_control_port_by_index(u32 port, bool enable);
 #else
-static inline bool cci_probed(void) { return false; }
 static inline int cci_ace_get_port(struct device_node *dn)
 {
 =09return -ENODEV;
@@ -51,6 +55,7 @@ static inline int __cci_control_port_by_index(u32 port, b=
ool enable)
 =09return -ENODEV;
 }
 #endif
+
 #define cci_disable_port_by_device(dev) \
 =09__cci_control_port_by_device(dev, false)
 #define cci_enable_port_by_device(dev) \
--=20
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
