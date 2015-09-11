From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 3/6] extcon: arizona: Ignore jd_invert for MICD_CLAMP_STS
Date: Fri, 11 Sep 2015 13:14:15 +0100
Message-ID: <1441973658-26234-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

From: Nariman Poushin <nariman@opensource.wolfsonmicro.com>

The polarity of MICD_CLAMP_STS does not change when different clamp
modes are used, this patch corrects this issue.

Signed-off-by: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---

No change since v1.

 drivers/extcon/extcon-arizona.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 7bfaacd..6d030a0 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1059,10 +1059,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	if (arizona->pdata.jd_gpio5) {
 		mask = ARIZONA_MICD_CLAMP_STS;
-		if (arizona->pdata.jd_invert)
-			present = ARIZONA_MICD_CLAMP_STS;
-		else
-			present = 0;
+		present = 0;
 	} else {
 		mask = ARIZONA_JD1_STS;
 		if (arizona->pdata.jd_invert)
-- 
1.7.2.5
