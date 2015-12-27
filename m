From: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Subject: [PATCH v2 1/3] PM/OPP: Don't skip cpu_dev->id when setting up cpumask
Date: Sun, 27 Dec 2015 14:21:56 +0800
Message-ID: <1451197318-12418-2-git-send-email-pi-cheng.chen@linaro.org>
References: <1451197318-12418-1-git-send-email-pi-cheng.chen@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1451197318-12418-1-git-send-email-pi-cheng.chen@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Daniel Kurtz <djkurtz@chromium.org>, linux-mediatek@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Don't skip cpu_dev->id when setting up cpumask for CPUs that share the
same OPP table. This might be helpful when handling cpumask without the
original CPU bitfield set.

Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
---
 drivers/base/power/opp/cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/power/opp/cpu.c b/drivers/base/power/opp/cpu.c
index 7b445e8..4914a0d 100644
--- a/drivers/base/power/opp/cpu.c
+++ b/drivers/base/power/opp/cpu.c
@@ -214,7 +214,6 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_of_cpumask_add_table);
 /*
  * Works only for OPP v2 bindings.
  *
- * cpumask should be already set to mask of cpu_dev->id.
  * Returns -ENOENT if operating-points-v2 bindings aren't supported.
  */
 int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, cpumask_var_t cpumask)
@@ -235,9 +234,6 @@ int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, cpumask_var_t cpumask
 		goto put_cpu_node;
 
 	for_each_possible_cpu(cpu) {
-		if (cpu == cpu_dev->id)
-			continue;
-
 		tcpu_dev = get_cpu_device(cpu);
 		if (!tcpu_dev) {
 			dev_err(cpu_dev, "%s: failed to get cpu%d device\n",
-- 
1.9.1

