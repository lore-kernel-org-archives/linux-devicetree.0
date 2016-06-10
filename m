From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] soc: qcom: Update properties for smem state referencing
Date: Thu,  9 Jun 2016 21:11:22 -0700
Message-ID: <1465531882-25967-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the property names to match device tree bindings, the correct
values should be qcom,smem-states and qcom,smem-state-names.

Also update the #qcom,smem-state-cells for consistency, before we merge
any users of these properties.

Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt |  4 ++--
 Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt  |  4 ++--
 drivers/soc/qcom/smem_state.c                             | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
index 5cc82b8353d8..af9ca37221ce 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.txt
@@ -68,7 +68,7 @@ important.
 	Value type: <u32>
 	Definition: must be 2 - denoting the bit in the entry and IRQ flags
 
-- #qcom,state-cells:
+- #qcom,smem-state-cells:
 	Usage: required for outgoing entries
 	Value type: <u32>
 	Definition: must be 1 - denoting the bit in the entry
@@ -92,7 +92,7 @@ wcnss-smp2p {
 	wcnss_smp2p_out: master-kernel {
 		qcom,entry-name = "master-kernel";
 
-		#qcom,state-cells = <1>;
+		#qcom,smem-state-cells = <1>;
 	};
 
 	wcnss_smp2p_in: slave-kernel {
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
index a6634c70850d..2993b5a97dd6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smsm.txt
@@ -51,7 +51,7 @@ important.
 	Definition: specifies the offset, in words, of the first bit for this
 		    entry
 
-- #qcom,state-cells:
+- #qcom,smem-state-cells:
 	Usage: required for local entry
 	Value type: <u32>
 	Definition: must be 1 - denotes bit number
@@ -91,7 +91,7 @@ smsm {
 	apps_smsm: apps@0 {
 		reg = <0>;
 
-		#qcom,state-cells = <1>;
+		#qcom,smem-state-cells = <1>;
 	};
 
 	wcnss_smsm: wcnss@7 {
diff --git a/drivers/soc/qcom/smem_state.c b/drivers/soc/qcom/smem_state.c
index 54261decb369..d5437ca76ed9 100644
--- a/drivers/soc/qcom/smem_state.c
+++ b/drivers/soc/qcom/smem_state.c
@@ -104,26 +104,26 @@ struct qcom_smem_state *qcom_smem_state_get(struct device *dev,
 
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
-					 "#qcom,state-cells",
+					 "qcom,smem-states",
+					 "#qcom,smem-state-cells",
 					 index,
 					 &args);
 	if (ret) {
-		dev_err(dev, "failed to parse qcom,state property\n");
+		dev_err(dev, "failed to parse qcom,smem-states property\n");
 		return ERR_PTR(ret);
 	}
 
 	if (args.args_count != 1) {
-		dev_err(dev, "invalid #qcom,state-cells\n");
+		dev_err(dev, "invalid #qcom,smem-state-cells\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
