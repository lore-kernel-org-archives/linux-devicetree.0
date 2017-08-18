From: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH] spmi: pmic-arb: Enforce the ownership check optionally
Date: Fri, 18 Aug 2017 17:24:36 +0530
Message-ID: <1503057279-27318-1-git-send-email-kgunda@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Abhijeet Dharmapurikar <adharmap-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Collins <collinsd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The peripheral ownership check is not necessary on single master
platforms. Hence, enforce the peripheral ownership check optioanlly.

Signed-off-by: Kiran Gunda <kgunda-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
This patch depends on the below patch series. Please take this patch
along with this series.

[PATCH V2 00/12]: spmi: pmic-arb: Support for HW v5 and other fixes

 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt | 6 ++++++
 drivers/spmi/spmi-pmic-arb.c                                  | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
index e16b9b5..da708e8 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -42,6 +42,10 @@ Required properties:
     cell 4: interrupt flags indicating level-sense information, as defined in
             dt-bindings/interrupt-controller/irq.h
 
+Optional properties:
+- qcom,enforce-ownership : A boolean property. If defined the peripheral
+			   ownership check is enforced. Otherwise the ownership
+			   check is ignored.
 Example:
 
 	spmi {
@@ -62,4 +66,6 @@ Example:
 
 		interrupt-controller;
 		#interrupt-cells = <4>;
+
+		qcom,enforce-ownership;
 	};
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index ca9bdd3..354c949 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -167,6 +167,7 @@ struct spmi_pmic_arb {
 	u16			*ppid_to_apid;
 	u16			last_apid;
 	struct apid_data	apid_data[PMIC_ARB_MAX_PERIPHS];
+	bool			enforce_ownership;
 };
 
 /**
@@ -707,7 +708,8 @@ static int qpnpint_irq_domain_dt_translate(struct irq_domain *d,
 	}
 
 	apid = rc;
-	if (pmic_arb->apid_data[apid].irq_ee != pmic_arb->ee) {
+	if (pmic_arb->enforce_ownership &&
+			pmic_arb->apid_data[apid].irq_ee != pmic_arb->ee) {
 		dev_err(&pmic_arb->spmic->dev, "failed to xlate sid = %#x, periph = %#x, irq = %u: ee=%u but owner=%u\n",
 			intspec[0], intspec[1], intspec[2], pmic_arb->ee,
 			pmic_arb->apid_data[apid].irq_ee);
@@ -1236,6 +1238,9 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	}
 
 	pmic_arb->ee = ee;
+	pmic_arb->enforce_ownership =
+	    of_property_read_bool(pdev->dev.of_node, "qcom,enforce-ownership");
+
 	mapping_table = devm_kcalloc(&ctrl->dev, PMIC_ARB_MAX_PERIPHS,
 					sizeof(*mapping_table), GFP_KERNEL);
 	if (!mapping_table) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
