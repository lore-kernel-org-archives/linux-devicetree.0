From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 2/5] arm-cci: Abstract the CCI400 PMU speicific definitions
Date: Wed, 18 Mar 2015 12:24:39 +0000
Message-ID: <1426681482-23118-3-git-send-email-suzuki.poulose@arm.com>
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

CCI400 has different event specifications for PMU, for revsion
0 and revision 1. As of now, we check the revision every single
time before using the parameters for the PMU. This patch abstracts
the details of the pmu models in a struct (cci_pmu_model) and
stores the information in cci_pmu at initialisation time, avoiding
multiple probe operations.

Changes since V2:
 - Cleanup event validation(pmu_validate_hw_event). Get rid of
   helper functions:
=09pmu_is_valid_slave_event
=09pmu_is_valid_master_event

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Punit Agrawal <punit.agrawal@arm.com>
Reviewed-by: Will Deacon <will.deacon@arm.com>
---
 drivers/bus/arm-cci.c |  141 ++++++++++++++++++++++++++++-----------------=
----
 1 file changed, 81 insertions(+), 60 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 5d29ec3..ae3864d 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -79,19 +79,38 @@ static const struct of_device_id arm_cci_matches[] =3D =
{
=20
 #define CCI_PMU_MAX_HW_EVENTS 5   /* CCI PMU has 4 counters + 1 cycle coun=
ter */
=20
+/* Types of interfaces that can generate events */
+enum {
+=09CCI_IF_SLAVE,
+=09CCI_IF_MASTER,
+=09CCI_IF_MAX,
+};
+
+struct event_range {
+=09u32 min;
+=09u32 max;
+};
+
 struct cci_pmu_hw_events {
 =09struct perf_event *events[CCI_PMU_MAX_HW_EVENTS];
 =09unsigned long used_mask[BITS_TO_LONGS(CCI_PMU_MAX_HW_EVENTS)];
 =09raw_spinlock_t pmu_lock;
 };
=20
+struct cci_pmu_model {
+=09char *name;
+=09struct event_range event_ranges[CCI_IF_MAX];
+};
+
+static struct cci_pmu_model cci_pmu_models[];
+
 struct cci_pmu {
 =09void __iomem *base;
 =09struct pmu pmu;
 =09int nr_irqs;
 =09int irqs[CCI_PMU_MAX_HW_EVENTS];
 =09unsigned long active_irqs;
-=09struct pmu_port_event_ranges *port_ranges;
+=09const struct cci_pmu_model *model;
 =09struct cci_pmu_hw_events hw_events;
 =09struct platform_device *plat_device;
 =09int num_events;
@@ -152,53 +171,11 @@ enum cci400_perf_events {
 #define CCI_REV_R1_MASTER_PORT_MIN_EV=090x00
 #define CCI_REV_R1_MASTER_PORT_MAX_EV=090x11
=20
-struct pmu_port_event_ranges {
-=09u8 slave_min;
-=09u8 slave_max;
-=09u8 master_min;
-=09u8 master_max;
-};
-
-static struct pmu_port_event_ranges port_event_range[] =3D {
-=09[CCI_REV_R0] =3D {
-=09=09.slave_min =3D CCI_REV_R0_SLAVE_PORT_MIN_EV,
-=09=09.slave_max =3D CCI_REV_R0_SLAVE_PORT_MAX_EV,
-=09=09.master_min =3D CCI_REV_R0_MASTER_PORT_MIN_EV,
-=09=09.master_max =3D CCI_REV_R0_MASTER_PORT_MAX_EV,
-=09},
-=09[CCI_REV_R1] =3D {
-=09=09.slave_min =3D CCI_REV_R1_SLAVE_PORT_MIN_EV,
-=09=09.slave_max =3D CCI_REV_R1_SLAVE_PORT_MAX_EV,
-=09=09.master_min =3D CCI_REV_R1_MASTER_PORT_MIN_EV,
-=09=09.master_max =3D CCI_REV_R1_MASTER_PORT_MAX_EV,
-=09},
-};
-
-/*
- * Export different PMU names for the different revisions so userspace kno=
ws
- * because the event ids are different
- */
-static char *const pmu_names[] =3D {
-=09[CCI_REV_R0] =3D "CCI_400",
-=09[CCI_REV_R1] =3D "CCI_400_r1",
-};
-
-static int pmu_is_valid_slave_event(u8 ev_code)
-{
-=09return pmu->port_ranges->slave_min <=3D ev_code &&
-=09=09ev_code <=3D pmu->port_ranges->slave_max;
-}
-
-static int pmu_is_valid_master_event(u8 ev_code)
-{
-=09return pmu->port_ranges->master_min <=3D ev_code &&
-=09=09ev_code <=3D pmu->port_ranges->master_max;
-}
-
 static int pmu_validate_hw_event(u8 hw_event)
 {
 =09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
 =09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
+=09int if_type;
=20
 =09switch (ev_source) {
 =09case CCI_PORT_S0:
@@ -207,18 +184,22 @@ static int pmu_validate_hw_event(u8 hw_event)
 =09case CCI_PORT_S3:
 =09case CCI_PORT_S4:
 =09=09/* Slave Interface */
-=09=09if (pmu_is_valid_slave_event(ev_code))
-=09=09=09return hw_event;
+=09=09if_type =3D CCI_IF_SLAVE;
 =09=09break;
 =09case CCI_PORT_M0:
 =09case CCI_PORT_M1:
 =09case CCI_PORT_M2:
 =09=09/* Master Interface */
-=09=09if (pmu_is_valid_master_event(ev_code))
-=09=09=09return hw_event;
+=09=09if_type =3D CCI_IF_MASTER;
 =09=09break;
+=09default:
+=09=09return -ENOENT;
 =09}
=20
+=09if (ev_code >=3D pmu->model->event_ranges[if_type].min &&
+=09=09ev_code <=3D pmu->model->event_ranges[if_type].max)
+=09=09return hw_event;
+
 =09return -ENOENT;
 }
=20
@@ -234,11 +215,9 @@ static int probe_cci_revision(void)
 =09=09return CCI_REV_R1;
 }
=20
-static struct pmu_port_event_ranges *port_range_by_rev(void)
+static const struct cci_pmu_model *probe_cci_model(struct platform_device =
*pdev)
 {
-=09int rev =3D probe_cci_revision();
-
-=09return &port_event_range[rev];
+=09return &cci_pmu_models[probe_cci_revision()];
 }
=20
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
@@ -816,9 +795,9 @@ static const struct attribute_group *pmu_attr_groups[] =
=3D {
=20
 static int cci_pmu_init(struct cci_pmu *cci_pmu, struct platform_device *p=
dev)
 {
-=09char *name =3D pmu_names[probe_cci_revision()];
+=09char *name =3D cci_pmu->model->name;
 =09cci_pmu->pmu =3D (struct pmu) {
-=09=09.name=09=09=3D pmu_names[probe_cci_revision()],
+=09=09.name=09=09=3D cci_pmu->model->name,
 =09=09.task_ctx_nr=09=3D perf_invalid_context,
 =09=09.pmu_enable=09=3D cci_pmu_enable,
 =09=09.pmu_disable=09=3D cci_pmu_disable,
@@ -871,6 +850,35 @@ static struct notifier_block cci_pmu_cpu_nb =3D {
 =09.priority=09=3D CPU_PRI_PERF + 1,
 };
=20
+static struct cci_pmu_model cci_pmu_models[] =3D {
+=09[CCI_REV_R0] =3D {
+=09=09.name =3D "CCI_400",
+=09=09.event_ranges =3D {
+=09=09=09[CCI_IF_SLAVE] =3D {
+=09=09=09=09CCI_REV_R0_SLAVE_PORT_MIN_EV,
+=09=09=09=09CCI_REV_R0_SLAVE_PORT_MAX_EV,
+=09=09=09},
+=09=09=09[CCI_IF_MASTER] =3D {
+=09=09=09=09CCI_REV_R0_MASTER_PORT_MIN_EV,
+=09=09=09=09CCI_REV_R0_MASTER_PORT_MAX_EV,
+=09=09=09},
+=09=09},
+=09},
+=09[CCI_REV_R1] =3D {
+=09=09.name =3D "CCI_400_r1",
+=09=09.event_ranges =3D {
+=09=09=09[CCI_IF_SLAVE] =3D {
+=09=09=09=09CCI_REV_R1_SLAVE_PORT_MIN_EV,
+=09=09=09=09CCI_REV_R1_SLAVE_PORT_MAX_EV,
+=09=09=09},
+=09=09=09[CCI_IF_MASTER] =3D {
+=09=09=09=09CCI_REV_R1_MASTER_PORT_MIN_EV,
+=09=09=09=09CCI_REV_R1_MASTER_PORT_MAX_EV,
+=09=09=09},
+=09=09},
+=09},
+};
+
 static const struct of_device_id arm_cci_pmu_matches[] =3D {
 =09{
 =09=09.compatible =3D "arm,cci-400-pmu",
@@ -878,6 +886,16 @@ static const struct of_device_id arm_cci_pmu_matches[]=
 =3D {
 =09{},
 };
=20
+static inline const struct cci_pmu_model *get_cci_model(struct platform_de=
vice *pdev)
+{
+=09const struct of_device_id *match =3D of_match_node(arm_cci_pmu_matches,
+=09=09=09=09=09=09=09pdev->dev.of_node);
+=09if (!match)
+=09=09return NULL;
+
+=09return probe_cci_model(pdev);
+}
+
 static bool is_duplicate_irq(int irq, int *irqs, int nr_irqs)
 {
 =09int i;
@@ -893,11 +911,19 @@ static int cci_pmu_probe(struct platform_device *pdev=
)
 {
 =09struct resource *res;
 =09int i, ret, irq;
+=09const struct cci_pmu_model *model;
+
+=09model =3D get_cci_model(pdev);
+=09if (!model) {
+=09=09dev_warn(&pdev->dev, "CCI PMU version not supported\n");
+=09=09return -ENODEV;
+=09}
=20
 =09pmu =3D devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
 =09if (!pmu)
 =09=09return -ENOMEM;
=20
+=09pmu->model =3D model;
 =09res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 =09pmu->base =3D devm_ioremap_resource(&pdev->dev, res);
 =09if (IS_ERR(pmu->base))
@@ -929,12 +955,6 @@ static int cci_pmu_probe(struct platform_device *pdev)
 =09=09return -EINVAL;
 =09}
=20
-=09pmu->port_ranges =3D port_range_by_rev();
-=09if (!pmu->port_ranges) {
-=09=09dev_warn(&pdev->dev, "CCI PMU version not supported\n");
-=09=09return -EINVAL;
-=09}
-
 =09raw_spin_lock_init(&pmu->hw_events.pmu_lock);
 =09mutex_init(&pmu->reserve_mutex);
 =09atomic_set(&pmu->active_events, 0);
@@ -948,6 +968,7 @@ static int cci_pmu_probe(struct platform_device *pdev)
 =09if (ret)
 =09=09return ret;
=20
+=09pr_info("ARM %s PMU driver probed", pmu->model->name);
 =09return 0;
 }
=20
--=20
1.7.9.5
