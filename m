From: Rob Herring <robh@kernel.org>
Subject: [PATCH 17/21] clk: mvebu: use for_each_of_cpu_node iterator
Date: Wed,  5 Sep 2018 14:37:34 -0500
Message-ID: <20180905193738.19325-18-robh@kernel.org>
References: <20180905193738.19325-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905193738.19325-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use the for_each_of_cpu_node iterator to iterate over cpu nodes. This
has the side effect of defaulting to iterating using "cpu" node names in
preference to the deprecated (for FDT) device_type == "cpu".

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I will take via the DT tree. This is dependent on the
first 2 patches.

 drivers/clk/mvebu/clk-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 072aa38374ce..3045067448fb 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -183,7 +183,7 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 		pr_warn("%s: pmu-dfs base register not set, dynamic frequency scaling not available\n",
 			__func__);

-	for_each_node_by_type(dn, "cpu")
+	for_each_of_cpu_node(dn)
 		ncpus++;

 	cpuclk = kcalloc(ncpus, sizeof(*cpuclk), GFP_KERNEL);
@@ -194,7 +194,7 @@ static void __init of_cpu_clk_setup(struct device_node *node)
 	if (WARN_ON(!clks))
 		goto clks_out;

-	for_each_node_by_type(dn, "cpu") {
+	for_each_of_cpu_node(dn) {
 		struct clk_init_data init;
 		struct clk *clk;
 		char *clk_name = kzalloc(5, GFP_KERNEL);
--
2.17.1
