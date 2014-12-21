From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 12/28] of: drop owner assignment from platform_drivers
Date: Sun, 21 Dec 2014 22:14:33 +0100
Message-ID: <1419196495-9626-13-git-send-email-wsa@the-dreams.de>
References: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This platform_driver does not need to set an owner, it will be populated by the
driver core.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
Generated with coccinelle. SmPL file is in the introductory msg. The big
cleanup was pulled in this merge window. This series catches the bits fallen
through. The patches shall go in via the subsystem trees.

 drivers/of/unittest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 844838e11ef1..c5fb657eb8cc 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1000,7 +1000,6 @@ static struct platform_driver selftest_driver = {
 	.remove			= selftest_remove,
 	.driver = {
 		.name		= "selftest",
-		.owner		= THIS_MODULE,
 		.of_match_table	= of_match_ptr(selftest_match),
 	},
 };
-- 
2.1.3
