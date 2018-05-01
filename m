From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v8 08/12] ARM: sun9i: smp: Rename clusters's power-off
Date: Tue,  1 May 2018 14:31:27 +0200
Message-ID: <20180501123131.7738-9-mylene.josserand@bootlin.com>
References: <20180501123131.7738-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180501123131.7738-1-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

To prepare the support for sun8i-a83t, rename the macro that handles
the power-off of clusters because it is different from sun9i-a80 to
sun8i-a83t.

The power off register for clusters are different from a80 and a83t.

Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/mach-sunxi/mc_smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index 727968d6a3e5..03f021d0c73e 100644
--- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -60,7 +60,7 @@
 #define PRCM_CPU_PO_RST_CTRL_CORE(n)	BIT(n)
 #define PRCM_CPU_PO_RST_CTRL_CORE_ALL	0xf
 #define PRCM_PWROFF_GATING_REG(c)	(0x100 + 0x4 * (c))
-#define PRCM_PWROFF_GATING_REG_CLUSTER	BIT(4)
+#define PRCM_PWROFF_GATING_REG_CLUSTER_SUN9I	BIT(4)
 #define PRCM_PWROFF_GATING_REG_CORE(n)	BIT(n)
 #define PRCM_PWR_SWITCH_REG(c, cpu)	(0x140 + 0x10 * (c) + 0x4 * (cpu))
 #define PRCM_CPU_SOFT_ENTRY_REG		0x164
@@ -255,7 +255,7 @@ static int sunxi_cluster_powerup(unsigned int cluster)
 
 	/* clear cluster power gate */
 	reg = readl(prcm_base + PRCM_PWROFF_GATING_REG(cluster));
-	reg &= ~PRCM_PWROFF_GATING_REG_CLUSTER;
+	reg &= ~PRCM_PWROFF_GATING_REG_CLUSTER_SUN9I;
 	writel(reg, prcm_base + PRCM_PWROFF_GATING_REG(cluster));
 	udelay(20);
 
@@ -452,7 +452,7 @@ static int sunxi_cluster_powerdown(unsigned int cluster)
 	/* gate cluster power */
 	pr_debug("%s: gate cluster power\n", __func__);
 	reg = readl(prcm_base + PRCM_PWROFF_GATING_REG(cluster));
-	reg |= PRCM_PWROFF_GATING_REG_CLUSTER;
+	reg |= PRCM_PWROFF_GATING_REG_CLUSTER_SUN9I;
 	writel(reg, prcm_base + PRCM_PWROFF_GATING_REG(cluster));
 	udelay(20);
 
-- 
2.11.0
