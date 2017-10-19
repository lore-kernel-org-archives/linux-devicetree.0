From: Chris Lew <clew@codeaurora.org>
Subject: [PATCH 3/3] rpmsg: glink: Use best fit intent during tx
Date: Wed, 18 Oct 2017 18:10:18 -0700
Message-ID: <1508375418-15611-4-git-send-email-clew@codeaurora.org>
References: <1508375418-15611-1-git-send-email-clew@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1508375418-15611-1-git-send-email-clew@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: aneela@codeaurora.org, smaliyap@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, clew@codeaurora.org
List-Id: devicetree@vger.kernel.org

Intents can vary in size, try to find the best fitting remote intent
instead of first fit when sending a message to the remote proc.

Signed-off-by: Chris Lew <clew@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 05e04a8943e3..650974f85a4c 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1251,11 +1251,16 @@ static int __qcom_glink_send(struct glink_channel *channel,
 			spin_lock_irqsave(&channel->intent_lock, flags);
 			idr_for_each_entry(&channel->riids, tmp, iid) {
 				if (tmp->size >= len && !tmp->in_use) {
-					tmp->in_use = true;
-					intent = tmp;
-					break;
+					if (!intent)
+						intent = tmp;
+					else if (intent->size > tmp->size)
+						intent = tmp;
+					if (intent->size == len)
+						break;
 				}
 			}
+			if (intent)
+				intent->in_use = true;
 			spin_unlock_irqrestore(&channel->intent_lock, flags);
 
 			/* We found an available intent */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
