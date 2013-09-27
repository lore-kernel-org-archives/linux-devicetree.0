From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 2/2] max77693: added device tree support
Date: Fri, 27 Sep 2013 09:27:46 +0200
Message-ID: <1380266866-32103-1-git-send-email-a.hajda@samsung.com>
References: <20130927071744.GA5100@lee--X1>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130927071744.GA5100@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch adds only of_match_table.
There are no device specific properties.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Hi,

Spaces added.

Regards
Andrzej
---
 drivers/mfd/max77693.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 27f5da3..e0b11a9 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -225,11 +225,19 @@ static const struct dev_pm_ops max77693_pm = {
 	.resume = max77693_resume,
 };
 
+#ifdef CONFIG_OF
+static struct of_device_id max77693_dt_match[] = {
+	{ .compatible = "maxim,max77693" },
+	{},
+};
+#endif
+
 static struct i2c_driver max77693_i2c_driver = {
 	.driver = {
 		   .name = "max77693",
 		   .owner = THIS_MODULE,
 		   .pm = &max77693_pm,
+		   .of_match_table = of_match_ptr(max77693_dt_match),
 	},
 	.probe = max77693_i2c_probe,
 	.remove = max77693_i2c_remove,
-- 
1.8.1.2
