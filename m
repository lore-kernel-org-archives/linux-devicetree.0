From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] vfio: platform: Fix reset module leak in error path
Date: Tue, 13 Feb 2018 17:36:54 +0100
Message-ID: <1518539815-13774-2-git-send-email-geert+renesas@glider.be>
References: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518539815-13774-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

If the IOMMU group setup fails, the reset module is not released.

Fixes: b5add544d677d363 ("vfio, platform: make reset driver a requirement by default")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/vfio/platform/vfio_platform_common.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 35469af87f88678e..b60bb5326668498c 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -680,18 +680,23 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 	group = vfio_iommu_group_get(dev);
 	if (!group) {
 		pr_err("VFIO: No IOMMU group for device %s\n", vdev->name);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_reset;
 	}
 
 	ret = vfio_add_group_dev(dev, &vfio_platform_ops, vdev);
-	if (ret) {
-		vfio_iommu_group_put(group, dev);
-		return ret;
-	}
+	if (ret)
+		goto put_iommu;
 
 	mutex_init(&vdev->igate);
 
 	return 0;
+
+put_iommu:
+	vfio_iommu_group_put(group, dev);
+put_reset:
+	vfio_platform_put_reset(vdev);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vfio_platform_probe_common);
 
-- 
2.7.4
