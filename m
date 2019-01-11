From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 2/3] ARM: imx: add i.MX7ULP SoC revision support
Date: Fri, 11 Jan 2019 06:22:50 +0000
Message-ID: <1547187469-14046-2-git-send-email-Anson.Huang@nxp.com>
References: <1547187469-14046-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547187469-14046-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP SoC's revision info is inside the SIM module,
bit[31:28] of JTAG_ID register defines revision as below
from B0:

0001        B0
0010        B1

This patch adds SoC revision support for i.MX7ULP, test
result as below:

root@imx7ulp-evk ~$ cat /sys/devices/soc0/revision
2.1

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/mach-imx/mach-imx7ulp.c | 39 ++++++++++++++++++++++++++++++++++++=
+++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/mach-imx/mach-imx7ulp.c b/arch/arm/mach-imx/mach-imx7=
ulp.c
index 19c5b30..11ac71a 100644
--- a/arch/arm/mach-imx/mach-imx7ulp.c
+++ b/arch/arm/mach-imx/mach-imx7ulp.c
@@ -6,18 +6,57 @@
  */
=20
 #include <linux/irqchip.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
+#include <linux/regmap.h>
 #include <asm/mach/arch.h>
=20
 #include "common.h"
 #include "cpuidle.h"
 #include "hardware.h"
=20
+#define SIM_JTAG_ID_REG		0x8c
+
+static void __init imx7ulp_set_revision(void)
+{
+	struct regmap *sim;
+	u32 revision;
+
+	sim =3D syscon_regmap_lookup_by_compatible("fsl,imx7ulp-sim");
+	if (IS_ERR(sim)) {
+		pr_warn("failed to find fsl,imx7ulp-sim regmap!\n");
+		return;
+	}
+
+	if (regmap_read(sim, SIM_JTAG_ID_REG, &revision)) {
+		pr_warn("failed to read sim regmap!\n");
+		return;
+	}
+
+	/*
+	 * bit[31:28] of JTAG_ID register defines revision as below from B0:
+	 * 0001        B0
+	 * 0010        B1
+	 */
+	switch (revision >> 28) {
+	case 1:
+		imx_set_soc_revision(IMX_CHIP_REVISION_2_0);
+		break;
+	case 2:
+		imx_set_soc_revision(IMX_CHIP_REVISION_2_1);
+		break;
+	default:
+		imx_set_soc_revision(IMX_CHIP_REVISION_1_0);
+		break;
+	}
+}
+
 static void __init imx7ulp_init_machine(void)
 {
 	imx7ulp_pm_init();
=20
 	mxc_set_cpu_type(MXC_CPU_IMX7ULP);
+	imx7ulp_set_revision();
 	of_platform_default_populate(NULL, NULL, imx_soc_device_init());
 }
=20
--=20
2.7.4
