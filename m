From: Archit Taneja <architt@codeaurora.org>
Subject: [PATCH 3/3] dt/bindings: dmaengine: qcom_bam_dma: Add compatible string for BAM v1.3.0
Date: Thu, 18 Sep 2014 16:22:55 +0530
Message-ID: <1411037575-13153-3-git-send-email-architt@codeaurora.org>
References: <1411037575-13153-1-git-send-email-architt@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1411037575-13153-1-git-send-email-architt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org
Cc: galak@codeaurora.org, linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add compatible string for BAM v1.3.0 in the DT bindings documentation. Mentioned
a few more SoCs which have BAM v1.4.0 in them.

Cc: devicetree@vger.kernel.org
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index d75a9d7..83c8e57 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -1,7 +1,9 @@
 QCOM BAM DMA controller
 
 Required properties:
-- compatible: must contain "qcom,bam-v1.4.0" for MSM8974
+- compatible: must be one of the following:
+ * "qcom,bam-v1.4.0" for MSM8974, APQ8074 and APQ8084
+ * "qcom,bam-v1.3.0" for APQ8064 and MSM8960
 - reg: Address range for DMA registers
 - interrupts: Should contain the one interrupt shared by all channels
 - #dma-cells: must be <1>, the cell in the dmas property of the client device
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
