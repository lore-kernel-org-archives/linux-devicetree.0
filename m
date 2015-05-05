From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 4/7] arm-cci: Abstract handling for CCI events
Date: Tue,  5 May 2015 12:49:05 +0100
Message-ID: <1430826548-29960-5-git-send-email-suzuki.poulose@arm.com>
References: <1430826548-29960-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430826548-29960-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Will Deacon <will.deacon@arm.com>, arm@kernel.org, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

Given that each CCI has different set of interfaces and
its associated events, it is good to abstract the validation of the
event codes to make it easier to add support for a new CCI model.

This patch also abstracts the mapping of a given event to a counter,
as there are some special counters for certain specific events.

We assume that the fixed hardware counters are always at the beginning,
so that we can use cci_model->fixed_hw_events as an upper bound to given
idx to check if we need to program the counter for an event.

Cc: Punit Agrawal <punit.agrawal@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 drivers/bus/arm-cci.c |   78 ++++++++++++++++++++++++++++++++++-----------=
----
 1 file changed, 55 insertions(+), 23 deletions(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 82d5681..4b9a8d3 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -107,6 +107,7 @@ struct cci_pmu_hw_events {
 =09raw_spinlock_t pmu_lock;
 };
=20
+struct cci_pmu;
 /*
  * struct cci_pmu_model:
  * @fixed_hw_cntrs - Number of fixed event counters
@@ -119,6 +120,8 @@ struct cci_pmu_model {
 =09u32 num_hw_cntrs;
 =09u32 cntr_size;
 =09struct event_range event_ranges[CCI_IF_MAX];
+=09int (*validate_hw_event)(struct cci_pmu *, unsigned long);
+=09int (*get_event_idx)(struct cci_pmu *, struct cci_pmu_hw_events *, unsi=
gned long);
 };
=20
 static struct cci_pmu_model cci_pmu_models[];
@@ -189,7 +192,29 @@ enum cci400_perf_events {
 #define CCI_REV_R1_MASTER_PORT_MIN_EV=090x00
 #define CCI_REV_R1_MASTER_PORT_MAX_EV=090x11
=20
-static int pmu_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw=
_event)
+static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
+=09=09=09=09struct cci_pmu_hw_events *hw,
+=09=09=09=09unsigned long cci_event)
+{
+=09int idx;
+
+=09/* cycles event idx is fixed */
+=09if (cci_event =3D=3D CCI_PMU_CYCLES) {
+=09=09if (test_and_set_bit(CCI_PMU_CYCLE_CNTR_IDX, hw->used_mask))
+=09=09=09return -EAGAIN;
+
+=09=09return CCI_PMU_CYCLE_CNTR_IDX;
+=09}
+
+=09for (idx =3D CCI_PMU_CNTR0_IDX; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu); ++=
idx)
+=09=09if (!test_and_set_bit(idx, hw->used_mask))
+=09=09=09return idx;
+
+=09/* No counters available */
+=09return -EAGAIN;
+}
+
+static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long=
 hw_event)
 {
 =09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
 =09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
@@ -198,6 +223,9 @@ static int pmu_validate_hw_event(struct cci_pmu *cci_pm=
u, unsigned long hw_event
 =09if (hw_event & ~CCI_PMU_EVENT_MASK)
 =09=09return -ENOENT;
=20
+=09if (hw_event =3D=3D CCI_PMU_CYCLES)
+=09=09return hw_event;
+
 =09switch (ev_source) {
 =09case CCI_PORT_S0:
 =09case CCI_PORT_S1:
@@ -289,18 +317,14 @@ static u32 pmu_get_max_counters(void)
 static int pmu_get_event_idx(struct cci_pmu_hw_events *hw, struct perf_eve=
nt *event)
 {
 =09struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
-=09struct hw_perf_event *hw_event =3D &event->hw;
-=09unsigned long cci_event =3D hw_event->config_base;
+=09unsigned long cci_event =3D event->hw.config_base;
 =09int idx;
=20
-=09if (cci_event =3D=3D CCI_PMU_CYCLES) {
-=09=09if (test_and_set_bit(CCI_PMU_CYCLE_CNTR_IDX, hw->used_mask))
-=09=09=09return -EAGAIN;
+=09if (cci_pmu->model->get_event_idx)
+=09=09return cci_pmu->model->get_event_idx(cci_pmu, hw, cci_event);
=20
-=09=09return CCI_PMU_CYCLE_CNTR_IDX;
-=09}
-
-=09for (idx =3D CCI_PMU_CNTR0_IDX; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu); ++=
idx)
+=09/* Generic code to find an unused idx from the mask */
+=09for(idx =3D 0; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu); idx++)
 =09=09if (!test_and_set_bit(idx, hw->used_mask))
 =09=09=09return idx;
=20
@@ -310,19 +334,13 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events=
 *hw, struct perf_event *ev
=20
 static int pmu_map_event(struct perf_event *event)
 {
-=09int mapping;
-=09unsigned long config =3D event->attr.config;
+=09struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
=20
-=09if (event->attr.type < PERF_TYPE_MAX)
+=09if (event->attr.type < PERF_TYPE_MAX ||
+=09=09=09!cci_pmu->model->validate_hw_event)
 =09=09return -ENOENT;
=20
-=09if (config =3D=3D CCI_PMU_CYCLES)
-=09=09mapping =3D config;
-=09else
-=09=09mapping =3D pmu_validate_hw_event(to_cci_pmu(event->pmu),
-=09=09=09=09=09=09=09config);
-
-=09return mapping;
+=09return=09cci_pmu->model->validate_hw_event(cci_pmu, event->attr.config)=
;
 }
=20
 static int pmu_request_irq(struct cci_pmu *cci_pmu, irq_handler_t handler)
@@ -450,7 +468,7 @@ static irqreturn_t pmu_handle_irq(int irq_num, void *de=
v)
 =09 * This should work regardless of whether we have per-counter overflow
 =09 * interrupt or a combined overflow interrupt.
 =09 */
-=09for (idx =3D CCI_PMU_CYCLE_CNTR_IDX; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu=
); idx++) {
+=09for (idx =3D 0; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu); idx++) {
 =09=09struct perf_event *event =3D events->events[idx];
 =09=09struct hw_perf_event *hw_counter;
=20
@@ -538,6 +556,16 @@ static void cci_pmu_disable(struct pmu *pmu)
 =09raw_spin_unlock_irqrestore(&hw_events->pmu_lock, flags);
 }
=20
+/*
+ * Check if the idx represents a non-programmable counter.
+ * All the fixed event counters are mapped before the programmable
+ * counters.
+ */
+static bool pmu_fixed_hw_idx(struct cci_pmu *cci_pmu, int idx)
+{
+=09return (idx >=3D 0) && (idx < cci_pmu->model->fixed_hw_cntrs);
+}
+
 static void cci_pmu_start(struct perf_event *event, int pmu_flags)
 {
 =09struct cci_pmu *cci_pmu =3D to_cci_pmu(event->pmu);
@@ -562,8 +590,8 @@ static void cci_pmu_start(struct perf_event *event, int=
 pmu_flags)
=20
 =09raw_spin_lock_irqsave(&hw_events->pmu_lock, flags);
=20
-=09/* Configure the event to count, unless you are counting cycles */
-=09if (idx !=3D CCI_PMU_CYCLE_CNTR_IDX)
+=09/* Configure the counter unless you are counting a fixed event */
+=09if (!pmu_fixed_hw_idx(cci_pmu, idx))
 =09=09pmu_set_event(cci_pmu, idx, hwc->config_base);
=20
 =09pmu_event_set_period(event);
@@ -907,6 +935,8 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09=09=09CCI_REV_R0_MASTER_PORT_MAX_EV,
 =09=09=09},
 =09=09},
+=09=09.validate_hw_event =3D cci400_validate_hw_event,
+=09=09.get_event_idx =3D cci400_get_event_idx,
 =09},
 =09[CCI_REV_R1] =3D {
 =09=09.name =3D "CCI_400_r1",
@@ -923,6 +953,8 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09=09=09CCI_REV_R1_MASTER_PORT_MAX_EV,
 =09=09=09},
 =09=09},
+=09=09.validate_hw_event =3D cci400_validate_hw_event,
+=09=09.get_event_idx =3D cci400_get_event_idx,
 =09},
 };
=20
--=20
1.7.9.5
