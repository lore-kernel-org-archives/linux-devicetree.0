From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 2/2] iommu/arm-smmu: Read optional "input-address-size" property
Date: Thu, 10 Oct 2019 20:46:09 -0700
Message-ID: <20191011034609.13319-3-nicoleotsuka@gmail.com>
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

After the "input-address-size" property is added to DT bindings, this
patch reads and applies to va_size as an input virtual address width.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/arm-smmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index b18aac4c105e..b80a869de45b 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1805,12 +1805,14 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 			 "failed to set DMA mask for table walker\n");
 
 	if (smmu->version < ARM_SMMU_V2) {
-		smmu->va_size = smmu->ipa_size;
+		if (!smmu->va_size)
+			smmu->va_size = smmu->ipa_size;
 		if (smmu->version == ARM_SMMU_V1_64K)
 			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
 	} else {
 		size = FIELD_GET(ID2_UBS, id);
-		smmu->va_size = arm_smmu_id_size_to_bits(size);
+		if (!smmu->va_size)
+			smmu->va_size = arm_smmu_id_size_to_bits(size);
 		if (id & ID2_PTFS_4K)
 			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
 		if (id & ID2_PTFS_16K)
@@ -1950,6 +1952,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	const struct arm_smmu_match_data *data;
 	struct device *dev = &pdev->dev;
 	bool legacy_binding;
+	u32 va_size;
 
 	if (of_property_read_u32(dev->of_node, "#global-interrupts",
 				 &smmu->num_global_irqs)) {
@@ -1976,6 +1979,9 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	if (of_dma_is_coherent(dev->of_node))
 		smmu->features |= ARM_SMMU_FEAT_COHERENT_WALK;
 
+	if (!of_property_read_u32(dev->of_node, "input-address-size", &va_size))
+		smmu->va_size = va_size;
+
 	return 0;
 }
 
-- 
2.17.1
