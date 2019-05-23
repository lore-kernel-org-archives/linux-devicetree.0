From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] soc: qcom: apr: Don't use reg for domain id
Date: Thu, 23 May 2019 08:01:53 -0700
Message-ID: <20190523150153.13136-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The reg property represents the address and size on the bus that a
device lives, but for APR the parent is a rpmsg bus, which does not have
numerical addresses. Simply defining #address/#size-cells to 1 and 0,
respectively, to silence the compiler is not an appropriate solution.

Replace the use of "reg" with an APR specific property.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed example to match change

 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 6 +++---
 drivers/soc/qcom/apr.c                                  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index bcc612cc7423..db501269f47b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -9,7 +9,7 @@ used for audio/voice services on the QDSP.
 	Value type: <stringlist>
 	Definition: must be "qcom,apr-v<VERSION-NUMBER>", example "qcom,apr-v2"
 
-- reg
+- qcom,apr-domain
 	Usage: required
 	Value type: <u32>
 	Definition: Destination processor ID.
@@ -49,9 +49,9 @@ by the individual bindings for the specific service
 The following example represents a QDSP based sound card on a MSM8996 device
 which uses apr as communication between Apps and QDSP.
 
-	apr@4 {
+	apr {
 		compatible = "qcom,apr-v2";
-		reg = <APR_DOMAIN_ADSP>;
+		qcom,apr-domain = <APR_DOMAIN_ADSP>;
 
 		q6core@3 {
 			compatible = "qcom,q6core";
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 74f8b9607daa..b83d71b2e0a4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -276,7 +276,7 @@ static int apr_probe(struct rpmsg_device *rpdev)
 	if (!apr)
 		return -ENOMEM;
 
-	ret = of_property_read_u32(dev->of_node, "reg", &apr->dest_domain_id);
+	ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
 	if (ret) {
 		dev_err(dev, "APR Domain ID not specified in DT\n");
 		return ret;
-- 
2.18.0
