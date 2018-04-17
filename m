From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 3/3] fpga: fpga-region: comment on fpga_region_program_fpga locking
Date: Mon, 16 Apr 2018 20:43:37 -0700
Message-ID: <20180417034337.8855-4-mdf@kernel.org>
References: <20180417034337.8855-1-mdf@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417034337.8855-1-mdf@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linux-foundation.org
Cc: linux-fpga.vger@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, atull@kernel.org, robh+dt@kernel.org, Moritz Fischer <mdf@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@kernel.org>

Add a comment to the header of fpga_region_program_fpga()
regarding locking of the bridges.

Signed-off-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/fpga-region.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index edab2a2e03ef..cb0603e07ff8 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -95,6 +95,11 @@ static void fpga_region_put(struct fpga_region *region)
  * fpga_region_program_fpga - program FPGA
  * @region: FPGA region
  * Program an FPGA using fpga image info (region->info).
+ * If the region has a get_bridges function, the exclusive reference for the
+ * bridges will be held if programming succeeds.  This is intended to prevent
+ * reprogramming the region until the caller considers it safe to do so.
+ * The caller will need to call fpga_bridges_put() before attempting to
+ * reprogram the region.
  * Return 0 for success or negative error code.
  */
 int fpga_region_program_fpga(struct fpga_region *region)
-- 
2.17.0
