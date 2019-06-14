From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 03/11] PM / devfreq: Add required OPPs support to passive governor
Date: Thu, 13 Jun 2019 21:17:25 -0700
Message-ID: <20190614041733.120807-4-saravanak@google.com>
References: <20190614041733.120807-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614041733.120807-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Rajendra Nayak <rnayak@codeaurora.org>, Jordan Crouse <jcrouse@codeaurora.org>, vincent.guittot@linaro.org, bjorn.andersson@linaro.org, amit.kucheria@linaro.org, seansw@qti.qualcomm.com, daidavid1@codeaurora.org, evgreen@chromium.org, sibis@codeaurora.org, kernel-team@android.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Look at the required OPPs of the "parent" device to determine the OPP that
is required from the slave device managed by the passive governor. This
allows having mappings between a parent device and a slave device even when
they don't have the same number of OPPs.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/devfreq/governor_passive.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index 3bc29acbd54e..bd4a98bb15b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -21,8 +21,9 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	struct devfreq_passive_data *p_data
 			= (struct devfreq_passive_data *)devfreq->data;
 	struct devfreq *parent_devfreq = (struct devfreq *)p_data->parent;
+	struct opp_table *opp_table = NULL, *c_opp_table = NULL;
 	unsigned long child_freq = ULONG_MAX;
-	struct dev_pm_opp *opp;
+	struct dev_pm_opp *opp = NULL, *c_opp = NULL;
 	int i, count, ret = 0;
 
 	/*
@@ -65,7 +66,20 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 		goto out;
 	}
 
-	dev_pm_opp_put(opp);
+	opp_table = dev_pm_opp_get_opp_table(parent_devfreq->dev.parent);
+	if (IS_ERR_OR_NULL(opp_table)) {
+		ret = PTR_ERR(opp_table);
+		goto out;
+	}
+
+	c_opp_table = dev_pm_opp_get_opp_table(devfreq->dev.parent);
+	if (!IS_ERR_OR_NULL(c_opp_table))
+		c_opp = dev_pm_opp_xlate_opp(opp_table, c_opp_table, opp);
+	if (c_opp) {
+		*freq = dev_pm_opp_get_freq(c_opp);
+		dev_pm_opp_put(c_opp);
+		goto out;
+	}
 
 	/*
 	 * Get the OPP table's index of decided freqeuncy by governor
@@ -92,6 +106,13 @@ static int devfreq_passive_get_target_freq(struct devfreq *devfreq,
 	*freq = child_freq;
 
 out:
+	if (!IS_ERR_OR_NULL(opp_table))
+		dev_pm_opp_put_opp_table(opp_table);
+	if (!IS_ERR_OR_NULL(c_opp_table))
+		dev_pm_opp_put_opp_table(c_opp_table);
+	if (!IS_ERR_OR_NULL(opp))
+		dev_pm_opp_put(opp);
+
 	return ret;
 }
 
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
