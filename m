From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 01/11] OPP: Allow required-opps even if the device doesn't
 have power-domains
Date: Thu, 13 Jun 2019 21:17:23 -0700
Message-ID: <20190614041733.120807-2-saravanak@google.com>
References: <20190614041733.120807-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614041733.120807-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A Device-A can have a (minimum) performance requirement on another
Device-B to be able to function correctly. This performance requirement
on Device-B can also change based on the current performance level of
Device-A.

The existing required-opps feature fits well to describe this need. So,
instead of limiting required-opps to point to only PM-domain devices,
allow it to point to any device.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/opp/core.c |  2 +-
 drivers/opp/of.c   | 14 --------------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 0e7703fe733f..74c7bdc6f463 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -710,7 +710,7 @@ static int _set_required_opps(struct device *dev,
 		return 0;
 
 	/* Single genpd case */
-	if (!genpd_virt_devs) {
+	if (!genpd_virt_devs && required_opp_tables[0]->is_genpd) {
 		pstate = opp->required_opps[0]->pstate;
 		ret = dev_pm_genpd_set_performance_state(dev, pstate);
 		if (ret) {
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index c10c782d15aa..7c8336e94aff 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -195,9 +195,6 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
 	 */
 	count_pd = of_count_phandle_with_args(dev->of_node, "power-domains",
 					      "#power-domain-cells");
-	if (!count_pd)
-		goto put_np;
-
 	if (count_pd > 1) {
 		genpd_virt_devs = kcalloc(count, sizeof(*genpd_virt_devs),
 					GFP_KERNEL);
@@ -226,17 +223,6 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
 
 		if (IS_ERR(required_opp_tables[i]))
 			goto free_required_tables;
-
-		/*
-		 * We only support genpd's OPPs in the "required-opps" for now,
-		 * as we don't know how much about other cases. Error out if the
-		 * required OPP doesn't belong to a genpd.
-		 */
-		if (!required_opp_tables[i]->is_genpd) {
-			dev_err(dev, "required-opp doesn't belong to genpd: %pOF\n",
-				required_np);
-			goto free_required_tables;
-		}
 	}
 
 	goto put_np;
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
