From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm-smmu: Add an optional "input-address-size" property
Date: Thu, 10 Oct 2019 20:46:08 -0700
Message-ID: <20191011034609.13319-2-nicoleotsuka@gmail.com>
References: <20191011034609.13319-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011034609.13319-1-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org, robin.murphy@arm.com
Cc: vdumpa@nvidia.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some SMMU instances may not connect all input address lines physically
but drive some upper address bits to logical zero, depending on their
SoC designs. Some of them even connect only 39 bits that is not in the
list of IAS/OAS from SMMU internal IDR registers.

Since this can be an SoC design decision, this patch adds an optional
property to specify how many input bits being physically connected.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
index 3133f3ba7567..a9373a2964a3 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
@@ -97,6 +97,13 @@ conditions.
 - power-domains:  Specifiers for power domains required to be powered on for
                   the SMMU to operate, as per generic power domain bindings.
 
+- input-address-size: Number of address bits being physically connected to an
+                  SMMU instance, as the input virtual address width. SoC might
+                  tie some upper address bits to logical zero inside the SMMU
+                  wrapper, so SMMU would only support a virtual address input
+                  size, corresponding to physically connected bits, instead of
+                  the reading from register.
+
 ** Deprecated properties:
 
 - mmu-masters (deprecated in favour of the generic "iommus" binding) :
-- 
2.17.1
