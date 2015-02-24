From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH 2/4] arm-cci: Get rid of secure transactions for PMU driver
Date: Tue, 24 Feb 2015 13:17:41 +0000
Message-ID: <1424783863-9894-3-git-send-email-suzuki.poulose@arm.com>
References: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424783863-9894-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

Avoid secure transactions while probing the CCI PMU. The
existing code makes use of the Peripheral ID2 (PID2) register
to determine the revision of the CCI400, which requires a
secure transaction. This puts a limitation on the usage of the
driver on systems running non-secure Linux(e.g, ARM64).

Updated the device-tree binding for cci pmu node to add the explicit
revision number for the compatible field.

The supported strings are :
=09arm,cci-400-pmu,r0
=09arm,cci-400-pmu,r1
=09arm,cci-400-pmu - DEPRECATED. See NOTE below

NOTE: If the revision is not mentioned, we need to probe the cci revision,
which could be fatal on a platform running non-secure. We need a reliable w=
ay
to know if we can poke the CCI registers at runtime on ARM32. We depend on
'mcpm_is_available()' when it is available. mcpm_is_available() returns tru=
e
only when there is a registered driver for mcpm. Otherwise, we assume that =
we
don't have secure access, and skips probing the revision number(ARM64 case)=
.

The MCPM should figure out if it is safe to access the CCI. Unfortunately
there isn't a reliable way to indicate the same via dtb. This patch doesn't
address/change the current situation. It only deals with the CCI-PMU, leavi=
ng
the assumptions about the secure access as it has been, prior to this patch=
.

Cc: devicetree@vger.kernel.org
Cc: Punit Agrawal <punit.agrawal@arm.com>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 Documentation/devicetree/bindings/arm/cci.txt |    7 +-
 arch/arm/include/asm/arm-cci.h                |   42 ++++++++
 arch/arm64/include/asm/arm-cci.h              |   27 +++++
 drivers/bus/arm-cci.c                         |  138 ++++++++++++++++-----=
----
 include/linux/arm-cci.h                       |    2 +
 5 files changed, 166 insertions(+), 50 deletions(-)
 create mode 100644 arch/arm/include/asm/arm-cci.h
 create mode 100644 arch/arm64/include/asm/arm-cci.h

diff --git a/Documentation/devicetree/bindings/arm/cci.txt b/Documentation/=
devicetree/bindings/arm/cci.txt
index f28d82b..0e4b6a7 100644
--- a/Documentation/devicetree/bindings/arm/cci.txt
+++ b/Documentation/devicetree/bindings/arm/cci.txt
@@ -94,8 +94,11 @@ specific to ARM.
 =09=09- compatible
 =09=09=09Usage: required
 =09=09=09Value type: <string>
-=09=09=09Definition: must be "arm,cci-400-pmu"
-
+=09=09=09Definition: Supported strings are :
+=09=09=09=09 "arm,cci-400-pmu,r0"
+=09=09=09=09 "arm,cci-400-pmu,r1"
+=09=09=09=09 "arm,cci-400-pmu"  - DEPRECATED, permitted only where OS has
+=09=09=09=09=09=09      secure acces to CCI registers
 =09=09- reg:
 =09=09=09Usage: required
 =09=09=09Value type: Integer cells. A register entry, expressed
diff --git a/arch/arm/include/asm/arm-cci.h b/arch/arm/include/asm/arm-cci.=
h
new file mode 100644
index 0000000..b828d7a
--- /dev/null
+++ b/arch/arm/include/asm/arm-cci.h
@@ -0,0 +1,42 @@
+/*
+ * arch/arm/include/asm/arm-cci.h
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_ARM_CCI_H
+#define __ASM_ARM_CCI_H
+
+#ifdef CONFIG_MCPM
+#include <asm/mcpm.h>
+
+/*
+ * We don't have a reliable way of detecting, whether
+ * we have access to secure-only registers, unless
+ * mcpm is registered.
+ */
+static inline int platform_has_secure_cci_access(void)
+{
+=09return mcpm_is_available();
+}
+
+#else
+static inline int platform_has_secure_cci_access(void)
+{
+=09return 0;
+}
+#endif
+
+#endif
diff --git a/arch/arm64/include/asm/arm-cci.h b/arch/arm64/include/asm/arm-=
cci.h
new file mode 100644
index 0000000..37bbe37
--- /dev/null
+++ b/arch/arm64/include/asm/arm-cci.h
@@ -0,0 +1,27 @@
+/*
+ * arch/arm64/include/asm/arm-cci.h
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __ASM_ARM_CCI_H
+#define __ASM_ARM_CCI_H
+
+static inline int platform_has_secure_cci_access(void)
+{
+=09return 0;
+}
+
+#endif
diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index f27cf56..fe9fa46 100644
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
@@ -152,47 +171,16 @@ enum cci400_perf_events {
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
 static int pmu_is_valid_slave_event(u8 ev_code)
 {
-=09return pmu->port_ranges->slave_min <=3D ev_code &&
-=09=09ev_code <=3D pmu->port_ranges->slave_max;
+=09return pmu->model->event_ranges[CCI_IF_SLAVE].min <=3D ev_code &&
+=09=09ev_code <=3D pmu->model->event_ranges[CCI_IF_SLAVE].max;
 }
=20
 static int pmu_is_valid_master_event(u8 ev_code)
 {
-=09return pmu->port_ranges->master_min <=3D ev_code &&
-=09=09ev_code <=3D pmu->port_ranges->master_max;
+=09return pmu->model->event_ranges[CCI_IF_MASTER].min <=3D ev_code &&
+=09=09ev_code <=3D pmu->model->event_ranges[CCI_IF_MASTER].max;
 }
=20
 static int pmu_validate_hw_event(u8 hw_event)
@@ -234,11 +222,11 @@ static int probe_cci_revision(void)
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
+=09if (platform_has_secure_cci_access())
+=09=09return &cci_pmu_models[probe_cci_revision()];
+=09return NULL;
 }
=20
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
@@ -807,9 +795,9 @@ static const struct attribute_group *pmu_attr_groups[] =
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
@@ -862,13 +850,65 @@ static struct notifier_block cci_pmu_cpu_nb =3D {
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
+=09=09.data=09=3D NULL,
+=09},
+=09{
+=09=09.compatible =3D "arm,cci-400-pmu,r0",
+=09=09.data=09=3D &cci_pmu_models[CCI_REV_R0],
+=09},
+=09{
+=09=09.compatible =3D "arm,cci-400-pmu,r1",
+=09=09.data=09=3D &cci_pmu_models[CCI_REV_R1],
 =09},
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
+=09if (match->data)
+=09=09return match->data;
+
+=09dev_warn(&pdev->dev, "DEPERCATED compatible property,"
+=09=09=09 "requires secure access to CCI registers");
+=09return probe_cci_model(pdev);
+}
+
 static bool is_duplicate_irq(int irq, int *irqs, int nr_irqs)
 {
 =09int i;
@@ -884,11 +924,19 @@ static int cci_pmu_probe(struct platform_device *pdev=
)
 {
 =09struct resource *res;
 =09int i, ret, irq;
+=09const struct cci_pmu_model *model;
+
+=09model =3D get_cci_model(pdev);
+=09if (!model) {
+=09=09dev_warn(&pdev->dev, "CCI PMU version not supported\n");
+=09=09return -EINVAL;
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
@@ -920,12 +968,6 @@ static int cci_pmu_probe(struct platform_device *pdev)
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
diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
index 79d6edf..aede5c7 100644
--- a/include/linux/arm-cci.h
+++ b/include/linux/arm-cci.h
@@ -24,6 +24,8 @@
 #include <linux/errno.h>
 #include <linux/types.h>
=20
+#include <asm/arm-cci.h>
+
 struct device_node;
=20
 #ifdef CONFIG_ARM_CCI
--=20
1.7.9.5
