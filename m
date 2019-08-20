From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Date: Tue, 20 Aug 2019 13:06:27 -0600
Message-ID: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>
List-Id: devicetree@vger.kernel.org

Add a compatible string to identify SMMUs that are attached
to Adreno GPU devices that wish to support split pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3b..3b07896 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -18,6 +18,7 @@ conditions.
                         "arm,mmu-500"
                         "cavium,smmu-v2"
                         "qcom,smmu-v2"
+			"qcom,adreno-smmu-v2"
 
                   depending on the particular implementation and/or the
                   version of the architecture implemented.
@@ -31,6 +32,12 @@ conditions.
                   as below, SoC-specific compatibles:
                   "qcom,sdm845-smmu-500", "arm,mmu-500"
 
+		  "qcom,adreno-smmu-v2" is a special implementation for
+		  SMMU devices attached to the Adreno GPU on Qcom devices.
+		  If selected, this will enable split pagetable (TTBR1)
+		  support. Only use this if the GPU target is capable of
+		  supporting 64 bit addresses.
+
 - reg           : Base address and size of the SMMU.
 
 - #global-interrupts : The number of global interrupts exposed by the
-- 
2.7.4
