From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/5] clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
Date: Sat, 21 Sep 2019 17:12:20 +0200
Message-ID: <20190921151223.768842-3-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Switch from clk_set_parent() to clk_hw_set_parent() now that we have a
way to configure a mux clock based on clk_hw pointers. This simplifies
the meson8b_cpu_clk_notifier_cb logic. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 67e6691e080c..d376f80e806d 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3585,7 +3585,7 @@ static const struct reset_control_ops meson8b_clk_reset_ops = {
 
 struct meson8b_nb_data {
 	struct notifier_block nb;
-	struct clk_hw_onecell_data *onecell_data;
+	struct clk_hw *cpu_clk;
 };
 
 static int meson8b_cpu_clk_notifier_cb(struct notifier_block *nb,
@@ -3593,30 +3593,25 @@ static int meson8b_cpu_clk_notifier_cb(struct notifier_block *nb,
 {
 	struct meson8b_nb_data *nb_data =
 		container_of(nb, struct meson8b_nb_data, nb);
-	struct clk_hw **hws = nb_data->onecell_data->hws;
-	struct clk_hw *cpu_clk_hw, *parent_clk_hw;
-	struct clk *cpu_clk, *parent_clk;
+	struct clk_hw *parent_clk;
 	int ret;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		parent_clk_hw = hws[CLKID_XTAL];
+		/* xtal */
+		parent_clk = clk_hw_get_parent_by_index(nb_data->cpu_clk, 0);
 		break;
 
 	case POST_RATE_CHANGE:
-		parent_clk_hw = hws[CLKID_CPU_SCALE_OUT_SEL];
+		/* cpu_scale_out_sel */
+		parent_clk = clk_hw_get_parent_by_index(nb_data->cpu_clk, 1);
 		break;
 
 	default:
 		return NOTIFY_DONE;
 	}
 
-	cpu_clk_hw = hws[CLKID_CPUCLK];
-	cpu_clk = __clk_lookup(clk_hw_get_name(cpu_clk_hw));
-
-	parent_clk = __clk_lookup(clk_hw_get_name(parent_clk_hw));
-
-	ret = clk_set_parent(cpu_clk, parent_clk);
+	ret = clk_hw_set_parent(nb_data->cpu_clk, parent_clk);
 	if (ret)
 		return notifier_from_errno(ret);
 
@@ -3695,7 +3690,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 			return;
 	}
 
-	meson8b_cpu_nb_data.onecell_data = clk_hw_onecell_data;
+	meson8b_cpu_nb_data.cpu_clk = clk_hw_onecell_data->hws[CLKID_CPUCLK];
 
 	/*
 	 * FIXME we shouldn't program the muxes in notifier handlers. The
-- 
2.23.0
