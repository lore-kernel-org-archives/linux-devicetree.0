From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [v4, 2/8] cpufreq: mediatek: add clock enable for intermediate clock
Date: Tue, 13 Aug 2019 21:31:47 +0800
Message-ID: <1565703113-31479-3-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, fan.chen@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

Intermediate clock is not always enabled by ccf in different projects,
so cpufreq should always enable it by itself.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index a370577ffc73..acd9539e95de 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -368,13 +368,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		goto out_free_resources;
 	}
 
+	ret = clk_prepare_enable(inter_clk);
+	if (ret)
+		goto out_free_opp_table;
+
 	/* Search a safe voltage for intermediate frequency. */
 	rate = clk_get_rate(inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
 	if (IS_ERR(opp)) {
 		pr_err("failed to get intermediate opp for cpu%d\n", cpu);
 		ret = PTR_ERR(opp);
-		goto out_free_opp_table;
+		goto out_disable_clock;
 	}
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
@@ -393,6 +397,9 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 	return 0;
 
+out_disable_clock:
+	clk_disable_unprepare(inter_clk);
+
 out_free_opp_table:
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
@@ -419,6 +426,10 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 		clk_put(info->cpu_clk);
 	if (!IS_ERR(info->inter_clk))
 		clk_put(info->inter_clk);
+	if (!IS_ERR(info->inter_clk)) {
+		clk_disable_unprepare(info->inter_clk);
+		clk_put(info->inter_clk);
+	}
 
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 }
-- 
2.12.5
