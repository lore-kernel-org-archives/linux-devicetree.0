From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 3/5] mfd: arizona: Add DT binding for the DMIC references
Date: Sat, 28 Feb 2015 14:54:26 +0000
Message-ID: <1425135268-32340-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee@kernel.org
Cc: sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/mfd/arizona-core.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index dddaaef..6002ce9 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -564,6 +564,16 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 		count++;
 	}
 
+	count = 0;
+	of_property_for_each_u32(arizona->dev->of_node, "wlf,dmic-ref", prop,
+				 cur, val) {
+		if (count == ARRAY_SIZE(arizona->pdata.dmic_ref))
+			break;
+
+		arizona->pdata.dmic_ref[count] = val;
+		count++;
+	}
+
 	return 0;
 }
 
-- 
1.7.2.5
