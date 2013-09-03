From: Fugang Duan <B38611@freescale.com>
Subject: [PATCH v2 4/4] ARM: imx6sl: config iomux-gpr1 to select clock for fec
Date: Tue, 3 Sep 2013 12:26:25 +0800
Message-ID: <1378182385-9205-5-git-send-email-B38611@freescale.com>
References: <1378182385-9205-1-git-send-email-B38611@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1378182385-9205-1-git-send-email-B38611@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Config iomux-gpr1 to select clock source for fec system clock.
Clear gpr1[14], gpr1[18-17] bit to select the fec clock source
from internal anatop PLL.

Signed-off-by: Fugang Duan  <B38611@freescale.com>
---
 arch/arm/mach-imx/mach-imx6sl.c |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6sl.c b/arch/arm/mach-imx/mach-imx6sl.c
index 132db26..96fb816 100644
--- a/arch/arm/mach-imx/mach-imx6sl.c
+++ b/arch/arm/mach-imx/mach-imx6sl.c
@@ -11,17 +11,38 @@
 #include <linux/irqchip.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
+#include <linux/regmap.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
 #include "common.h"
 
+static void __init imx6sl_fec_init(void)
+{
+	struct regmap *gpr;
+
+	/* set FEC clock from internal PLL clock source */
+	gpr = syscon_regmap_lookup_by_compatible("fsl,imx6sl-iomuxc-gpr");
+	if (!IS_ERR(gpr)) {
+		regmap_update_bits(gpr, IOMUXC_GPR1,
+			IMX6SL_GPR1_FEC_CLOCK_MUX2_SEL_MASK, 0);
+		regmap_update_bits(gpr, IOMUXC_GPR1,
+			IMX6SL_GPR1_FEC_CLOCK_MUX1_SEL_MASK, 0);
+	} else {
+		pr_err("failed to find fsl,imx6sl-iomux-gpr regmap\n");
+	}
+}
+
 static void __init imx6sl_init_machine(void)
 {
 	mxc_arch_reset_init_dt();
 
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+
+	imx6sl_fec_init();
 }
 
 static void __init imx6sl_init_irq(void)
-- 
1.7.1
