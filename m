From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@bootlin.com>
Subject: [PATCH v9 09/12] ARM: sun9i: smp: Add is_a83t field
Date: Fri,  4 May 2018 21:05:42 +0200
Message-ID: <20180504190545.5114-10-mylene.josserand@bootlin.com>
References: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504190545.5114-1-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, maxime.ripard@bootlin.com, wens@csie.org, marc.zyngier@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, horms@verge.net.au, geert@linux-m68k.org, magnus.damm@gmail.com
Cc: f.fainelli@gmail.com, opendmb@gmail.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, clabbe.montjoie@gmail.com, quentin.schulz@bootlin.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mylene.josserand@bootlin.com
List-Id: devicetree@vger.kernel.org

To prepare the support of sun8i-a83t, add a field in the smp_data
structure to know if we are on sun9i-a80 or sun8i-a83t.

Add also a global variable to retrieve which architecture we are
having.

Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/mach-sunxi/mc_smp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-sunxi/mc_smp.c b/arch/arm/mach-sunxi/mc_smp.c
index 03f021d0c73e..fc10e3a3268f 100644
--- a/arch/arm/mach-sunxi/mc_smp.c
+++ b/arch/arm/mach-sunxi/mc_smp.c
@@ -74,6 +74,7 @@ static void __iomem *sram_b_smp_base;
 
 extern void sunxi_mc_smp_secondary_startup(void);
 extern void sunxi_mc_smp_resume(void);
+static bool is_a83t;
 
 static bool sunxi_core_is_cortex_a15(unsigned int core, unsigned int cluster)
 {
@@ -624,6 +625,7 @@ struct sunxi_mc_smp_nodes {
 struct sunxi_mc_smp_data {
 	const char *enable_method;
 	int (*get_smp_nodes)(struct sunxi_mc_smp_nodes *nodes);
+	bool is_a83t;
 };
 
 static void __init sunxi_mc_smp_put_nodes(struct sunxi_mc_smp_nodes *nodes)
@@ -697,6 +699,8 @@ static int __init sunxi_mc_smp_init(void)
 			break;
 	}
 
+	is_a83t = sunxi_mc_smp_data[i].is_a83t;
+
 	of_node_put(node);
 	if (ret)
 		return -ENODEV;
-- 
2.11.0
