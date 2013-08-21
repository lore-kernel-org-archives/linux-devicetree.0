Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24828 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab3HUQxy (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 12:53:54 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v3 2/2] max77693: added device tree support
Date: Wed, 21 Aug 2013 18:53:34 +0200
Message-id: <1377104014-21910-3-git-send-email-a.hajda@samsung.com>
In-reply-to: <1377104014-21910-1-git-send-email-a.hajda@samsung.com>
References: <1377104014-21910-1-git-send-email-a.hajda@samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patch adds only of_match_table.
There are no device specific properties.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
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
+	{.compatible = "maxim,max77693"},
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

