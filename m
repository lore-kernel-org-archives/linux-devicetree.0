From: srinivas.kandagatla@linaro.org
Subject: [PATCH v2 2/5] dt-bindings: dmaengine: bam_dma: add remote controlled bindings
Date: Wed, 14 Feb 2018 14:44:56 +0000
Message-ID: <20180214144459.29813-3-srinivas.kandagatla@linaro.org>
References: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180214144459.29813-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: vinod.koul@intel.com, andy.gross@linaro.org, dmaengine@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, david.brown@linaro.org, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, yanhe@quicinc.com, ramkri@qti.qualcomm.com, sdharia@quicinc.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch adds 2 new properties for remote controlled bam dt bindings.
1. num-channels to indicate number of dma channels.
2. qcom,num-ees to indicate number of Execution Environments.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index 9cbf5d9df8fd..cf5b9e44432c 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -15,6 +15,10 @@ Required properties:
   the secure world.
 - qcom,controlled-remotely : optional, indicates that the bam is controlled by
   remote proccessor i.e. execution environment.
+- num-channels : optional, indicates supported number of DMA channels in a
+  remotely controlled bam.
+- qcom,num-ees : optional, indicates supported number of Execution Environments
+  in a remotely controlled bam.
 
 Example:
 
-- 
2.15.1
