From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [UPDATED] [PATCH 3/5] arm-cci: Get rid of secure transactions for PMU driver
Date: Tue, 17 Mar 2015 09:51:41 +0000
Message-ID: <1426585901-19137-1-git-send-email-suzuki.poulose@arm.com>
References: <1426000735-14375-4-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426000735-14375-4-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Pitre <nico@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene@kernel.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Punit Agrawal <punit.agrawal@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>

A minor change, fixed missplled 'DEPRECATED' in the dev_warn().

Thanks
Suzuki

----8>----
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

Changes since V2:
 - Use 'bool' instead of 'int' for platform_has_secure_cci_access().
   (Suggested-by: Sudeep Holla)

Cc: devicetree@vger.kernel.org
Cc: Punit Agrawal <punit.agrawal@arm.com>
Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Nicolas Pitre <nicolas.pitre@linaro.org>
---
 Documentation/devicetree/bindings/arm/cci.txt |    7 +++--
 arch/arm/include/asm/arm-cci.h                |   42 +++++++++++++++++++++=
++++
 arch/arm64/include/asm/arm-cci.h              |   27 ++++++++++++++++
 drivers/bus/arm-cci.c                         |   17 +++++++++-
 include/linux/arm-cci.h                       |    2 ++
 5 files changed, 92 insertions(+), 3 deletions(-)
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
index 0000000..fe77f7a
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
+ * We don't have a reliable way of detecting whether,
+ * if we have access to secure-only registers, unless
+ * mcpm is registered.
+ */
+static inline bool platform_has_secure_cci_access(void)
+{
+=09return mcpm_is_available();
+}
+
+#else
+static inline bool platform_has_secure_cci_access(void)
+{
+=09return false;
+}
+#endif
+
+#endif
diff --git a/arch/arm64/include/asm/arm-cci.h b/arch/arm64/include/asm/arm-=
cci.h
new file mode 100644
index 0000000..f0b6371
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
+static inline bool platform_has_secure_cci_access(void)
+{
+=09return false;
+}
+
+#endif
diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index f88383e..ecf25b3 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -217,7 +217,9 @@ static int probe_cci_revision(void)
=20
 static const struct cci_pmu_model *probe_cci_model(struct platform_device =
*pdev)
 {
-=09return &cci_pmu_models[probe_cci_revision()];
+=09if (platform_has_secure_cci_access())
+=09=09return &cci_pmu_models[probe_cci_revision()];
+=09return NULL;
 }
=20
 static int pmu_is_valid_counter(struct cci_pmu *cci_pmu, int idx)
@@ -873,6 +875,15 @@ static struct cci_pmu_model cci_pmu_models[] =3D {
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
@@ -883,7 +894,11 @@ static inline const struct cci_pmu_model *get_cci_mode=
l(struct platform_device *
 =09=09=09=09=09=09=09pdev->dev.of_node);
 =09if (!match)
 =09=09return NULL;
+=09if (match->data)
+=09=09return match->data;
=20
+=09dev_warn(&pdev->dev, "DEPRECATED compatible property,"
+=09=09=09 "requires secure access to CCI registers");
 =09return probe_cci_model(pdev);
 }
=20
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
