From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2 v2] mfd: arizona: Add DT binding for the DMIC reference voltages
Date: Tue,  3 Mar 2015 15:04:53 +0000
Message-ID: <1425395094-22397-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: sameo@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add a DT binding that lets the DMIC reference voltage source be
specified for each input.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

The only change since rev 1 is a slight tweak to the wording of
everything to make clear these are voltages.

Thanks,
Charles

 drivers/mfd/arizona-core.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 09ba8f1..d6f306e 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -561,6 +561,16 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
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
