From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 4/5] arm-cci: Split the code for PMU vs driver support
Date: Tue, 10 Mar 2015 15:18:54 +0000
Message-ID: <1426000735-14375-5-git-send-email-suzuki.poulose@arm.com>
References: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426000735-14375-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

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

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Punit Agrawal <punit.agrawal@arm.com>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
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
index 70dff09..581190d 100644
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
@@ -1013,14 +1021,16 @@ static int __init cci_platform_init(void)
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
@@ -1451,6 +1461,12 @@ static int cci_probe_ports(struct device_node *np)
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
