From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: [PATCH 8/8] iommu/arm-smmu-v3: Add support for PCI PASID
Date: Mon, 10 Jun 2019 19:47:14 +0100
Message-ID: <20190610184714.6786-9-jean-philippe.brucker@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: will.deacon@arm.com
Cc: joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com, robin.murphy@arm.com, jacob.jun.pan@linux.intel.com, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, eric.auger@redhat.com
List-Id: devicetree@vger.kernel.org

Enable PASID for PCI devices that support it. Since the SSID tables are
allocated by arm_smmu_attach_dev(), PASID has to be enabled early enough.
arm_smmu_dev_feature_enable() would be too late, since by that time the
main DMA domain has already been attached. Do it in add_device() instead.

Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
---
 drivers/iommu/arm-smmu-v3.c | 51 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 972bfb80f964..a8a516d9ff10 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2197,6 +2197,49 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 	master->ats_enabled = false;
 }
 
+static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
+{
+	int ret;
+	int features;
+	int num_pasids;
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(master->dev))
+		return -ENOSYS;
+
+	pdev = to_pci_dev(master->dev);
+
+	features = pci_pasid_features(pdev);
+	if (features < 0)
+		return -ENOSYS;
+
+	num_pasids = pci_max_pasids(pdev);
+	if (num_pasids <= 0)
+		return -ENOSYS;
+
+	ret = pci_enable_pasid(pdev, features);
+	if (!ret)
+		master->ssid_bits = min_t(u8, ilog2(num_pasids),
+					  master->smmu->ssid_bits);
+	return ret;
+}
+
+static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(master->dev))
+		return;
+
+	pdev = to_pci_dev(master->dev);
+
+	if (!pdev->pasid_enabled)
+		return;
+
+	pci_disable_pasid(pdev);
+	master->ssid_bits = 0;
+}
+
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
 {
 	unsigned long flags;
@@ -2413,6 +2456,9 @@ static int arm_smmu_add_device(struct device *dev)
 
 	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
 
+	/* Note that PASID must be enabled before, and disabled after ATS */
+	arm_smmu_enable_pasid(master);
+
 	/*
 	 * If the SMMU doesn't support 2-stage CD, limit the linear
 	 * tables to a reasonable number of contexts, let's say
@@ -2423,7 +2469,7 @@ static int arm_smmu_add_device(struct device *dev)
 
 	ret = iommu_device_link(&smmu->iommu, dev);
 	if (ret)
-		goto err_free_master;
+		goto err_disable_pasid;
 
 	group = iommu_group_get_for_dev(dev);
 	if (IS_ERR(group)) {
@@ -2436,6 +2482,8 @@ static int arm_smmu_add_device(struct device *dev)
 
 err_unlink:
 	iommu_device_unlink(&smmu->iommu, dev);
+err_disable_pasid:
+	arm_smmu_disable_pasid(master);
 err_free_master:
 	kfree(master);
 	fwspec->iommu_priv = NULL;
@@ -2456,6 +2504,7 @@ static void arm_smmu_remove_device(struct device *dev)
 	arm_smmu_detach_dev(master);
 	iommu_group_remove_device(dev);
 	iommu_device_unlink(&smmu->iommu, dev);
+	arm_smmu_disable_pasid(master);
 	kfree(master);
 	iommu_fwspec_free(dev);
 }
-- 
2.21.0
