From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V7 09/10] PM / OPP: Don't WARN on multiple calls to dev_pm_opp_set_regulators()
Date: Thu,  1 Dec 2016 16:28:22 +0530
Message-ID: <321955a2bda07c0c832fcf80106b92f21803cab6.1480564564.git.viresh.kumar@linaro.org>
References: <cover.1480564564.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1480564564.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1480564564.git.viresh.kumar@linaro.org>
References: <cover.1480564564.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Rafael Wysocki <rjw@rjwysocki.net>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, robh@kernel.org, d-gerlach@ti.com, broonie@kernel.org, devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

If a platform specific OPP driver has called this routine first and set
the regulators, then the second call from cpufreq-dt driver will hit the
WARN_ON(). Remove the WARN_ON(), but continue to return error in such
cases.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
Tested-by: Dave Gerlach <d-gerlach@ti.com>
---
 drivers/base/power/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/opp/core.c b/drivers/base/power/opp/core.c
index eceebef36f21..35ff06283738 100644
--- a/drivers/base/power/opp/core.c
+++ b/drivers/base/power/opp/core.c
@@ -1485,7 +1485,7 @@ struct opp_table *dev_pm_opp_set_regulators(struct device *dev,
 	}
 
 	/* Already have regulators set */
-	if (WARN_ON(opp_table->regulators)) {
+	if (opp_table->regulators) {
 		ret = -EBUSY;
 		goto err;
 	}
-- 
2.7.1.410.g6faf27b

