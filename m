From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 2/5] ARC: AXS103: Get rid of platform specific cpu clock configuration
Date: Mon, 14 Aug 2017 19:12:10 +0300
Message-ID: <20170814161213.17522-3-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

We set AXS103 cpu frequency in arch/arc/plat-axs10x/axs10x.c
via direct writing to pll registers for historical reasons.
So get rid of AXS103 platform specific cpu clock configuration as
we have driver for AXS103 core pll (AXS103 pll driver is already
in linux-next. It is selected automatically when
CONFIG_ARC_PLAT_AXS10X is set)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/plat-axs10x/axs10x.c | 88 ++-----------------------------------------
 1 file changed, 4 insertions(+), 84 deletions(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 38ff349..98d07b7 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -335,61 +335,12 @@ union pll_reg {
 	unsigned int val;
 };
 
-static unsigned int __init axs103_get_freq(void)
-{
-	union pll_reg idiv, fbdiv, odiv;
-	unsigned int f = 33333333;
-
-	idiv.val = ioread32((void __iomem *)AXC003_CGU + 0x80 + 0);
-	fbdiv.val = ioread32((void __iomem *)AXC003_CGU + 0x80 + 4);
-	odiv.val = ioread32((void __iomem *)AXC003_CGU + 0x80 + 8);
-
-	if (idiv.bypass != 1)
-		f = f / (idiv.low + idiv.high);
-
-	if (fbdiv.bypass != 1)
-		f = f * (fbdiv.low + fbdiv.high);
-
-	if (odiv.bypass != 1)
-		f = f / (odiv.low + odiv.high);
-
-	f = (f + 500000) / 1000000; /* Rounding */
-	return f;
-}
-
-static inline unsigned int __init encode_div(unsigned int id, int upd)
-{
-	union pll_reg div;
-
-	div.val = 0;
-
-	div.noupd = !upd;
-	div.bypass = id == 1 ? 1 : 0;
-	div.edge = (id%2 == 0) ? 0 : 1;  /* 0 = rising */
-	div.low = (id%2 == 0) ? id >> 1 : (id >> 1)+1;
-	div.high = id >> 1;
-
-	return div.val;
-}
-
-noinline static void __init
-axs103_set_freq(unsigned int id, unsigned int fd, unsigned int od)
-{
-	write_cgu_reg(encode_div(id, 0),
-		      (void __iomem *)AXC003_CGU + 0x80 + 0,
-		      (void __iomem *)AXC003_CGU + 0x110);
-
-	write_cgu_reg(encode_div(fd, 0),
-		      (void __iomem *)AXC003_CGU + 0x80 + 4,
-		      (void __iomem *)AXC003_CGU + 0x110);
-
-	write_cgu_reg(encode_div(od, 1),
-		      (void __iomem *)AXC003_CGU + 0x80 + 8,
-		      (void __iomem *)AXC003_CGU + 0x110);
-}
-
 static void __init axs103_early_init(void)
 {
+	/*
+	 * TODO: use cpu node "cpu-freq" param instead of platform-specific
+	 * "/cpu_card/core_clk" as it works only if we use fixed-clock for cpu.
+	 */
 	int offset = fdt_path_offset(initial_boot_params, "/cpu_card/core_clk");
 	const struct fdt_property *prop = fdt_get_property(initial_boot_params,
 							   offset,
@@ -412,37 +363,6 @@ static void __init axs103_early_init(void)
 		freq = 50;
 #endif
 
-	switch (freq) {
-	case 33:
-		axs103_set_freq(1, 1, 1);
-		break;
-	case 50:
-		axs103_set_freq(1, 30, 20);
-		break;
-	case 75:
-		axs103_set_freq(2, 45, 10);
-		break;
-	case 90:
-		axs103_set_freq(2, 54, 10);
-		break;
-	case 100:
-		axs103_set_freq(1, 30, 10);
-		break;
-	case 125:
-		axs103_set_freq(2, 45,  6);
-		break;
-	default:
-		/*
-		 * In this case, core_frequency derived from
-		 * DT "clock-frequency" might not match with board value.
-		 * Hence update it to match the board value.
-		 */
-		freq = axs103_get_freq();
-		break;
-	}
-
-	pr_info("Freq is %dMHz\n", freq);
-
 	/* Patching .dtb in-place with new core clock value */
 	if (freq != orig ) {
 		freq = cpu_to_be32(freq * 1000000);
-- 
2.9.3
