From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 5/7] arm-cci: Sanitise CCI400 PMU driver specific code
Date: Tue,  5 May 2015 12:49:06 +0100
Message-ID: <1430826548-29960-6-git-send-email-suzuki.poulose@arm.com>
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

Rename CCI400 specific defintions from CCI_xxx to CCI400_xxx.

Introduce generic ARM_CCI_PMU to cover common code for handling
the CCI PMU.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 drivers/bus/Kconfig   |    5 ++
 drivers/bus/arm-cci.c |  157 +++++++++++++++++++++++++++++----------------=
----
 2 files changed, 97 insertions(+), 65 deletions(-)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index a1d4af6..be66b7c 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -7,6 +7,10 @@ menu "Bus devices"
 config ARM_CCI
 =09bool
=20
+config ARM_CCI_PMU
+=09bool
+=09select ARM_CCI
+
 config ARM_CCI400_COMMON
 =09bool
 =09select ARM_CCI
@@ -17,6 +21,7 @@ config ARM_CCI400_PMU
 =09depends on ARM || ARM64
 =09depends on HW_PERF_EVENTS
 =09select ARM_CCI400_COMMON
+=09select ARM_CCI_PMU
 =09help
 =09  Support for PMU events monitoring on the ARM CCI cache coherent
 =09  interconnect.
diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 4b9a8d3..2b43cea 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -55,9 +55,9 @@ static const struct of_device_id arm_cci_matches[] =3D {
 =09{},
 };
=20
-#ifdef CONFIG_ARM_CCI400_PMU
+#ifdef CONFIG_ARM_CCI_PMU
=20
-#define DRIVER_NAME=09=09"CCI-400"
+#define DRIVER_NAME=09=09"ARM-CCI"
 #define DRIVER_NAME_PMU=09=09DRIVER_NAME " PMU"
=20
 #define CCI_PMCR=09=090x0100
@@ -82,10 +82,6 @@ static const struct of_device_id arm_cci_matches[] =3D {
 #define CCI_PMU_CNTR_MASK=09=09((1ULL << 32) -1)
 #define CCI_PMU_CNTR_LAST(cci_pmu)=09(cci_pmu->num_cntrs - 1)
=20
-#define CCI_PMU_EVENT_MASK=09=090xffUL
-#define CCI_PMU_EVENT_SOURCE(event)=09((event >> 5) & 0x7)
-#define CCI_PMU_EVENT_CODE(event)=09(event & 0x1f)
-
 #define CCI_PMU_MAX_HW_CNTRS(model) \
 =09((model)->num_hw_cntrs + (model)->fixed_hw_cntrs)
=20
@@ -144,19 +140,29 @@ struct cci_pmu {
=20
 #define to_cci_pmu(c)=09(container_of(c, struct cci_pmu, pmu))
=20
+enum cci_models {
+#ifdef CONFIG_ARM_CCI400_PMU
+=09CCI400_R0,
+=09CCI400_R1,
+#endif
+=09CCI_MODEL_MAX
+};
+
+/* CCI400 PMU Specific definitions */
+
+#ifdef CONFIG_ARM_CCI400_PMU
+
 /* Port ids */
-#define CCI_PORT_S0=090
-#define CCI_PORT_S1=091
-#define CCI_PORT_S2=092
-#define CCI_PORT_S3=093
-#define CCI_PORT_S4=094
-#define CCI_PORT_M0=095
-#define CCI_PORT_M1=096
-#define CCI_PORT_M2=097
-
-#define CCI_REV_R0=09=090
-#define CCI_REV_R1=09=091
-#define CCI_REV_R1_PX=09=095
+#define CCI400_PORT_S0=09=090
+#define CCI400_PORT_S1=09=091
+#define CCI400_PORT_S2=09=092
+#define CCI400_PORT_S3=09=093
+#define CCI400_PORT_S4=09=094
+#define CCI400_PORT_M0=09=095
+#define CCI400_PORT_M1=09=096
+#define CCI400_PORT_M2=09=097
+
+#define CCI400_R1_PX=09=095
=20
 /*
  * Instead of an event id to monitor CCI cycles, a dedicated counter is
@@ -164,11 +170,11 @@ struct cci_pmu {
  * make use of this event in hardware.
  */
 enum cci400_perf_events {
-=09CCI_PMU_CYCLES =3D 0xff
+=09CCI400_PMU_CYCLES =3D 0xff
 };
=20
-#define CCI_PMU_CYCLE_CNTR_IDX=09=090
-#define CCI_PMU_CNTR0_IDX=09=091
+#define CCI400_PMU_CYCLE_CNTR_IDX=090
+#define CCI400_PMU_CNTR0_IDX=09=091
=20
 /*
  * CCI PMU event id is an 8-bit value made of two parts - bits 7:5 for one=
 of 8
@@ -182,15 +188,26 @@ enum cci400_perf_events {
  * the different revisions and are used to validate the event to be monito=
red.
  */
=20
-#define CCI_REV_R0_SLAVE_PORT_MIN_EV=090x00
-#define CCI_REV_R0_SLAVE_PORT_MAX_EV=090x13
-#define CCI_REV_R0_MASTER_PORT_MIN_EV=090x14
-#define CCI_REV_R0_MASTER_PORT_MAX_EV=090x1a
-
-#define CCI_REV_R1_SLAVE_PORT_MIN_EV=090x00
-#define CCI_REV_R1_SLAVE_PORT_MAX_EV=090x14
-#define CCI_REV_R1_MASTER_PORT_MIN_EV=090x00
-#define CCI_REV_R1_MASTER_PORT_MAX_EV=090x11
+#define CCI400_PMU_EVENT_MASK=09=090xffUL
+#define CCI400_PMU_EVENT_SOURCE_SHIFT=095
+#define CCI400_PMU_EVENT_SOURCE_MASK=090x7
+#define CCI400_PMU_EVENT_CODE_SHIFT=090
+#define CCI400_PMU_EVENT_CODE_MASK=090x1f
+#define CCI400_PMU_EVENT_SOURCE(event) \
+=09((event >> CCI400_PMU_EVENT_SOURCE_SHIFT) & \
+=09=09=09CCI400_PMU_EVENT_SOURCE_MASK)
+#define CCI400_PMU_EVENT_CODE(event) \
+=09((event >> CCI400_PMU_EVENT_CODE_SHIFT) & CCI400_PMU_EVENT_CODE_MASK)
+
+#define CCI400_R0_SLAVE_PORT_MIN_EV=090x00
+#define CCI400_R0_SLAVE_PORT_MAX_EV=090x13
+#define CCI400_R0_MASTER_PORT_MIN_EV=090x14
+#define CCI400_R0_MASTER_PORT_MAX_EV=090x1a
+
+#define CCI400_R1_SLAVE_PORT_MIN_EV=090x00
+#define CCI400_R1_SLAVE_PORT_MAX_EV=090x14
+#define CCI400_R1_MASTER_PORT_MIN_EV=090x00
+#define CCI400_R1_MASTER_PORT_MAX_EV=090x11
=20
 static int cci400_get_event_idx(struct cci_pmu *cci_pmu,
 =09=09=09=09struct cci_pmu_hw_events *hw,
@@ -199,14 +216,14 @@ static int cci400_get_event_idx(struct cci_pmu *cci_p=
mu,
 =09int idx;
=20
 =09/* cycles event idx is fixed */
-=09if (cci_event =3D=3D CCI_PMU_CYCLES) {
-=09=09if (test_and_set_bit(CCI_PMU_CYCLE_CNTR_IDX, hw->used_mask))
+=09if (cci_event =3D=3D CCI400_PMU_CYCLES) {
+=09=09if (test_and_set_bit(CCI400_PMU_CYCLE_CNTR_IDX, hw->used_mask))
 =09=09=09return -EAGAIN;
=20
-=09=09return CCI_PMU_CYCLE_CNTR_IDX;
+=09=09return CCI400_PMU_CYCLE_CNTR_IDX;
 =09}
=20
-=09for (idx =3D CCI_PMU_CNTR0_IDX; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu); ++=
idx)
+=09for (idx =3D CCI400_PMU_CNTR0_IDX; idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);=
 ++idx)
 =09=09if (!test_and_set_bit(idx, hw->used_mask))
 =09=09=09return idx;
=20
@@ -216,28 +233,28 @@ static int cci400_get_event_idx(struct cci_pmu *cci_p=
mu,
=20
 static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long=
 hw_event)
 {
-=09u8 ev_source =3D CCI_PMU_EVENT_SOURCE(hw_event);
-=09u8 ev_code =3D CCI_PMU_EVENT_CODE(hw_event);
+=09u8 ev_source =3D CCI400_PMU_EVENT_SOURCE(hw_event);
+=09u8 ev_code =3D CCI400_PMU_EVENT_CODE(hw_event);
 =09int if_type;
=20
-=09if (hw_event & ~CCI_PMU_EVENT_MASK)
+=09if (hw_event & ~CCI400_PMU_EVENT_MASK)
 =09=09return -ENOENT;
=20
-=09if (hw_event =3D=3D CCI_PMU_CYCLES)
+=09if (hw_event =3D=3D CCI400_PMU_CYCLES)
 =09=09return hw_event;
=20
 =09switch (ev_source) {
-=09case CCI_PORT_S0:
-=09case CCI_PORT_S1:
-=09case CCI_PORT_S2:
-=09case CCI_PORT_S3:
-=09case CCI_PORT_S4:
+=09case CCI400_PORT_S0:
+=09case CCI400_PORT_S1:
+=09case CCI400_PORT_S2:
+=09case CCI400_PORT_S3:
+=09case CCI400_PORT_S4:
 =09=09/* Slave Interface */
 =09=09if_type =3D CCI_IF_SLAVE;
 =09=09break;
-=09case CCI_PORT_M0:
-=09case CCI_PORT_M1:
-=09case CCI_PORT_M2:
+=09case CCI400_PORT_M0:
+=09case CCI400_PORT_M1:
+=09case CCI400_PORT_M2:
 =09=09/* Master Interface */
 =09=09if_type =3D CCI_IF_MASTER;
 =09=09break;
@@ -252,24 +269,30 @@ static int cci400_validate_hw_event(struct cci_pmu *c=
ci_pmu, unsigned long hw_ev
 =09return -ENOENT;
 }
=20
-static int probe_cci_revision(void)
+static int probe_cci400_revision(void)
 {
 =09int rev;
 =09rev =3D readl_relaxed(cci_ctrl_base + CCI_PID2) & CCI_PID2_REV_MASK;
 =09rev >>=3D CCI_PID2_REV_SHIFT;
=20
-=09if (rev < CCI_REV_R1_PX)
-=09=09return CCI_REV_R0;
+=09if (rev < CCI400_R1_PX)
+=09=09return CCI400_R0;
 =09else
-=09=09return CCI_REV_R1;
+=09=09return CCI400_R1;
 }
=20
 static const struct cci_pmu_model *probe_cci_model(struct platform_device =
*pdev)
 {
 =09if (platform_has_secure_cci_access())
-=09=09return &cci_pmu_models[probe_cci_revision()];
+=09=09return &cci_pmu_models[probe_cci400_revision()];
+=09return NULL;
+}
+#else=09/* !CONFIG_ARM_CCI400_PMU */
+static inline struct cci_pmu_model *probe_cci_model(struct platform_device=
 *pdev)
+{
 =09return NULL;
 }
+#endif=09/* CONFIG_ARM_CCI400_PMU */
=20
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
 {
@@ -920,57 +943,61 @@ static int cci_pmu_cpu_notifier(struct notifier_block=
 *self,
 }
=20
 static struct cci_pmu_model cci_pmu_models[] =3D {
-=09[CCI_REV_R0] =3D {
+#ifdef CONFIG_ARM_CCI400_PMU
+=09[CCI400_R0] =3D {
 =09=09.name =3D "CCI_400",
 =09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
 =09=09.num_hw_cntrs =3D 4,
 =09=09.cntr_size =3D SZ_4K,
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
-=09=09=09=09CCI_REV_R0_SLAVE_PORT_MIN_EV,
-=09=09=09=09CCI_REV_R0_SLAVE_PORT_MAX_EV,
+=09=09=09=09CCI400_R0_SLAVE_PORT_MIN_EV,
+=09=09=09=09CCI400_R0_SLAVE_PORT_MAX_EV,
 =09=09=09},
 =09=09=09[CCI_IF_MASTER] =3D {
-=09=09=09=09CCI_REV_R0_MASTER_PORT_MIN_EV,
-=09=09=09=09CCI_REV_R0_MASTER_PORT_MAX_EV,
+=09=09=09=09CCI400_R0_MASTER_PORT_MIN_EV,
+=09=09=09=09CCI400_R0_MASTER_PORT_MAX_EV,
 =09=09=09},
 =09=09},
 =09=09.validate_hw_event =3D cci400_validate_hw_event,
 =09=09.get_event_idx =3D cci400_get_event_idx,
 =09},
-=09[CCI_REV_R1] =3D {
+=09[CCI400_R1] =3D {
 =09=09.name =3D "CCI_400_r1",
 =09=09.fixed_hw_cntrs =3D 1,=09/* Cycle counter */
 =09=09.num_hw_cntrs =3D 4,
 =09=09.cntr_size =3D SZ_4K,
 =09=09.event_ranges =3D {
 =09=09=09[CCI_IF_SLAVE] =3D {
-=09=09=09=09CCI_REV_R1_SLAVE_PORT_MIN_EV,
-=09=09=09=09CCI_REV_R1_SLAVE_PORT_MAX_EV,
+=09=09=09=09CCI400_R1_SLAVE_PORT_MIN_EV,
+=09=09=09=09CCI400_R1_SLAVE_PORT_MAX_EV,
 =09=09=09},
 =09=09=09[CCI_IF_MASTER] =3D {
-=09=09=09=09CCI_REV_R1_MASTER_PORT_MIN_EV,
-=09=09=09=09CCI_REV_R1_MASTER_PORT_MAX_EV,
+=09=09=09=09CCI400_R1_MASTER_PORT_MIN_EV,
+=09=09=09=09CCI400_R1_MASTER_PORT_MAX_EV,
 =09=09=09},
 =09=09},
 =09=09.validate_hw_event =3D cci400_validate_hw_event,
 =09=09.get_event_idx =3D cci400_get_event_idx,
 =09},
+#endif
 };
=20
 static const struct of_device_id arm_cci_pmu_matches[] =3D {
+#ifdef CONFIG_ARM_CCI400_PMU
 =09{
 =09=09.compatible =3D "arm,cci-400-pmu",
 =09=09.data=09=3D NULL,
 =09},
 =09{
 =09=09.compatible =3D "arm,cci-400-pmu,r0",
-=09=09.data=09=3D &cci_pmu_models[CCI_REV_R0],
+=09=09.data=09=3D &cci_pmu_models[CCI400_R0],
 =09},
 =09{
 =09=09.compatible =3D "arm,cci-400-pmu,r1",
-=09=09.data=09=3D &cci_pmu_models[CCI_REV_R1],
+=09=09.data=09=3D &cci_pmu_models[CCI400_R1],
 =09},
+#endif
 =09{},
 };
=20
@@ -1145,14 +1172,14 @@ static int __init cci_platform_init(void)
 =09return platform_driver_register(&cci_platform_driver);
 }
=20
-#else /* !CONFIG_ARM_CCI400_PMU */
+#else /* !CONFIG_ARM_CCI_PMU */
=20
 static int __init cci_platform_init(void)
 {
 =09return 0;
 }
=20
-#endif /* CONFIG_ARM_CCI400_PMU */
+#endif /* CONFIG_ARM_CCI_PMU */
=20
 #ifdef CONFIG_ARM_CCI400_PORT_CTRL
=20
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
