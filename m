From: matthew.gerlach@linux.intel.com
Subject: [PATCH v4 1/4] fpga: add config complete timeout
Date: Thu,  2 Mar 2017 07:57:09 -0800
Message-ID: <1488470232-20412-2-git-send-email-matthew.gerlach@linux.intel.com>
References: <1488470232-20412-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488470232-20412-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@opensource.altera.com>

Adding timeout for maximum allowed time for FPGA to go to
operating mode after a FPGA region has been programmed.

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/fpga/fpga-region.c    | 3 +++
 include/linux/fpga/fpga-mgr.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index 3222fdb..28401cb 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -381,6 +381,9 @@ static int fpga_region_notify_pre_apply(struct fpga_region *region,
 	of_property_read_u32(nd->overlay, "region-freeze-timeout-us",
 			     &info->disable_timeout_us);
 
+	of_property_read_u32(nd->overlay, "config-complete-timeout-us",
+			     &info->config_complete_timeout_us);
+
 	/* If FPGA was externally programmed, don't specify firmware */
 	if ((info->flags & FPGA_MGR_EXTERNAL_CONFIG) && firmware_name) {
 		pr_err("error: specified firmware and external-fpga-config");
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 57beb5d..fd3f083 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -76,11 +76,14 @@ enum fpga_mgr_states {
  * @flags: boolean flags as defined above
  * @enable_timeout_us: maximum time to enable traffic through bridge (uSec)
  * @disable_timeout_us: maximum time to disable traffic through bridge (uSec)
+ * @config_complete_timeout_us: maximum time for FPGA to switch to operating
+ *	   status in the write_complete op.
  */
 struct fpga_image_info {
 	u32 flags;
 	u32 enable_timeout_us;
 	u32 disable_timeout_us;
+	u32 config_complete_timeout_us;
 };
 
 /**
-- 
2.7.4
