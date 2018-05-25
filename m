From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 6/6] soc: qcom: rpmpd/rpmhpd: Add a max vote on all corners at init
Date: Fri, 25 May 2018 15:31:21 +0530
Message-ID: <20180525100121.28214-7-rnayak@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525100121.28214-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, collinsd@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

As we move from no clients/consumers in kernel voting on corners,
to *some* voting and some not voting, we might end up in a situation
where the clients which remove votes can adversly impact others
who still don't have a way to vote.

To avoid this situation, have a max vote on all corners at init.
This should/can be removed once we have all clients moved to
be able to vote/unvote for themselves.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/soc/qcom/rpmhpd.c | 9 +++++++++
 drivers/soc/qcom/rpmpd.c  | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index a79f094ad326..933f7b2d9249 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -323,6 +323,15 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmhpds[i]->pd;
+
+		/*
+		 * Until we have all consumers voting on corners
+		 * just vote the max corner on all PDs
+		 * This should ideally be *removed* once we have
+		 * all (most) consumers being able to vote
+		 */
+		rpmhpd_power_on(&rpmhpds[i]->pd);
+		rpmhpd_set_performance(&rpmhpds[i]->pd, rpmhpds[i]->level_count - 1);
 	}
 
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index ff3d910f388c..ff5da19beef3 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -308,6 +308,15 @@ static int rpmpd_probe(struct platform_device *pdev)
 		pm_genpd_init(&rpmpds[i]->pd, NULL, true);
 
 		data->domains[i] = &rpmpds[i]->pd;
+
+		/*
+		 * Until we have all consumers voting on corners
+		 * just vote the max corner on all PDs
+		 * This should ideally be *removed* once we have
+		 * all (most) consumers being able to vote
+		 */
+		rpmpd_set_performance(&rpmpds[i]->pd, MAX_RPMPD_STATE);
+		rpmpd_power_on(&rpmpds[i]->pd);
 	}
 
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
