From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/7] arm-cci: Abstract out the PMU counter details
Date: Tue,  5 May 2015 12:49:04 +0100
Message-ID: <1430826548-29960-4-git-send-email-suzuki.poulose@arm.com>
References: <1430826548-29960-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430826548-29960-1-git-send-email-suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>

Adds the PMU model specific counters to the PMU model
abstraction to make it easier to add a new PMU.

The patch cleans up the naming convention used all over
the code.
e.g, CCI_PMU_MAX_HW_EVENTS =3D> maximum number of events that
can be counted at any time, which is in fact the maximum
number of counters available.

Change all such namings to use 'counters' instead of events.

This patch also abstracts the following:

1) Size of a PMU event counter area.
2) Maximum number of programmable counters supported by the PMU model
3) Number of counters which counts fixed events (e.g, cycle
  counter on CCI-400).

Also changes some of the static allocation of the data
structures to dynamic, to accommodate the number of events
supported by a PMU.

Gets rid ofthe CCI_PMU_* defines for the model. All such
data should be accessed via the model abstraction.

Limits the number of counters to the maximum supported
by the 'model'.

Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 drivers/bus/arm-cci.c |  123 +++++++++++++++++++++++++++++++++++++--------=
----
 1 file changed, 93 insertions(+), 30 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 27cc200..82d5681 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -77,15 +77,17 @@ static const struct of_device_id arm_cci_matches[] =3D =
{
=20
 #define CCI_PMU_OVRFLW_FLAG=091
=20
-#define CCI_PMU_CNTR_BASE(idx)=09((idx) * SZ_4K)
-
-#define CCI_PMU_CNTR_MASK=09((1ULL << 32) -1)
+#define CCI_PMU_CNTR_SIZE(model)=09((model)->cntr_size)
+#define CCI_PMU_CNTR_BASE(model, idx)=09((idx) * CCI_PMU_CNTR_SIZE(model))
+#define CCI_PMU_CNTR_MASK=09=09((1ULL << 32) -1)
+#define CCI_PMU_CNTR_LAST(cci_pmu)=09(cci_pmu->num_cntrs - 1)
=20
 #define CCI_PMU_EVENT_MASK=09=090xffUL
 #define CCI_PMU_EVENT_SOURCE(event)=09((event >> 5) & 0x7)
 #define CCI_PMU_EVENT_CODE(event)=09(event & 0x1f)
=20
-#define CCI_PMU_MAX_HW_EVENTS 5   /* CCI PMU has 4 counters + 1 cycle coun=
ter */
+#define CCI_PMU_MAX_HW_CNTRS(model) \
+=09((model)->num_hw_cntrs + (model)->fixed_hw_cntrs)
=20
 /* Types of interfaces that can generate events */
 enum {
@@ -100,13 +102,22 @@ struct event_range {
 };
=20
 struct cci_pmu_hw_events {
-=09struct perf_event *events[CCI_PMU_MAX_HW_EVENTS];
-=09unsigned long used_mask[BITS_TO_LONGS(CCI_PMU_MAX_HW_EVENTS)];
+=09struct perf_event **events;
+=09unsigned long *used_mask;
 =09raw_spinlock_t pmu_lock;
 };
=20
+/*
+ * struct cci_pmu_model:
+ * @fixed_hw_cntrs - Number of fixed event counters
+ * @num_hw_cntrs - Maximum number of programmable event counters
+ * @cntr_size - Size of an event counter mapping
+ */
 struct cci_pmu_model {
 =09char *name;
+=09u32 fixed_hw_cntrs;
+=09u32 num_hw_cntrs;
+=09u32 cntr_size;
 =09struct event_range event_ranges[CCI_IF_MAX];
 };
=20
@@ -116,12 +127,12 @@ struct cci_pmu {
 =09void __iomem *base;
 =09struct pmu pmu;
 =09int nr_irqs;
-=09int irqs[CCI_PMU_MAX_HW_EVENTS];
+=09int *irqs;
 =09unsigned long active_irqs;
 =09const struct cci_pmu_model *model;
 =09struct cci_pmu_hw_events hw_events;
 =09struct platform_device *plat_device;
-=09int num_events;
+=09int num_cntrs;
 =09atomic_t active_events;
 =09struct mutex reserve_mutex;
 =09struct notifier_block cpu_nb;
@@ -155,7 +166,6 @@ enum cci400_perf_events {
=20
 #define CCI_PMU_CYCLE_CNTR_IDX=09=090
 #define CCI_PMU_CNTR0_IDX=09=091
-#define CCI_PMU_CNTR_LAST(cci_pmu)=09(CCI_PMU_CYCLE_CNTR_IDX + cci_pmu->nu=
m_events - 1)
=20
 /*
  * CCI PMU event id is an 8-bit value made of two parts - bits 7:5 for one=
 of 8
@@ -235,20 +245,20 @@ static const struct cci_pmu_model *probe_cci_model(st=
ruct platform_device *pdev)
=20
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
 {
-=09return CCI_PMU_CYCLE_CNTR_IDX <=3D idx &&
-=09=09idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);
+=09return 0 <=3D idx && idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);
 }
=20
 static u32 pmu_read_register(struct cci_pmu *cci_pmu, int idx, unsigned in=
t offset)
 {
-=09return readl_relaxed(cci_pmu->base + CCI_PMU_CNTR_BASE(idx) + offset);
+=09return readl_relaxed(cci_pmu->base +
+=09=09=09     CCI_PMU_CNTR_BASE(cci_pmu->model, idx) + offset);
 }
=20
 static void pmu_write_register(struct cci_pmu *cci_pmu, u32 value,
 =09=09=09       int idx, unsigned int offset)
 {
 =09return writel_relaxed(value, cci_pmu->base +
-=09=09=09      CCI_PMU_CNTR_BASE(idx) + offset);
+=09=09=09      CCI_PMU_CNTR_BASE(cci_pmu->model, idx) + offset);
 }
=20
 static void pmu_disable_counter(struct cci_pmu *cci_pmu, int idx)
@@ -266,13 +276,14 @@ static void pmu_set_event(struct cci_pmu *cci_pmu, in=
t idx, unsigned long event)
 =09pmu_write_register(cci_pmu, event, idx, CCI_PMU_EVT_SEL);
 }
=20
+/*
+ * Returns the number of programmable counters actually implemented
+ * by the cci
+ */
 static u32 pmu_get_max_counters(void)
 {
-=09u32 n_cnts =3D (readl_relaxed(cci_ctrl_base + CCI_PMCR) &
-=09=09      CCI_PMCR_NCNT_MASK) >> CCI_PMCR_NCNT_SHIFT;
-
-=09/* add 1 for cycle counter */
-=09return n_cnts + 1;
+=09return (readl_relaxed(cci_ctrl_base + CCI_PMCR) &
+=09=09CCI_PMCR_NCNT_MASK) >> CCI_PMCR_NCNT_SHIFT;
 }
=20
 static int pmu_get_event_idx(struct cci_pmu_hw_events *hw, struct perf_eve=
nt *event)
@@ -496,7 +507,7 @@ static void cci_pmu_enable(struct pmu *pmu)
 {
 =09struct cci_pmu *cci_pmu =3D to_cci_pmu(pmu);
 =09struct cci_pmu_hw_events *hw_events =3D &cci_pmu->hw_events;
-=09int enabled =3D bitmap_weight(hw_events->used_mask, cci_pmu->num_events=
);
+=09int enabled =3D bitmap_weight(hw_events->used_mask, cci_pmu->num_cntrs)=
;
 =09unsigned long flags;
 =09u32 val;
=20
@@ -659,13 +670,16 @@ static int
 validate_group(struct perf_event *event)
 {
 =09struct perf_event *sibling, *leader =3D event->group_leader;
+=09struct cci_pmu  *cci_pmu =3D to_cci_pmu(event->pmu);
+=09unsigned long mask[BITS_TO_LONGS(cci_pmu->num_cntrs)];
 =09struct cci_pmu_hw_events fake_pmu =3D {
 =09=09/*
 =09=09 * Initialise the fake PMU. We only need to populate the
 =09=09 * used_mask for the purposes of validation.
 =09=09 */
-=09=09.used_mask =3D  { 0 },
+=09=09.used_mask =3D mask,
 =09};
+=09memset(mask, 0, BITS_TO_LONGS(cci_pmu->num_cntrs) * sizeof(unsigned lon=
g));
=20
 =09if (!validate_event(event->pmu, &fake_pmu, leader))
 =09=09return -EINVAL;
@@ -819,6 +833,7 @@ static const struct attribute_group *pmu_attr_groups[] =
=3D {
 static int cci_pmu_init(struct cci_pmu *cci_pmu, struct platform_device *p=
dev)
 {
 =09char *name =3D cci_pmu->model->name;
+=09u32 num_cntrs;
=20
 =09pmu_cpumask_attr.var =3D cci_pmu;
 =09cci_pmu->pmu =3D (struct pmu) {
@@ -836,7 +851,15 @@ static int cci_pmu_init(struct cci_pmu *cci_pmu, struc=
t platform_device *pdev)
 =09};
=20
 =09cci_pmu->plat_device =3D pdev;
-=09cci_pmu->num_events =3D pmu_get_max_counters();
+=09num_cntrs =3D pmu_get_max_counters();
+=09if (num_cntrs > cci_pmu->model->num_hw_cntrs) {
+=09=09dev_warn(&pdev->dev,
+=09=09=09"PMU implements more counters(%d) than supported by"
+=09=09=09" the model(%d), truncated.",
+=09=09=09num_cntrs, cci_pmu->model->num_hw_cntrs);
+=09=09num_cntrs =3D cci_pmu->model->num_hw_cntrs;
+=09}
+=09cci_pmu->num_cntrs =3D num_cntrs + cci_pmu->model->fixed_hw_cntrs;
=20
 =09return perf_pmu_register(&cci_pmu->pmu, name, -1);
 }
@@ -871,6 +894,9 @@ static int cci_pmu_cpu_notifier(struct notifier_block *=
self,
 static struct cci_pmu_model cci_pmu_models[] =3D {
 =09[CCI_REV_R0] =3D {
 =09=09.name =3D "CCI_400",
+=09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
+=09=09.num_hw_cntrs =3D 4,
+=09=09.cntr_size =3D SZ_4K,
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
 =09=09=09=09CCI_REV_R0_SLAVE_PORT_MIN_EV,
@@ -884,6 +910,9 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09},
 =09[CCI_REV_R1] =3D {
 =09=09.name =3D "CCI_400_r1",
+=09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
+=09=09.num_hw_cntrs =3D 4,
+=09=09.cntr_size =3D SZ_4K,
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
 =09=09=09=09CCI_REV_R1_SLAVE_PORT_MIN_EV,
@@ -938,35 +967,69 @@ static bool is_duplicate_irq(int irq, int *irqs, int =
nr_irqs)
 =09return false;
 }
=20
-static int cci_pmu_probe(struct platform_device *pdev)
+static struct cci_pmu *cci_pmu_alloc(struct platform_device *pdev)
 {
-=09struct resource *res;
 =09struct cci_pmu *cci_pmu;
-=09int i, ret, irq;
 =09const struct cci_pmu_model *model;
=20
+=09/*
+=09 * All allocations are devm_* hence we don't have to free
+=09 * them explicitly on an error, as it would end up in driver
+=09 * detach.
+=09 */
 =09model =3D get_cci_model(pdev);
 =09if (!model) {
 =09=09dev_warn(&pdev->dev, "CCI PMU version not supported\n");
-=09=09return -ENODEV;
+=09=09return ERR_PTR(-ENODEV);
 =09}
=20
 =09cci_pmu =3D devm_kzalloc(&pdev->dev, sizeof(*cci_pmu), GFP_KERNEL);
 =09if (!cci_pmu)
-=09=09return -ENOMEM;
+=09=09return ERR_PTR(-ENOMEM);
=20
 =09cci_pmu->model =3D model;
+=09cci_pmu->irqs =3D devm_kcalloc(&pdev->dev, CCI_PMU_MAX_HW_CNTRS(model),
+=09=09=09=09=09sizeof(*cci_pmu->irqs), GFP_KERNEL);
+=09if (!cci_pmu->irqs)
+=09=09return ERR_PTR(-ENOMEM);
+=09cci_pmu->hw_events.events =3D devm_kcalloc(&pdev->dev,
+=09=09=09=09=09     CCI_PMU_MAX_HW_CNTRS(model),
+=09=09=09=09=09     sizeof(*cci_pmu->hw_events.events),
+=09=09=09=09=09     GFP_KERNEL);
+=09if (!cci_pmu->hw_events.events)
+=09=09return ERR_PTR(-ENOMEM);
+=09cci_pmu->hw_events.used_mask =3D devm_kcalloc(&pdev->dev,
+=09=09=09=09=09=09BITS_TO_LONGS(CCI_PMU_MAX_HW_CNTRS(model)),
+=09=09=09=09=09=09sizeof(*cci_pmu->hw_events.used_mask),
+=09=09=09=09=09=09GFP_KERNEL);
+=09if (!cci_pmu->hw_events.used_mask)
+=09=09return ERR_PTR(-ENOMEM);
+
+=09return cci_pmu;
+}
+
+
+static int cci_pmu_probe(struct platform_device *pdev)
+{
+=09struct resource *res;
+=09struct cci_pmu *cci_pmu;
+=09int i, ret, irq;
+
+=09cci_pmu =3D cci_pmu_alloc(pdev);
+=09if (IS_ERR(cci_pmu))
+=09=09return PTR_ERR(cci_pmu);
+
 =09res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
 =09cci_pmu->base =3D devm_ioremap_resource(&pdev->dev, res);
 =09if (IS_ERR(cci_pmu->base))
 =09=09return -ENOMEM;
=20
 =09/*
-=09 * CCI PMU has 5 overflow signals - one per counter; but some may be ti=
ed
+=09 * CCI PMU has one overflow interrupt per counter; but some may be tied
 =09 * together to a common interrupt.
 =09 */
 =09cci_pmu->nr_irqs =3D 0;
-=09for (i =3D 0; i < CCI_PMU_MAX_HW_EVENTS; i++) {
+=09for (i =3D 0; i < CCI_PMU_MAX_HW_CNTRS(cci_pmu->model); i++) {
 =09=09irq =3D platform_get_irq(pdev, i);
 =09=09if (irq < 0)
 =09=09=09break;
@@ -981,9 +1044,9 @@ static int cci_pmu_probe(struct platform_device *pdev)
 =09 * Ensure that the device tree has as many interrupts as the number
 =09 * of counters.
 =09 */
-=09if (i < CCI_PMU_MAX_HW_EVENTS) {
+=09if (i < CCI_PMU_MAX_HW_CNTRS(cci_pmu->model)) {
 =09=09dev_warn(&pdev->dev, "In-correct number of interrupts: %d, should be=
 %d\n",
-=09=09=09i, CCI_PMU_MAX_HW_EVENTS);
+=09=09=09i, CCI_PMU_MAX_HW_CNTRS(cci_pmu->model));
 =09=09return -EINVAL;
 =09}
=20
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
