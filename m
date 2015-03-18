From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 1/5] arm-cci: Rearrange code for splitting PMU vs driver code
Date: Wed, 18 Mar 2015 12:24:38 +0000
Message-ID: <1426681482-23118-2-git-send-email-suzuki.poulose@arm.com>
References: <1426681482-23118-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426681482-23118-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: will.deacon@arm.com
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

No functional changes, only code re-arrangements for easier split of the
PMU code vs low level driver code. Extracts the port handling code
to cci_probe_ports().

Change since V2:
 - Removed unnecessary goto. (Suggested-by: Sudeep Holla)

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Nicolas Pitre <nicolas.pitre@linaro.org>
Acked-by: Punit Agrawal <punit.agrawal@arm.com>
---
 drivers/bus/arm-cci.c |  326 ++++++++++++++++++++++++---------------------=
----
 1 file changed, 163 insertions(+), 163 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 68ef6f2..5d29ec3 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -29,42 +29,29 @@
 #include <asm/cacheflush.h>
 #include <asm/smp_plat.h>
=20
-#define DRIVER_NAME=09=09"CCI-400"
-#define DRIVER_NAME_PMU=09=09DRIVER_NAME " PMU"
-
-#define CCI_PORT_CTRL=09=090x0
-#define CCI_CTRL_STATUS=09=090xc
-
-#define CCI_ENABLE_SNOOP_REQ=090x1
-#define CCI_ENABLE_DVM_REQ=090x2
-#define CCI_ENABLE_REQ=09=09(CCI_ENABLE_SNOOP_REQ | CCI_ENABLE_DVM_REQ)
+static void __iomem *cci_ctrl_base;
+static unsigned long cci_ctrl_phys;
=20
 struct cci_nb_ports {
 =09unsigned int nb_ace;
 =09unsigned int nb_ace_lite;
 };
=20
-enum cci_ace_port_type {
-=09ACE_INVALID_PORT =3D 0x0,
-=09ACE_PORT,
-=09ACE_LITE_PORT,
+static const struct cci_nb_ports cci400_ports =3D {
+=09.nb_ace =3D 2,
+=09.nb_ace_lite =3D 3
 };
=20
-struct cci_ace_port {
-=09void __iomem *base;
-=09unsigned long phys;
-=09enum cci_ace_port_type type;
-=09struct device_node *dn;
+static const struct of_device_id arm_cci_matches[] =3D {
+=09{.compatible =3D "arm,cci-400", .data =3D &cci400_ports },
+=09{},
 };
=20
-static struct cci_ace_port *ports;
-static unsigned int nb_cci_ports;
-
-static void __iomem *cci_ctrl_base;
-static unsigned long cci_ctrl_phys;
-
 #ifdef CONFIG_HW_PERF_EVENTS
=20
+#define DRIVER_NAME=09=09"CCI-400"
+#define DRIVER_NAME_PMU=09=09DRIVER_NAME " PMU"
+
 #define CCI_PMCR=09=090x0100
 #define CCI_PID2=09=090x0fe8
=20
@@ -75,6 +62,47 @@ static unsigned long cci_ctrl_phys;
 #define CCI_PID2_REV_MASK=090xf0
 #define CCI_PID2_REV_SHIFT=094
=20
+#define CCI_PMU_EVT_SEL=09=090x000
+#define CCI_PMU_CNTR=09=090x004
+#define CCI_PMU_CNTR_CTRL=090x008
+#define CCI_PMU_OVRFLW=09=090x00c
+
+#define CCI_PMU_OVRFLW_FLAG=091
+
+#define CCI_PMU_CNTR_BASE(idx)=09((idx) * SZ_4K)
+
+#define CCI_PMU_CNTR_MASK=09((1ULL << 32) -1)
+
+#define CCI_PMU_EVENT_MASK=09=090xff
+#define CCI_PMU_EVENT_SOURCE(event)=09((event >> 5) & 0x7)
+#define CCI_PMU_EVENT_CODE(event)=09(event & 0x1f)
+
+#define CCI_PMU_MAX_HW_EVENTS 5   /* CCI PMU has 4 counters + 1 cycle coun=
ter */
+
+struct cci_pmu_hw_events {
+=09struct perf_event *events[CCI_PMU_MAX_HW_EVENTS];
+=09unsigned long used_mask[BITS_TO_LONGS(CCI_PMU_MAX_HW_EVENTS)];
+=09raw_spinlock_t pmu_lock;
+};
+
+struct cci_pmu {
+=09void __iomem *base;
+=09struct pmu pmu;
+=09int nr_irqs;
+=09int irqs[CCI_PMU_MAX_HW_EVENTS];
+=09unsigned long active_irqs;
+=09struct pmu_port_event_ranges *port_ranges;
+=09struct cci_pmu_hw_events hw_events;
+=09struct platform_device *plat_device;
+=09int num_events;
+=09atomic_t active_events;
+=09struct mutex reserve_mutex;
+=09cpumask_t cpus;
+};
+static struct cci_pmu *pmu;
+
+#define to_cci_pmu(c)=09(container_of(c, struct cci_pmu, pmu))
+
 /* Port ids */
 #define CCI_PORT_S0=090
 #define CCI_PORT_S1=091
@@ -89,17 +117,6 @@ static unsigned long cci_ctrl_phys;
 #define CCI_REV_R1=09=091
 #define CCI_REV_R1_PX=09=095
=20
-#define CCI_PMU_EVT_SEL=09=090x000
-#define CCI_PMU_CNTR=09=090x004
-#define CCI_PMU_CNTR_CTRL=090x008
-#define CCI_PMU_OVRFLW=09=090x00c
-
-#define CCI_PMU_OVRFLW_FLAG=091
-
-#define CCI_PMU_CNTR_BASE(idx)=09((idx) * SZ_4K)
-
-#define CCI_PMU_CNTR_MASK=09((1ULL << 32) -1)
-
 /*
  * Instead of an event id to monitor CCI cycles, a dedicated counter is
  * provided. Use 0xff to represent CCI cycles and hope that no future revi=
sions
@@ -109,12 +126,6 @@ enum cci400_perf_events {
 =09CCI_PMU_CYCLES =3D 0xff
 };
=20
-#define CCI_PMU_EVENT_MASK=09=090xff
-#define CCI_PMU_EVENT_SOURCE(event)=09((event >> 5) & 0x7)
-#define CCI_PMU_EVENT_CODE(event)=09(event & 0x1f)
-
-#define CCI_PMU_MAX_HW_EVENTS 5   /* CCI PMU has 4 counters + 1 cycle coun=
ter */
-
 #define CCI_PMU_CYCLE_CNTR_IDX=09=090
 #define CCI_PMU_CNTR0_IDX=09=091
 #define CCI_PMU_CNTR_LAST(cci_pmu)=09(CCI_PMU_CYCLE_CNTR_IDX + cci_pmu->nu=
m_events - 1)
@@ -172,60 +183,6 @@ static char *const pmu_names[] =3D {
 =09[CCI_REV_R1] =3D "CCI_400_r1",
 };
=20
-struct cci_pmu_hw_events {
-=09struct perf_event *events[CCI_PMU_MAX_HW_EVENTS];
-=09unsigned long used_mask[BITS_TO_LONGS(CCI_PMU_MAX_HW_EVENTS)];
-=09raw_spinlock_t pmu_lock;
-};
-
-struct cci_pmu {
-=09void __iomem *base;
-=09struct pmu pmu;
-=09int nr_irqs;
-=09int irqs[CCI_PMU_MAX_HW_EVENTS];
-=09unsigned long active_irqs;
-=09struct pmu_port_event_ranges *port_ranges;
-=09struct cci_pmu_hw_events hw_events;
-=09struct platform_device *plat_device;
-=09int num_events;
-=09atomic_t active_events;
-=09struct mutex reserve_mutex;
-=09cpumask_t cpus;
-};
-static struct cci_pmu *pmu;
-
-#define to_cci_pmu(c)=09(container_of(c, struct cci_pmu, pmu))
-
-static bool is_duplicate_irq(int irq, int *irqs, int nr_irqs)
-{
-=09int i;
-
-=09for (i =3D 0; i < nr_irqs; i++)
-=09=09if (irq =3D=3D irqs[i])
-=09=09=09return true;
-
-=09return false;
-}
-
-static int probe_cci_revision(void)
-{
-=09int rev;
-=09rev =3D readl_relaxed(cci_ctrl_base + CCI_PID2) & CCI_PID2_REV_MASK;
-=09rev >>=3D CCI_PID2_REV_SHIFT;
-
-=09if (rev < CCI_REV_R1_PX)
-=09=09return CCI_REV_R0;
-=09else
-=09=09return CCI_REV_R1;
-}
-
-static struct pmu_port_event_ranges *port_range_by_rev(void)
-{
-=09int rev =3D probe_cci_revision();
-
-=09return &port_event_range[rev];
-}
-
 static int pmu_is_valid_slave_event(u8 ev_code)
 {
 =09return pmu->port_ranges->slave_min <=3D ev_code &&
@@ -265,6 +222,25 @@ static int pmu_validate_hw_event(u8 hw_event)
 =09return -ENOENT;
 }
=20
+static int probe_cci_revision(void)
+{
+=09int rev;
+=09rev =3D readl_relaxed(cci_ctrl_base + CCI_PID2) & CCI_PID2_REV_MASK;
+=09rev >>=3D CCI_PID2_REV_SHIFT;
+
+=09if (rev < CCI_REV_R1_PX)
+=09=09return CCI_REV_R0;
+=09else
+=09=09return CCI_REV_R1;
+}
+
+static struct pmu_port_event_ranges *port_range_by_rev(void)
+{
+=09int rev =3D probe_cci_revision();
+
+=09return &port_event_range[rev];
+}
+
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
 {
 =09return CCI_PMU_CYCLE_CNTR_IDX <=3D idx &&
@@ -902,6 +878,17 @@ static const struct of_device_id arm_cci_pmu_matches[]=
 =3D {
 =09{},
 };
=20
+static bool is_duplicate_irq(int irq, int *irqs, int nr_irqs)
+{
+=09int i;
+
+=09for (i =3D 0; i < nr_irqs; i++)
+=09=09if (irq =3D=3D irqs[i])
+=09=09=09return true;
+
+=09return false;
+}
+
 static int cci_pmu_probe(struct platform_device *pdev)
 {
 =09struct resource *res;
@@ -972,8 +959,65 @@ static int cci_platform_probe(struct platform_device *=
pdev)
 =09return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
 }
=20
+static struct platform_driver cci_pmu_driver =3D {
+=09.driver =3D {
+=09=09   .name =3D DRIVER_NAME_PMU,
+=09=09   .of_match_table =3D arm_cci_pmu_matches,
+=09=09  },
+=09.probe =3D cci_pmu_probe,
+};
+
+static struct platform_driver cci_platform_driver =3D {
+=09.driver =3D {
+=09=09   .name =3D DRIVER_NAME,
+=09=09   .of_match_table =3D arm_cci_matches,
+=09=09  },
+=09.probe =3D cci_platform_probe,
+};
+
+static int __init cci_platform_init(void)
+{
+=09int ret;
+
+=09ret =3D platform_driver_register(&cci_pmu_driver);
+=09if (ret)
+=09=09return ret;
+
+=09return platform_driver_register(&cci_platform_driver);
+}
+
+#else /* !CONFIG_HW_PERF_EVENTS */
+
+static int __init cci_platform_init(void)
+{
+=09return 0;
+}
+
 #endif /* CONFIG_HW_PERF_EVENTS */
=20
+#define CCI_PORT_CTRL=09=090x0
+#define CCI_CTRL_STATUS=09=090xc
+
+#define CCI_ENABLE_SNOOP_REQ=090x1
+#define CCI_ENABLE_DVM_REQ=090x2
+#define CCI_ENABLE_REQ=09=09(CCI_ENABLE_SNOOP_REQ | CCI_ENABLE_DVM_REQ)
+
+enum cci_ace_port_type {
+=09ACE_INVALID_PORT =3D 0x0,
+=09ACE_PORT,
+=09ACE_LITE_PORT,
+};
+
+struct cci_ace_port {
+=09void __iomem *base;
+=09unsigned long phys;
+=09enum cci_ace_port_type type;
+=09struct device_node *dn;
+};
+
+static struct cci_ace_port *ports;
+static unsigned int nb_cci_ports;
+
 struct cpu_port {
 =09u64 mpidr;
 =09u32 port;
@@ -1293,36 +1337,20 @@ int notrace __cci_control_port_by_index(u32 port, b=
ool enable)
 }
 EXPORT_SYMBOL_GPL(__cci_control_port_by_index);
=20
-static const struct cci_nb_ports cci400_ports =3D {
-=09.nb_ace =3D 2,
-=09.nb_ace_lite =3D 3
-};
-
-static const struct of_device_id arm_cci_matches[] =3D {
-=09{.compatible =3D "arm,cci-400", .data =3D &cci400_ports },
-=09{},
-};
-
 static const struct of_device_id arm_cci_ctrl_if_matches[] =3D {
 =09{.compatible =3D "arm,cci-400-ctrl-if", },
 =09{},
 };
=20
-static int cci_probe(void)
+static int cci_probe_ports(struct device_node *np)
 {
 =09struct cci_nb_ports const *cci_config;
 =09int ret, i, nb_ace =3D 0, nb_ace_lite =3D 0;
-=09struct device_node *np, *cp;
+=09struct device_node *cp;
 =09struct resource res;
 =09const char *match_str;
 =09bool is_ace;
=20
-=09np =3D of_find_matching_node(NULL, arm_cci_matches);
-=09if (!np)
-=09=09return -ENODEV;
-
-=09if (!of_device_is_available(np))
-=09=09return -ENODEV;
=20
 =09cci_config =3D of_match_node(arm_cci_matches, np)->data;
 =09if (!cci_config)
@@ -1334,17 +1362,6 @@ static int cci_probe(void)
 =09if (!ports)
 =09=09return -ENOMEM;
=20
-=09ret =3D of_address_to_resource(np, 0, &res);
-=09if (!ret) {
-=09=09cci_ctrl_base =3D ioremap(res.start, resource_size(&res));
-=09=09cci_ctrl_phys =3D=09res.start;
-=09}
-=09if (ret || !cci_ctrl_base) {
-=09=09WARN(1, "unable to ioremap CCI ctrl\n");
-=09=09ret =3D -ENXIO;
-=09=09goto memalloc_err;
-=09}
-
 =09for_each_child_of_node(np, cp) {
 =09=09if (!of_match_node(arm_cci_ctrl_if_matches, cp))
 =09=09=09continue;
@@ -1404,12 +1421,31 @@ static int cci_probe(void)
 =09sync_cache_w(&cpu_port);
 =09__sync_cache_range_w(ports, sizeof(*ports) * nb_cci_ports);
 =09pr_info("ARM CCI driver probed\n");
+
 =09return 0;
+}
=20
-memalloc_err:
+static int cci_probe(void)
+{
+=09int ret;
+=09struct device_node *np;
+=09struct resource res;
=20
-=09kfree(ports);
-=09return ret;
+=09np =3D of_find_matching_node(NULL, arm_cci_matches);
+=09if(!np || !of_device_is_available(np))
+=09=09return -ENODEV;
+
+=09ret =3D of_address_to_resource(np, 0, &res);
+=09if (!ret) {
+=09=09cci_ctrl_base =3D ioremap(res.start, resource_size(&res));
+=09=09cci_ctrl_phys =3D=09res.start;
+=09}
+=09if (ret || !cci_ctrl_base) {
+=09=09WARN(1, "unable to ioremap CCI ctrl\n");
+=09=09return -ENXIO;
+=09}
+
+=09return cci_probe_ports(np);
 }
=20
 static int cci_init_status =3D -EAGAIN;
@@ -1427,42 +1463,6 @@ static int cci_init(void)
 =09return cci_init_status;
 }
=20
-#ifdef CONFIG_HW_PERF_EVENTS
-static struct platform_driver cci_pmu_driver =3D {
-=09.driver =3D {
-=09=09   .name =3D DRIVER_NAME_PMU,
-=09=09   .of_match_table =3D arm_cci_pmu_matches,
-=09=09  },
-=09.probe =3D cci_pmu_probe,
-};
-
-static struct platform_driver cci_platform_driver =3D {
-=09.driver =3D {
-=09=09   .name =3D DRIVER_NAME,
-=09=09   .of_match_table =3D arm_cci_matches,
-=09=09  },
-=09.probe =3D cci_platform_probe,
-};
-
-static int __init cci_platform_init(void)
-{
-=09int ret;
-
-=09ret =3D platform_driver_register(&cci_pmu_driver);
-=09if (ret)
-=09=09return ret;
-
-=09return platform_driver_register(&cci_platform_driver);
-}
-
-#else
-
-static int __init cci_platform_init(void)
-{
-=09return 0;
-}
-
-#endif
 /*
  * To sort out early init calls ordering a helper function is provided to
  * check if the CCI driver has beed initialized. Function check if the dri=
ver
--=20
1.7.9.5
