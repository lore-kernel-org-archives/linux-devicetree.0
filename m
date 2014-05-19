From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [Patch v3 3/5] ARM: keystone: remove redundant reset stuff
Date: Mon, 19 May 2014 13:25:53 +0300
Message-ID: <1400495155-11136-4-git-send-email-ivan.khoronzhuk@ti.com>
References: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400495155-11136-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, arnd@arndb.de, linux-doc@vger.kernel.org, w-kwok2@ti.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, olof@lixom.net, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Remove reset stuff in flavour of using keystone reset driver:
driver/power/reset/keystone-reset.c

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 arch/arm/mach-keystone/keystone.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-keystone/keystone.c
index e0b9e1b..c96e2a4 100644
--- a/arch/arm/mach-keystone/keystone.c
+++ b/arch/arm/mach-keystone/keystone.c
@@ -23,24 +23,8 @@
 
 #include "keystone.h"
 
-#define PLL_RESET_WRITE_KEY_MASK		0xffff0000
-#define PLL_RESET_WRITE_KEY			0x5a69
-#define PLL_RESET				BIT(16)
-
-static void __iomem *keystone_rstctrl;
-
 static void __init keystone_init(void)
 {
-	struct device_node *node;
-
-	node = of_find_compatible_node(NULL, NULL, "ti,keystone-reset");
-	if (WARN_ON(!node))
-		pr_warn("ti,keystone-reset node undefined\n");
-
-	keystone_rstctrl = of_iomap(node, 0);
-	if (WARN_ON(!keystone_rstctrl))
-		pr_warn("ti,keystone-reset iomap error\n");
-
 	keystone_pm_runtime_init();
 	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
 }
@@ -50,24 +34,6 @@ static const char *keystone_match[] __initconst = {
 	NULL,
 };
 
-void keystone_restart(enum reboot_mode mode, const char *cmd)
-{
-	u32 val;
-
-	BUG_ON(!keystone_rstctrl);
-
-	/* Enable write access to RSTCTRL */
-	val = readl(keystone_rstctrl);
-	val &= PLL_RESET_WRITE_KEY_MASK;
-	val |= PLL_RESET_WRITE_KEY;
-	writel(val, keystone_rstctrl);
-
-	/* Reset the SOC */
-	val = readl(keystone_rstctrl);
-	val &= ~PLL_RESET;
-	writel(val, keystone_rstctrl);
-}
-
 DT_MACHINE_START(KEYSTONE, "Keystone")
 #if defined(CONFIG_ZONE_DMA) && defined(CONFIG_ARM_LPAE)
 	.dma_zone_size	= SZ_2G,
@@ -75,5 +41,4 @@ DT_MACHINE_START(KEYSTONE, "Keystone")
 	.smp		= smp_ops(keystone_smp_ops),
 	.init_machine	= keystone_init,
 	.dt_compat	= keystone_match,
-	.restart	= keystone_restart,
 MACHINE_END
-- 
1.8.3.2
