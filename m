From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v1 1/2] iommu: pass cell_count = -1 to of_for_each_phandle with cells_name
Date: Sat, 24 Aug 2019 15:28:45 +0200
Message-ID: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Currently of_for_each_phandle ignores the cell_count parameter when a
cells_name is given. I intend to change that and let the iterator fall
back to a non-negative cell_count if the cells_name property is missing
in the referenced node.

To not change how existing of_for_each_phandle's users iterate, fix them
to pass cell_count = -1 when also cells_name is given which yields the
expected behaviour with and without my change.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iommu/arm-smmu.c     | 2 +-
 drivers/iommu/mtk_iommu_v1.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 64977c131ee6..81b7734654b3 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -333,7 +333,7 @@ static int __find_legacy_master_phandle(struct device *dev, void *data)
 	int err;
 
 	of_for_each_phandle(it, err, dev->of_node, "mmu-masters",
-			    "#stream-id-cells", 0)
+			    "#stream-id-cells", -1)
 		if (it->node == np) {
 			*(void **)data = dev;
 			return 1;
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index abeeac488372..68d1de70de0c 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -426,7 +426,7 @@ static int mtk_iommu_add_device(struct device *dev)
 	int err;
 
 	of_for_each_phandle(&it, err, dev->of_node, "iommus",
-			"#iommu-cells", 0) {
+			"#iommu-cells", -1) {
 		int count = of_phandle_iterator_args(&it, iommu_spec.args,
 					MAX_PHANDLE_ARGS);
 		iommu_spec.np = of_node_get(it.node);
-- 
2.20.1
