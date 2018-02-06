From: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCHv2 2/3] ARM: imx53: add SoC specific PMU setup
Date: Tue,  6 Feb 2018 15:26:28 +0100
Message-ID: <20180206142629.534-3-sebastian.reichel@collabora.co.uk>
References: <20180206142629.534-1-sebastian.reichel@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180206142629.534-1-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

On i.MX53 it is necessary to set the DBG_EN bit in the
platform GPC register to enable access to PMU counters
other than the cycle counter.

Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 arch/arm/mach-imx/mach-imx53.c | 68 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/mach-imx/mach-imx53.c b/arch/arm/mach-imx/mach-imx53.c
index 07c2e8dca494..da7c80371f32 100644
--- a/arch/arm/mach-imx/mach-imx53.c
+++ b/arch/arm/mach-imx/mach-imx53.c
@@ -17,6 +17,7 @@
 #include <linux/irq.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/perf/arm_pmu.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
 
@@ -28,10 +29,77 @@ static void __init imx53_init_early(void)
 	mxc_set_cpu_type(MXC_CPU_MX53);
 }
 
+/* Hard code as this is i.Mx53 only file */
+#define MXC_CORTEXA8_PLAT_GPC 0x63fa0004
+#define GPC_DBG_EN (1 << 16)
+
+static void __iomem *imx53_pmu_get_gpc(void)
+{
+	static void __iomem *gpc;
+
+	if (!gpc) {
+		gpc = ioremap(MXC_CORTEXA8_PLAT_GPC, 4);
+		if (!gpc)
+			printk_once(KERN_INFO "unable to map GPC to enable perf\n");
+	}
+
+	return gpc;
+}
+
+static int imx53_pmu_reserve(struct arm_pmu *arm_pmu)
+{
+	void __iomem *gpc_reg;
+	u32 gpc;
+
+	gpc_reg = imx53_pmu_get_gpc();
+	if (!gpc_reg)
+		return 0;
+
+	gpc = __raw_readl(gpc_reg);
+	if (gpc & GPC_DBG_EN) {
+		arm_pmu->reserved_hardware = false;
+	} else {
+		gpc |= GPC_DBG_EN;
+		__raw_writel(gpc, gpc_reg);
+		arm_pmu->reserved_hardware = true;
+	}
+
+	return 0;
+}
+
+static void imx53_pmu_release(struct arm_pmu *arm_pmu)
+{
+	void __iomem *gpc_reg;
+	u32 gpc;
+
+	gpc_reg = imx53_pmu_get_gpc();
+	if (!gpc_reg)
+		return;
+
+	if (arm_pmu->reserved_hardware) {
+		gpc = __raw_readl(gpc_reg);
+		gpc &= ~GPC_DBG_EN;
+		__raw_writel(gpc, gpc_reg);
+		arm_pmu->reserved_hardware = false;
+	}
+}
+
+static struct arm_pmu_platdata imx53_pmu_platdata = {
+	.reserve_hardware = imx53_pmu_reserve,
+	.release_hardware = imx53_pmu_release,
+};
+
+static struct of_dev_auxdata imx53_auxdata_lookup[] __initdata = {
+	OF_DEV_AUXDATA("arm,cortex-a8-pmu", 0, "arm-pmu", &imx53_pmu_platdata),
+	{}
+};
+
 static void __init imx53_dt_init(void)
 {
 	imx_src_init();
 
+	of_platform_populate(NULL, of_default_bus_match_table,
+					imx53_auxdata_lookup, NULL);
 	imx_aips_allow_unprivileged_access("fsl,imx53-aipstz");
 }
 
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
