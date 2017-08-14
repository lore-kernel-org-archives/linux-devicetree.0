From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 5/5] ARC: AXS103: use cpu-freq param instead of /cpu_card/core_clk
Date: Mon, 14 Aug 2017 19:12:13 +0300
Message-ID: <20170814161213.17522-6-Eugeniy.Paltsev@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Use cpu's node "cpu-freq" param instead of platform-specific
"/cpu_card/core_clk" as it works only if we use fixed-clock for cpu
clocking.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/plat-axs10x/axs10x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arc/plat-axs10x/axs10x.c b/arch/arc/plat-axs10x/axs10x.c
index 98d07b7..75118fdc 100644
--- a/arch/arc/plat-axs10x/axs10x.c
+++ b/arch/arc/plat-axs10x/axs10x.c
@@ -337,20 +337,16 @@ union pll_reg {
 
 static void __init axs103_early_init(void)
 {
-	/*
-	 * TODO: use cpu node "cpu-freq" param instead of platform-specific
-	 * "/cpu_card/core_clk" as it works only if we use fixed-clock for cpu.
-	 */
-	int offset = fdt_path_offset(initial_boot_params, "/cpu_card/core_clk");
+	int offset = fdt_path_offset(initial_boot_params, "/cpus/cpu@0");
 	const struct fdt_property *prop = fdt_get_property(initial_boot_params,
 							   offset,
-							   "clock-frequency",
+							   "cpu-freq",
 							   NULL);
 	u32 freq = be32_to_cpu(*(u32*)(prop->data)) / 1000000, orig = freq;
 
 	/*
 	 * AXS103 configurations for SMP/QUAD configurations share device tree
-	 * which defaults to 90 MHz. However recent failures of Quad config
+	 * which defaults to 100 MHz. However recent failures of Quad config
 	 * revealed P&R timing violations so clamp it down to safe 50 MHz
 	 * Instead of duplicating defconfig/DT for SMP/QUAD, add a small hack
 	 *
@@ -367,7 +363,7 @@ static void __init axs103_early_init(void)
 	if (freq != orig ) {
 		freq = cpu_to_be32(freq * 1000000);
 		fdt_setprop_inplace(initial_boot_params, offset,
-				    "clock-frequency", &freq, sizeof(freq));
+				    "cpu-freq", &freq, sizeof(freq));
 	}
 
 	/* Memory maps already config in pre-bootloader */
-- 
2.9.3
