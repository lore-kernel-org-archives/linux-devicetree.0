From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: [RFC/PATCH 4/4] iommu: Add probe deferral support for IOMMU kernel modules
Date: Fri, 17 May 2019 11:47:37 -0700
Message-ID: <1558118857-16912-5-git-send-email-isaacm@codeaurora.org>
References: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558118857-16912-1-git-send-email-isaacm@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robh+dt@kernel.org, frowand.list@gmail.com, bhelgaas@google.com, joro@8bytes.org, robin.murphy@arm.com, will.deacon@arm.com, kernel-team@android.com, pratikp@codeaurora.org, lmark@codeaurora.org
List-Id: devicetree@vger.kernel.org

Currently, the IOMMU core assumes that all IOMMU drivers
will be built into the kernel. This makes it so that all
the IOMMU core will stop deferring probes when all of the
builtin kernel drivers have finished probing (i.e. when
initcalls are finished).

This is problematic if an IOMMU driver is generated as a module,
because the registration of the IOMMU driver may happen at an
unknown point in time after all builtin drivers have finished
probing.

Thus, if there exists a chance for the IOMMU driver
to be a module, then allow for clients to wait indefinitely
for the IOMMU driver to be loaded. Otherwise, rely on the
driver core to dictate when clients should stop deferring
their probes.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/of_iommu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index f04a6df..1e7e323 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -116,8 +116,12 @@ static int of_iommu_xlate(struct device *dev,
 	 * IOMMU device we're waiting for, which will be useful if we ever get
 	 * a proper probe-ordering dependency mechanism in future.
 	 */
-	if (!ops)
-		return driver_deferred_probe_check_state(dev);
+	if (!ops) {
+		if (IS_ENABLED(CONFIG_MODULES))
+			return -EPROBE_DEFER;
+		else
+			return driver_deferred_probe_check_state(dev);
+	}
 
 	return ops->of_xlate(dev, iommu_spec);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
