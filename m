From: Andy Gross <agross@codeaurora.org>
Subject: [PATCH 2/2] dmaengine: qcom_bam_dma: Add binding for v1.3.0
Date: Wed, 16 Apr 2014 16:45:19 -0500
Message-ID: <1397684719-30065-3-git-send-email-agross@codeaurora.org>
References: <1397684719-30065-1-git-send-email-agross@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397684719-30065-1-git-send-email-agross@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, Andy Gross <agross@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add the device tree binding support for the v1.3.0 version of the QCOM BAM DMA
driver.

Signed-off-by: Andy Gross <agross@codeaurora.org>
---
 .../devicetree/bindings/dma/qcom_bam_dma.txt       |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
index d75a9d7..802572f 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
@@ -1,7 +1,9 @@
 QCOM BAM DMA controller
 
 Required properties:
-- compatible: must contain "qcom,bam-v1.4.0" for MSM8974
+- compatible: must contain one of the following:
+			"qcom,bam-v1.4.0" for MSM8974
+			"qcom,bam-v1.3.0" for APQ8064, IPQ8064, MSM8x64
 - reg: Address range for DMA registers
 - interrupts: Should contain the one interrupt shared by all channels
 - #dma-cells: must be <1>, the cell in the dmas property of the client device
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
