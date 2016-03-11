From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V2 2/3] vfio, platform: make reset driver a requirement
Date: Fri, 11 Mar 2016 11:54:34 -0500
Message-ID: <1457715275-11925-3-git-send-email-okaya@codeaurora.org>
References: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457715275-11925-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kvm@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, eric.auger@linaro.org
Cc: shankerd@codeaurora.org, vikrams@codeaurora.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, vinod.koul@intel.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Baptiste Reynal <b.reynal@virtualopensystems.com>, Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The code was allowing platform devices to be used without a supporting VFIO
reset driver. The hardware can be left in some inconsistent state after a
guest machine abort.

The reset driver will put the hardware back to safe state and disable
interrupts before returning the control back to the host machine.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 drivers/vfio/platform/vfio_platform_common.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index b3f6ba2..5535fe1 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -165,12 +165,8 @@ static void vfio_platform_release(void *device_data)
 	mutex_lock(&driver_lock);
 
 	if (!(--vdev->refcnt)) {
-		if (vdev->reset) {
-			dev_info(vdev->device, "reset\n");
-			vdev->reset(vdev);
-		} else {
-			dev_warn(vdev->device, "no reset function found!\n");
-		}
+		dev_info(vdev->device, "reset\n");
+		vdev->reset(vdev);
 		vfio_platform_regions_cleanup(vdev);
 		vfio_platform_irq_cleanup(vdev);
 	}
@@ -634,7 +630,13 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 		return ret;
 	}
 
-	vfio_platform_get_reset(vdev);
+	ret = vfio_platform_get_reset(vdev);
+	if (ret) {
+		pr_err("vfio: no reset function found for device %s\n",
+		       vdev->name);
+		iommu_group_put(group);
+		return ret;
+	}
 	mutex_init(&vdev->igate);
 
 	return 0;
-- 
1.8.2.1
