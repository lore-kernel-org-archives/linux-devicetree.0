From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/5] mfd: arizona: Add DT binding for setting 32kHz clock source
Date: Sat, 28 Feb 2015 14:54:24 +0000
Message-ID: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee@kernel.org
Cc: sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/mfd/arizona-core.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 09ba8f1..dddaaef 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -552,6 +552,9 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 			ret);
 	}
 
+	of_property_read_u32(arizona->dev->of_node, "wlf,clk32k-src",
+			     &pdata->clk32k_src);
+
 	of_property_for_each_u32(arizona->dev->of_node, "wlf,inmode", prop,
 				 cur, val) {
 		if (count == ARRAY_SIZE(arizona->pdata.inmode))
-- 
1.7.2.5
