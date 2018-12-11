From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 10/10] soc: qcom: rpmhpd: Mark mx as a parent for cx
Date: Tue, 11 Dec 2018 15:19:38 +0530
Message-ID: <20181211094938.25086-11-rnayak@codeaurora.org>
References: <20181211094938.25086-1-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211094938.25086-1-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, robh@kernel.org, viresh.kumar@linaro.org, sboyd@kernel.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Specify the active + sleep and active-only MX power domains as
the parents of the corresponding CX power domains. This will ensure that
performance state requests on CX automatically generate equivalent requests
on MX power domains.

This is used to enforce a requirement that exists for various
hardware blocks on SDM845 that MX performance state >= CX performance
state for a given operating frequency.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
This patch is dependent on the series from
Viresh [1] which adds support to propogate performance states across the
power domain hierarchy which is still being reviewed.

[1] https://lkml.org/lkml/2018/11/26/333

 drivers/soc/qcom/rpmhpd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 1ce86f0cc9fa..af7b07d49e4f 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -102,12 +102,14 @@ static struct rpmhpd sdm845_cx_ao;
 static struct rpmhpd sdm845_cx = {
 	.pd = { .name = "cx", },
 	.peer = &sdm845_cx_ao,
+	.parent = &sdm845_mx.pd,
 	.res_name = "cx.lvl",
 };
 
 static struct rpmhpd sdm845_cx_ao = {
 	.pd = { .name = "cx_ao", },
 	.peer = &sdm845_cx,
+	.parent = &sdm845_mx_ao.pd,
 	.res_name = "cx.lvl",
 };
 
@@ -389,6 +391,15 @@ static int rpmhpd_probe(struct platform_device *pdev)
 		data->domains[i] = &rpmhpds[i]->pd;
 	}
 
+	/* Add subdomains */
+	for (i = 0; i < num_pds; i++) {
+		if (!rpmhpds[i])
+			continue;
+		if (rpmhpds[i]->parent)
+			pm_genpd_add_subdomain(rpmhpds[i]->parent,
+					       &rpmhpds[i]->pd);
+	}
+
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, data);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
