From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 2/7] arm-cci: Cleanup PMU driver code
Date: Tue,  5 May 2015 12:49:03 +0100
Message-ID: <1430826548-29960-3-git-send-email-suzuki.poulose@arm.com>
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

This patch gets rid of the global struct cci_pmu variable and makes
the code use the cci_pmu explicitly. Makes code a bit more robust
and reader friendly.

Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 drivers/bus/arm-cci.c |  142 ++++++++++++++++++++++++++++-----------------=
----
 1 file changed, 80 insertions(+), 62 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 941b831..27cc200 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -124,9 +124,9 @@ struct cci_pmu {
 =09int num_events;
 =09atomic_t active_events;
 =09struct mutex reserve_mutex;
+=09struct notifier_block cpu_nb;
 =09cpumask_t cpus;
 };
-static struct cci_pmu *pmu;
=20
 #define to_cci_pmu(c)=09(container_of(c, struct cci_pmu, pmu))
=20
@@ -179,7 +179,7 @@ enum cci400_perf_events {
 #define CCI_REV_R1_MASTER_PORT_MIN_EV=090x00
 #define CCI_REV_R1_MASTER_PORT_MAX_EV=090x11
=20
-static int pmu_validate_hw_event(unsigned long hw_event)
+static int pmu_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw=
_event)
 {
 =09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
 =09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
@@ -207,8 +207,8 @@ static int pmu_validate_hw_event(unsigned long hw_event=
)
 =09=09return -ENOENT;
 =09}
=20
-=09if (ev_code >=3D pmu->model->event_ranges[if_type].min &&
-=09=09ev_code <=3D pmu->model->event_ranges[if_type].max)
+=09if (ev_code >=3D cci_pmu->model->event_ranges[if_type].min &&
+=09=09ev_code <=3D cci_pmu->model->event_ranges[if_type].max)
 =09=09return hw_event;
=20
 =09return -ENOENT;
@@ -239,29 +239,31 @@ static int pmu_is_valid_counter(struct cci_pmu *cci_p=
mu, int idx)
 =09=09idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);
 }
=20
-static u32 pmu_read_register(int idx, unsigned int offset)
+static u32 pmu_read_register(struct cci_pmu *cci_pmu, int idx, unsigned in=
t offset)
 {
-=09return readl_relaxed(pmu->base + CCI_PMU_CNTR_BASE(idx) + offset);
+=09return readl_relaxed(cci_pmu->base + CCI_PMU_CNTR_BASE(idx) + offset);
 }
=20
-static void pmu_write_register(u32 value, int idx, unsigned int offset)
+static void pmu_write_register(struct cci_pmu *cci_pmu, u32 value,
+=09=09=09       int idx, unsigned int offset)
 {
-=09return writel_relaxed(value, pmu->base + CCI_PMU_CNTR_BASE(idx) + offse=
t);
+=09return writel_relaxed(value, cci_pmu->base +
+=09=09=09      CCI_PMU_CNTR_BASE(idx) + offset);
 }
=20
-static void pmu_disable_counter(int idx)
+static void pmu_disable_counter(struct cci_pmu *cci_pmu, int idx)
 {
-=09pmu_write_register(0, idx, CCI_PMU_CNTR_CTRL);
+=09pmu_write_register(cci_pmu, 0, idx, CCI_PMU_CNTR_CTRL);
 }
=20
-static void pmu_enable_counter(int idx)
+static void pmu_enable_counter(struct cci_pmu *cci_pmu, int idx)
 {
-=09pmu_write_register(1, idx, CCI_PMU_CNTR_CTRL);
+=09pmu_write_register(cci_pmu, 1, idx, CCI_PMU_CNTR_CTRL);
 }
=20
-static void pmu_set_event(int idx, unsigned long event)
+static void pmu_set_event(struct cci_pmu *cci_pmu, int idx, unsigned long =
event)
 {
-=09pmu_write_register(event, idx, CCI_PMU_EVT_SEL);
+=09pmu_write_register(cci_pmu, event, idx, CCI_PMU_EVT_SEL);
 }
=20
 static u32 pmu_get_max_counters(void)
@@ -306,7 +308,8 @@ static int pmu_map_event(struct perf_event *event)
 =09if (config =3D=3D CCI_PMU_CYCLES)
 =09=09mapping =3D config;
 =09else
-=09=09mapping =3D pmu_validate_hw_event(config);
+=09=09mapping =3D pmu_validate_hw_event(to_cci_pmu(event->pmu),
+=09=09=09=09=09=09=09config);
=20
 =09return mapping;
 }
@@ -319,7 +322,7 @@ static int pmu_request_irq(struct cci_pmu *cci_pmu, irq=
_handler_t handler)
 =09if (unlikely(!pmu_device))
 =09=09return -ENODEV;
=20
-=09if (pmu->nr_irqs < 1) {
+=09if (cci_pmu->nr_irqs < 1) {
 =09=09dev_err(&pmu_device->dev, "no irqs for CCI PMUs defined\n");
 =09=09return -ENODEV;
 =09}
@@ -331,16 +334,16 @@ static int pmu_request_irq(struct cci_pmu *cci_pmu, i=
rq_handler_t handler)
 =09 *
 =09 * This should allow handling of non-unique interrupt for the counters.
 =09 */
-=09for (i =3D 0; i < pmu->nr_irqs; i++) {
-=09=09int err =3D request_irq(pmu->irqs[i], handler, IRQF_SHARED,
+=09for (i =3D 0; i < cci_pmu->nr_irqs; i++) {
+=09=09int err =3D request_irq(cci_pmu->irqs[i], handler, IRQF_SHARED,
 =09=09=09=09"arm-cci-pmu", cci_pmu);
 =09=09if (err) {
 =09=09=09dev_err(&pmu_device->dev, "unable to request IRQ%d for ARM CCI PM=
U counters\n",
-=09=09=09=09pmu->irqs[i]);
+=09=09=09=09cci_pmu->irqs[i]);
 =09=09=09return err;
 =09=09}
=20
-=09=09set_bit(i, &pmu->active_irqs);
+=09=09set_bit(i, &cci_pmu->active_irqs);
 =09}
=20
 =09return 0;
@@ -350,11 +353,11 @@ static void pmu_free_irq(struct cci_pmu *cci_pmu)
 {
 =09int i;
=20
-=09for (i =3D 0; i < pmu->nr_irqs; i++) {
-=09=09if (!test_and_clear_bit(i, &pmu->active_irqs))
+=09for (i =3D 0; i < cci_pmu->nr_irqs; i++) {
+=09=09if (!test_and_clear_bit(i, &cci_pmu->active_irqs))
 =09=09=09continue;
=20
-=09=09free_irq(pmu->irqs[i], cci_pmu);
+=09=09free_irq(cci_pmu->irqs[i], cci_pmu);
 =09}
 }
=20
@@ -369,7 +372,7 @@ static u32 pmu_read_counter(struct perf_event *event)
 =09=09dev_err(&cci_pmu->plat_device->dev, "Invalid CCI PMU counter %d\n", =
idx);
 =09=09return 0;
 =09}
-=09value =3D pmu_read_register(idx, CCI_PMU_CNTR);
+=09value =3D pmu_read_register(cci_pmu, idx, CCI_PMU_CNTR);
=20
 =09return value;
 }
@@ -383,7 +386,7 @@ static void pmu_write_counter(struct perf_event *event,=
 u32 value)
 =09if (unlikely(!pmu_is_valid_counter(cci_pmu, idx)))
 =09=09dev_err(&cci_pmu->plat_device->dev, "Invalid CCI PMU counter %d\n", =
idx);
 =09else
-=09=09pmu_write_register(value, idx, CCI_PMU_CNTR);
+=09=09pmu_write_register(cci_pmu, value, idx, CCI_PMU_CNTR);
 }
=20
 static u64 pmu_event_update(struct perf_event *event)
@@ -427,7 +430,7 @@ static irqreturn_t pmu_handle_irq(int irq_num, void *de=
v)
 {
 =09unsigned long flags;
 =09struct cci_pmu *cci_pmu =3D dev;
-=09struct cci_pmu_hw_events *events =3D &pmu->hw_events;
+=09struct cci_pmu_hw_events *events =3D &cci_pmu->hw_events;
 =09int idx, handled =3D IRQ_NONE;
=20
 =09raw_spin_lock_irqsave(&events->pmu_lock, flags);
@@ -446,11 +449,12 @@ static irqreturn_t pmu_handle_irq(int irq_num, void *=
dev)
 =09=09hw_counter =3D &event->hw;
=20
 =09=09/* Did this counter overflow? */
-=09=09if (!(pmu_read_register(idx, CCI_PMU_OVRFLW) &
+=09=09if (!(pmu_read_register(cci_pmu, idx, CCI_PMU_OVRFLW) &
 =09=09      CCI_PMU_OVRFLW_FLAG))
 =09=09=09continue;
=20
-=09=09pmu_write_register(CCI_PMU_OVRFLW_FLAG, idx, CCI_PMU_OVRFLW);
+=09=09pmu_write_register(cci_pmu, CCI_PMU_OVRFLW_FLAG, idx,
+=09=09=09=09=09=09=09CCI_PMU_OVRFLW);
=20
 =09=09pmu_event_update(event);
 =09=09pmu_event_set_period(event);
@@ -549,10 +553,10 @@ static void cci_pmu_start(struct perf_event *event, i=
nt pmu_flags)
=20
 =09/* Configure the event to count, unless you are counting cycles */
 =09if (idx !=3D CCI_PMU_CYCLE_CNTR_IDX)
-=09=09pmu_set_event(idx, hwc->config_base);
+=09=09pmu_set_event(cci_pmu, idx, hwc->config_base);
=20
 =09pmu_event_set_period(event);
-=09pmu_enable_counter(idx);
+=09pmu_enable_counter(cci_pmu, idx);
=20
 =09raw_spin_unlock_irqrestore(&hw_events->pmu_lock, flags);
 }
@@ -575,7 +579,7 @@ static void cci_pmu_stop(struct perf_event *event, int =
pmu_flags)
 =09 * We always reprogram the counter, so ignore PERF_EF_UPDATE. See
 =09 * cci_pmu_start()
 =09 */
-=09pmu_disable_counter(idx);
+=09pmu_disable_counter(cci_pmu, idx);
 =09pmu_event_update(event);
 =09hwc->state |=3D PERF_HES_STOPPED | PERF_HES_UPTODATE;
 }
@@ -779,20 +783,27 @@ static int cci_pmu_event_init(struct perf_event *even=
t)
 =09return err;
 }
=20
-static ssize_t pmu_attr_cpumask_show(struct device *dev,
+static ssize_t pmu_cpumask_attr_show(struct device *dev,
 =09=09=09=09     struct device_attribute *attr, char *buf)
 {
+=09struct dev_ext_attribute *eattr =3D container_of(attr,
+=09=09=09=09=09struct dev_ext_attribute, attr);
+=09struct cci_pmu *cci_pmu =3D eattr->var;
+
 =09int n =3D scnprintf(buf, PAGE_SIZE - 1, "%*pbl",
-=09=09=09  cpumask_pr_args(&pmu->cpus));
+=09=09=09  cpumask_pr_args(&cci_pmu->cpus));
 =09buf[n++] =3D '\n';
 =09buf[n] =3D '\0';
 =09return n;
 }
=20
-static DEVICE_ATTR(cpumask, S_IRUGO, pmu_attr_cpumask_show, NULL);
+static struct dev_ext_attribute pmu_cpumask_attr =3D {
+=09__ATTR(cpumask, S_IRUGO, pmu_cpumask_attr_show, NULL),
+=09NULL,=09=09/* Populated in cci_pmu_init */
+};
=20
 static struct attribute *pmu_attrs[] =3D {
-=09&dev_attr_cpumask.attr,
+=09&pmu_cpumask_attr.attr.attr,
 =09NULL,
 };
=20
@@ -808,6 +819,8 @@ static const struct attribute_group *pmu_attr_groups[] =
=3D {
 static int cci_pmu_init(struct cci_pmu *cci_pmu, struct platform_device *p=
dev)
 {
 =09char *name =3D cci_pmu->model->name;
+
+=09pmu_cpumask_attr.var =3D cci_pmu;
 =09cci_pmu->pmu =3D (struct pmu) {
 =09=09.name=09=09=3D cci_pmu->model->name,
 =09=09.task_ctx_nr=09=3D perf_invalid_context,
@@ -831,12 +844,14 @@ static int cci_pmu_init(struct cci_pmu *cci_pmu, stru=
ct platform_device *pdev)
 static int cci_pmu_cpu_notifier(struct notifier_block *self,
 =09=09=09=09unsigned long action, void *hcpu)
 {
+=09struct cci_pmu *cci_pmu =3D container_of(self,
+=09=09=09=09=09struct cci_pmu, cpu_nb);
 =09unsigned int cpu =3D (long)hcpu;
 =09unsigned int target;
=20
 =09switch (action & ~CPU_TASKS_FROZEN) {
 =09case CPU_DOWN_PREPARE:
-=09=09if (!cpumask_test_and_clear_cpu(cpu, &pmu->cpus))
+=09=09if (!cpumask_test_and_clear_cpu(cpu, &cci_pmu->cpus))
 =09=09=09break;
 =09=09target =3D cpumask_any_but(cpu_online_mask, cpu);
 =09=09if (target < 0) // UP, last CPU
@@ -845,7 +860,7 @@ static int cci_pmu_cpu_notifier(struct notifier_block *=
self,
 =09=09 * TODO: migrate context once core races on event->ctx have
 =09=09 * been fixed.
 =09=09 */
-=09=09cpumask_set_cpu(target, &pmu->cpus);
+=09=09cpumask_set_cpu(target, &cci_pmu->cpus);
 =09default:
 =09=09break;
 =09}
@@ -853,15 +868,6 @@ static int cci_pmu_cpu_notifier(struct notifier_block =
*self,
 =09return NOTIFY_OK;
 }
=20
-static struct notifier_block cci_pmu_cpu_nb =3D {
-=09.notifier_call=09=3D cci_pmu_cpu_notifier,
-=09/*
-=09 * to migrate uncore events, our notifier should be executed
-=09 * before perf core's notifier.
-=09 */
-=09.priority=09=3D CPU_PRI_PERF + 1,
-};
-
 static struct cci_pmu_model cci_pmu_models[] =3D {
 =09[CCI_REV_R0] =3D {
 =09=09.name =3D "CCI_400",
@@ -935,6 +941,7 @@ static bool is_duplicate_irq(int irq, int *irqs, int nr=
_irqs)
 static int cci_pmu_probe(struct platform_device *pdev)
 {
 =09struct resource *res;
+=09struct cci_pmu *cci_pmu;
 =09int i, ret, irq;
 =09const struct cci_pmu_model *model;
=20
@@ -944,30 +951,30 @@ static int cci_pmu_probe(struct platform_device *pdev=
)
 =09=09return -ENODEV;
 =09}
=20
-=09pmu =3D devm_kzalloc(&pdev->dev, sizeof(*pmu), GFP_KERNEL);
-=09if (!pmu)
+=09cci_pmu =3D devm_kzalloc(&pdev->dev, sizeof(*cci_pmu), GFP_KERNEL);
+=09if (!cci_pmu)
 =09=09return -ENOMEM;
=20
-=09pmu->model =3D model;
+=09cci_pmu->model =3D model;
 =09res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-=09pmu->base =3D devm_ioremap_resource(&pdev->dev, res);
-=09if (IS_ERR(pmu->base))
+=09cci_pmu->base =3D devm_ioremap_resource(&pdev->dev, res);
+=09if (IS_ERR(cci_pmu->base))
 =09=09return -ENOMEM;
=20
 =09/*
 =09 * CCI PMU has 5 overflow signals - one per counter; but some may be ti=
ed
 =09 * together to a common interrupt.
 =09 */
-=09pmu->nr_irqs =3D 0;
+=09cci_pmu->nr_irqs =3D 0;
 =09for (i =3D 0; i < CCI_PMU_MAX_HW_EVENTS; i++) {
 =09=09irq =3D platform_get_irq(pdev, i);
 =09=09if (irq < 0)
 =09=09=09break;
=20
-=09=09if (is_duplicate_irq(irq, pmu->irqs, pmu->nr_irqs))
+=09=09if (is_duplicate_irq(irq, cci_pmu->irqs, cci_pmu->nr_irqs))
 =09=09=09continue;
=20
-=09=09pmu->irqs[pmu->nr_irqs++] =3D irq;
+=09=09cci_pmu->irqs[cci_pmu->nr_irqs++] =3D irq;
 =09}
=20
 =09/*
@@ -980,20 +987,31 @@ static int cci_pmu_probe(struct platform_device *pdev=
)
 =09=09return -EINVAL;
 =09}
=20
-=09raw_spin_lock_init(&pmu->hw_events.pmu_lock);
-=09mutex_init(&pmu->reserve_mutex);
-=09atomic_set(&pmu->active_events, 0);
-=09cpumask_set_cpu(smp_processor_id(), &pmu->cpus);
+=09raw_spin_lock_init(&cci_pmu->hw_events.pmu_lock);
+=09mutex_init(&cci_pmu->reserve_mutex);
+=09atomic_set(&cci_pmu->active_events, 0);
+=09cpumask_set_cpu(smp_processor_id(), &cci_pmu->cpus);
=20
-=09ret =3D register_cpu_notifier(&cci_pmu_cpu_nb);
+=09cci_pmu->cpu_nb =3D (struct notifier_block) {
+=09=09.notifier_call=09=3D cci_pmu_cpu_notifier,
+=09=09/*
+=09=09 * to migrate uncore events, our notifier should be executed
+=09=09 * before perf core's notifier.
+=09=09 */
+=09=09.priority=09=3D CPU_PRI_PERF + 1,
+=09};
+
+=09ret =3D register_cpu_notifier(&cci_pmu->cpu_nb);
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D cci_pmu_init(pmu, pdev);
-=09if (ret)
+=09ret =3D cci_pmu_init(cci_pmu, pdev);
+=09if (ret) {
+=09=09unregister_cpu_notifier(&cci_pmu->cpu_nb);
 =09=09return ret;
+=09}
=20
-=09pr_info("ARM %s PMU driver probed", pmu->model->name);
+=09pr_info("ARM %s PMU driver probed", cci_pmu->model->name);
 =09return 0;
 }
=20
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
