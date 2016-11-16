From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH 1/4] DW DMAC: rename is_private property as ordered by DT policy
Date: Wed, 16 Nov 2016 16:56:52 +0300
Message-ID: <1479304615-11360-2-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, vireshk@kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

Rename is_private to is-private as ordered by DT policy.
The change leaves the support for the old format.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/dma/dw/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 5bda0eb..4103f1d 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -128,6 +128,8 @@ dw_dma_parse_dt(struct platform_device *pdev)
 
 	if (of_property_read_bool(np, "is_private"))
 		pdata->is_private = true;
+	else if (of_property_read_bool(np, "is-private"))
+		pdata->is_private = true;
 
 	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
 		pdata->chan_allocation_order = (unsigned char)tmp;
-- 
2.5.5
