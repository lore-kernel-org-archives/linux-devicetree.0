From: "Suzuki K. Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 6/7] arm-cci: Add CCI-500 PMU support
Date: Tue,  5 May 2015 12:49:07 +0100
Message-ID: <1430826548-29960-7-git-send-email-suzuki.poulose@arm.com>
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

CCI-500 provides 8 event counters which can count any of the
supported events independently. The PMU event id is a 9-bit
value made of two parts.
=09bits [8:5] - Source port
=09=09=090x0-0x6 Slave Ports
=09=09=090x8-0xD Master Ports
=09=09=090xf     Global Events to CCI
=09=09=090x7,0xe Reserved
=09bits [0:4] - Event code (specific to each type of port)

The generic CCI-500 controlling interface remains the same with CCI-400.
However there are some differences in the PMU event counters.
 - No cycle counter
 - Upto 8 counters(4 in CCI-400)
 - Each counter area is 64K(4K in CCI400)
 - The counter0 starts at offset 0x10000 from the base of CCI

Cc: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Suzuki K. Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cci.txt |    4 +-
 drivers/bus/Kconfig                           |   12 +++
 drivers/bus/arm-cci.c                         |  133 +++++++++++++++++++++=
++++
 3 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cci.txt b/Documentation/=
devicetree/bindings/arm/cci.txt
index 3c5c631..aef1d20 100644
--- a/Documentation/devicetree/bindings/arm/cci.txt
+++ b/Documentation/devicetree/bindings/arm/cci.txt
@@ -31,8 +31,9 @@ specific to ARM.
 =09- compatible
 =09=09Usage: required
 =09=09Value type: <string>
-=09=09Definition: must be set to
+=09=09Definition: must contain one of the following:
 =09=09=09    "arm,cci-400"
+=09=09=09    "arm,cci-500"
=20
 =09- reg
 =09=09Usage: required
@@ -99,6 +100,7 @@ specific to ARM.
 =09=09=09=09 "arm,cci-400-pmu,r1"
 =09=09=09=09 "arm,cci-400-pmu"  - DEPRECATED, permitted only where OS has
 =09=09=09=09=09=09      secure acces to CCI registers
+=09=09=09=09 "arm,cci-500-pmu,r0"
 =09=09- reg:
 =09=09=09Usage: required
 =09=09=09Value type: Integer cells. A register entry, expressed
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index be66b7c..5fb3150 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -36,6 +36,18 @@ config ARM_CCI400_PORT_CTRL
 =09  Low level power management driver for CCI400 cache coherent
 =09  interconnect for ARM platforms.
=20
+config ARM_CCI500_PMU
+=09bool "ARM CCI500 PMU support"
+=09default y
+=09depends on ARM || ARM64
+=09depends on HW_PERF_EVENTS
+=09select ARM_CCI_PMU
+=09help
+=09  Support for PMU events monitoring on the ARM CCI-500 cache coherent
+=09  interconnect.
+
+=09  If unsure, say Y
+
 config ARM_CCN
 =09bool "ARM CCN driver support"
 =09depends on ARM || ARM64
diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 2b43cea..e12ddba 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -52,6 +52,9 @@ static const struct of_device_id arm_cci_matches[] =3D {
 #ifdef CONFIG_ARM_CCI400_COMMON
 =09{.compatible =3D "arm,cci-400", .data =3D CCI400_PORTS_DATA },
 #endif
+#ifdef CONFIG_ARM_CCI500_PMU
+=09{ .compatible =3D "arm,cci-500", },
+#endif
 =09{},
 };
=20
@@ -89,6 +92,9 @@ static const struct of_device_id arm_cci_matches[] =3D {
 enum {
 =09CCI_IF_SLAVE,
 =09CCI_IF_MASTER,
+#ifdef CONFIG_ARM_CCI500_PMU
+=09CCI_IF_GLOBAL,
+#endif
 =09CCI_IF_MAX,
 };
=20
@@ -145,6 +151,9 @@ enum cci_models {
 =09CCI400_R0,
 =09CCI400_R1,
 #endif
+#ifdef CONFIG_ARM_CCI500_PMU
+=09CCI500_R0,
+#endif
 =09CCI_MODEL_MAX
 };
=20
@@ -294,6 +303,101 @@ static inline struct cci_pmu_model *probe_cci_model(s=
truct platform_device *pdev
 }
 #endif=09/* CONFIG_ARM_CCI400_PMU */
=20
+#ifdef CONFIG_ARM_CCI500_PMU
+
+/*
+ * CCI500 provides 8 independent event counters that can count
+ * any of the events available.
+ *
+ * CCI500 PMU event id is an 9-bit value made of two parts.
+ *=09 bits [8:5] - Source for the event
+ *=09=09      0x0-0x6 - Slave interfaces
+ *=09=09      0x8-0xD - Master interfaces
+ *=09=09      0xf     - Global Events
+ *=09=09      0x7,0xe - Reserved
+ *
+ *=09 bits [4:0] - Event code (specific to type of interface)
+ */
+
+/* Port ids */
+#define CCI500_PORT_S0=09=09=090x0
+#define CCI500_PORT_S1=09=09=090x1
+#define CCI500_PORT_S2=09=09=090x2
+#define CCI500_PORT_S3=09=09=090x3
+#define CCI500_PORT_S4=09=09=090x4
+#define CCI500_PORT_S5=09=09=090x5
+#define CCI500_PORT_S6=09=09=090x6
+
+#define CCI500_PORT_M0=09=09=090x8
+#define CCI500_PORT_M1=09=09=090x9
+#define CCI500_PORT_M2=09=09=090xa
+#define CCI500_PORT_M3=09=09=090xb
+#define CCI500_PORT_M4=09=09=090xc
+#define CCI500_PORT_M5=09=09=090xd
+
+#define CCI500_PORT_GLOBAL =09=090xf
+
+#define CCI500_PMU_EVENT_MASK=09=090x1ffUL
+#define CCI500_PMU_EVENT_SOURCE_SHIFT=090x5
+#define CCI500_PMU_EVENT_SOURCE_MASK=090xf
+#define CCI500_PMU_EVENT_CODE_SHIFT=090x0
+#define CCI500_PMU_EVENT_CODE_MASK=090x1f
+
+#define CCI500_PMU_EVENT_SOURCE(event)=09\
+=09((event >> CCI500_PMU_EVENT_SOURCE_SHIFT) & CCI500_PMU_EVENT_SOURCE_MAS=
K)
+#define CCI500_PMU_EVENT_CODE(event)=09\
+=09((event >> CCI500_PMU_EVENT_CODE_SHIFT) & CCI500_PMU_EVENT_CODE_MASK)
+
+#define CCI500_SLAVE_PORT_MIN_EV=090x00
+#define CCI500_SLAVE_PORT_MAX_EV=090x1f
+#define CCI500_MASTER_PORT_MIN_EV=090x00
+#define CCI500_MASTER_PORT_MAX_EV=090x06
+#define CCI500_GLOBAL_PORT_MIN_EV=090x00
+#define CCI500_GLOBAL_PORT_MAX_EV=090x0f
+
+static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
+=09=09=09=09=09unsigned long hw_event)
+{
+=09u32 ev_source =3D CCI500_PMU_EVENT_SOURCE(hw_event);
+=09u32 ev_code =3D CCI500_PMU_EVENT_CODE(hw_event);
+=09int if_type;
+
+=09if (hw_event & ~CCI500_PMU_EVENT_MASK)
+=09=09return -ENOENT;
+
+=09switch (ev_source) {
+=09case CCI500_PORT_S0:
+=09case CCI500_PORT_S1:
+=09case CCI500_PORT_S2:
+=09case CCI500_PORT_S3:
+=09case CCI500_PORT_S4:
+=09case CCI500_PORT_S5:
+=09case CCI500_PORT_S6:
+=09=09if_type =3D CCI_IF_SLAVE;
+=09=09break;
+=09case CCI500_PORT_M0:
+=09case CCI500_PORT_M1:
+=09case CCI500_PORT_M2:
+=09case CCI500_PORT_M3:
+=09case CCI500_PORT_M4:
+=09case CCI500_PORT_M5:
+=09=09if_type =3D CCI_IF_MASTER;
+=09=09break;
+=09case CCI500_PORT_GLOBAL:
+=09=09if_type =3D CCI_IF_GLOBAL;
+=09=09break;
+=09default:
+=09=09return -ENOENT;
+=09}
+
+=09if (ev_code >=3D cci_pmu->model->event_ranges[if_type].min &&
+=09=09ev_code <=3D cci_pmu->model->event_ranges[if_type].max)
+=09=09return hw_event;
+
+=09return -ENOENT;
+}
+#endif=09/* CONFIG_ARM_CCI500_PMU */
+
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
 {
 =09return 0 <=3D idx && idx <=3D CCI_PMU_CNTR_LAST(cci_pmu);
@@ -981,6 +1085,29 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
 =09=09.get_event_idx =3D cci400_get_event_idx,
 =09},
 #endif
+#ifdef CONFIG_ARM_CCI500_PMU
+=09[CCI500_R0] =3D {
+=09=09.name =3D "CCI_500",
+=09=09.fixed_hw_cntrs =3D 0,
+=09=09.num_hw_cntrs =3D 8,
+=09=09.cntr_size =3D SZ_64K,
+=09=09.event_ranges =3D {
+=09=09=09[CCI_IF_SLAVE] =3D {
+=09=09=09=09CCI500_SLAVE_PORT_MIN_EV,
+=09=09=09=09CCI500_SLAVE_PORT_MAX_EV,
+=09=09=09},
+=09=09=09[CCI_IF_MASTER] =3D {
+=09=09=09=09CCI500_MASTER_PORT_MIN_EV,
+=09=09=09=09CCI500_MASTER_PORT_MAX_EV,
+=09=09=09},
+=09=09=09[CCI_IF_GLOBAL] =3D {
+=09=09=09=09CCI500_GLOBAL_PORT_MIN_EV,
+=09=09=09=09CCI500_GLOBAL_PORT_MAX_EV,
+=09=09=09},
+=09=09},
+=09=09.validate_hw_event =3D cci500_validate_hw_event,
+=09},
+#endif
 };
=20
 static const struct of_device_id arm_cci_pmu_matches[] =3D {
@@ -998,6 +1125,12 @@ static const struct of_device_id arm_cci_pmu_matches[=
] =3D {
 =09=09.data=09=3D &cci_pmu_models[CCI400_R1],
 =09},
 #endif
+#ifdef CONFIG_ARM_CCI500_PMU
+=09{
+=09=09.compatible =3D "arm,cci-500-pmu,r0",
+=09=09.data =3D &cci_pmu_models[CCI500_R0],
+=09},
+#endif
 =09{},
 };
=20
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
