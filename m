From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] soc: qcom: Update properties for smem state referencing
Date: Thu,  9 Jun 2016 22:26:25 -0700
Message-ID: <1465536385-32215-1-git-send-email-bjorn.andersson@linaro.org>
References: <1465531882-25967-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1465531882-25967-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the property names to match device tree bindings, the correct
values should be qcom,smem-states and qcom,smem-state-names.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Realised that we already define the smp2p and smsm nodes in mainline, so don't
change the #qcom,state-cells property.

 drivers/soc/qcom/smem_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index 54261decb369..4e4d5cd3b3cc 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -104,21 +104,21 @@ struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
 
 	if (con_id) {
 		index = of_property_match_string(dev->of_node,
-						 "qcom,state-names",
+						 "qcom,smem-state-names",
 						 con_id);
 		if (index < 0) {
-			dev_err(dev, "missing qcom,state-names\n");
+			dev_err(dev, "missing qcom,smem-state-names\n");
 			return ERR_PTR(index);
 		}
 	}
 
 	ret = of_parse_phandle_with_args(dev->of_node,
-					 "qcom,state",
+					 "qcom,smem-states",
 					 "#qcom,state-cells",
 					 index,
 					 &args);
 	if (ret) {
-		dev_err(dev, "failed to parse qcom,state property\n");
+		dev_err(dev, "failed to parse qcom,smem-states property\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.5.0
