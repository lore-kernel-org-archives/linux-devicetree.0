From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] soc: qcom: apr: Don't use reg for domain id
Date: Tue, 21 May 2019 18:53:42 -0700
Message-ID: <20190522015342.29501-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

The reg property represents the address and size on the bus that a
device lives, but for APR the parent is a rpmsg bus, which does not have
numerical addresses. Simply defining #address/#size-cells to 1 and 0,
respectively, to silence the compiler is not an appropriate solution.

Replace the use of "reg" with an APR specific property.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

The APR device was recently added to msm8996.dtsi, but this is still
depending on working SMMU to provide functional audio support.

 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 2 +-
 drivers/soc/qcom/apr.c                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index bcc612cc7423..38d3c06abc41 100644
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
