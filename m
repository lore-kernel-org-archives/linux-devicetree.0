From: David Lechner <david@lechnology.com>
Subject: [PATCH v3 04/16] ARM: davinci: Move clock init after ioremap.
Date: Thu, 24 Mar 2016 18:51:29 -0500
Message-ID: <1458863503-31121-5-git-send-email-david@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458863503-31121-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, David Lechner <david@lechnology.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@kernel.org>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, petr@barix.com, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, David.Laight@ACULAB.COM, Lee Jones <lee.jones@linaro.org>, sergei.shtylyov@cogentembedded.com, Bin Liu <b-liu@ti.com>
List-Id: devicetree@vger.kernel.org

Some clocks (such as the USB PHY clocks in DA8xx) will need to use iomem.
The davinci_common_init() function must be called before the ioremap, so
the clock init is now split out as separate function.

Signed-off-by: David Lechner <david@lechnology.com>
---

v3 changes: This is a new patch. It takes care of the issue of unwanted ioremap
in clock set_parent functions.


 arch/arm/mach-davinci/clock.c  | 4 ++--
 arch/arm/mach-davinci/clock.h  | 7 ++++++-
 arch/arm/mach-davinci/common.c | 6 ------
 arch/arm/mach-davinci/da830.c  | 2 ++
 arch/arm/mach-davinci/da850.c  | 2 ++
 arch/arm/mach-davinci/dm355.c  | 1 +
 arch/arm/mach-davinci/dm365.c  | 1 +
 arch/arm/mach-davinci/dm644x.c | 1 +
 arch/arm/mach-davinci/dm646x.c | 1 +
 9 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-davinci/clock.c b/arch/arm/mach-davinci/clock.c
index 3424eac6..a5c2629 100644
--- a/arch/arm/mach-davinci/clock.c
+++ b/arch/arm/mach-davinci/clock.c
@@ -560,7 +560,7 @@ EXPORT_SYMBOL(davinci_set_pllrate);
  * than that used by default in <soc>.c file. The reference clock rate
  * should be updated early in the boot process; ideally soon after the
  * clock tree has been initialized once with the default reference clock
- * rate (davinci_common_init()).
+ * rate (davinci_clk_init()).
  *
  * Returns 0 on success, error otherwise.
  */
@@ -581,7 +581,7 @@ int davinci_set_refclk_rate(unsigned long rate)
 	return 0;
 }
 
-int __init davinci_clk_init(struct clk_lookup *clocks)
+int __init _davinci_clk_init(struct clk_lookup *clocks)
 {
 	struct clk_lookup *c;
 	struct clk *clk;
diff --git a/arch/arm/mach-davinci/clock.h b/arch/arm/mach-davinci/clock.h
index 1e4e836..8b0fbbe 100644
--- a/arch/arm/mach-davinci/clock.h
+++ b/arch/arm/mach-davinci/clock.h
@@ -124,7 +124,12 @@ struct clk {
 		.clk = ck,	\
 	}			\
 
-int davinci_clk_init(struct clk_lookup *clocks);
+int _davinci_clk_init(struct clk_lookup *clocks);
+static inline void davinci_clk_init(struct davinci_soc_info *soc_info)
+{
+	if (soc_info->cpu_clks && _davinci_clk_init(soc_info->cpu_clks))
+		panic("davinci_clk_init: Failed to init clocks.\n");
+}
 int davinci_set_pllrate(struct pll_data *pll, unsigned int prediv,
 				unsigned int mult, unsigned int postdiv);
 int davinci_set_sysclk_rate(struct clk *clk, unsigned long rate);
diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/common.c
index f55ef2e..6bc8c22 100644
--- a/arch/arm/mach-davinci/common.c
+++ b/arch/arm/mach-davinci/common.c
@@ -103,12 +103,6 @@ void __init davinci_common_init(struct davinci_soc_info *soc_info)
 	if (ret < 0)
 		goto err;
 
-	if (davinci_soc_info.cpu_clks) {
-		ret = davinci_clk_init(davinci_soc_info.cpu_clks);
-
-		if (ret != 0)
-			goto err;
-	}
 
 	return;
 
diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
index 7187e7f..79d5fc3 100644
--- a/arch/arm/mach-davinci/da830.c
+++ b/arch/arm/mach-davinci/da830.c
@@ -1214,4 +1214,6 @@ void __init da830_init(void)
 
 	da8xx_syscfg0_base = ioremap(DA8XX_SYSCFG0_BASE, SZ_4K);
 	WARN(!da8xx_syscfg0_base, "Unable to map syscfg0 module");
+
+	davinci_clk_init(&davinci_soc_info_da830);
 }
diff --git a/arch/arm/mach-davinci/da850.c b/arch/arm/mach-davinci/da850.c
index 97d8779..9f46706 100644
--- a/arch/arm/mach-davinci/da850.c
+++ b/arch/arm/mach-davinci/da850.c
@@ -1346,4 +1346,6 @@ void __init da850_init(void)
 	v = __raw_readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP3_REG));
 	v &= ~CFGCHIP3_PLL1_MASTER_LOCK;
 	__raw_writel(v, DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP3_REG));
+
+	davinci_clk_init(&davinci_soc_info_da850);
 }
diff --git a/arch/arm/mach-davinci/dm355.c b/arch/arm/mach-davinci/dm355.c
index a0ecf49..b311b84 100644
--- a/arch/arm/mach-davinci/dm355.c
+++ b/arch/arm/mach-davinci/dm355.c
@@ -1052,6 +1052,7 @@ void __init dm355_init(void)
 {
 	davinci_common_init(&davinci_soc_info_dm355);
 	davinci_map_sysmod();
+	davinci_clk_init(&davinci_soc_info_dm355);
 }
 
 int __init dm355_init_video(struct vpfe_config *vpfe_cfg,
diff --git a/arch/arm/mach-davinci/dm365.c b/arch/arm/mach-davinci/dm365.c
index 384d367..2338875 100644
--- a/arch/arm/mach-davinci/dm365.c
+++ b/arch/arm/mach-davinci/dm365.c
@@ -1176,6 +1176,7 @@ void __init dm365_init(void)
 {
 	davinci_common_init(&davinci_soc_info_dm365);
 	davinci_map_sysmod();
+	davinci_clk_init(&davinci_soc_info_dm365);
 }
 
 static struct resource dm365_vpss_resources[] = {
diff --git a/arch/arm/mach-davinci/dm644x.c b/arch/arm/mach-davinci/dm644x.c
index b4b3a8b..5e672ed 100644
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@ -932,6 +932,7 @@ void __init dm644x_init(void)
 {
 	davinci_common_init(&davinci_soc_info_dm644x);
 	davinci_map_sysmod();
+	davinci_clk_init(&davinci_soc_info_dm644x);
 }
 
 int __init dm644x_init_video(struct vpfe_config *vpfe_cfg,
diff --git a/arch/arm/mach-davinci/dm646x.c b/arch/arm/mach-davinci/dm646x.c
index a43db0f..2840263 100644
--- a/arch/arm/mach-davinci/dm646x.c
+++ b/arch/arm/mach-davinci/dm646x.c
@@ -956,6 +956,7 @@ void __init dm646x_init(void)
 {
 	davinci_common_init(&davinci_soc_info_dm646x);
 	davinci_map_sysmod();
+	davinci_clk_init(&davinci_soc_info_dm646x);
 }
 
 static int __init dm646x_init_devices(void)
-- 
1.9.1
