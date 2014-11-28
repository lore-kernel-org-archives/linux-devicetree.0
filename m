From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of: Remove unneeded and incorrect MODULE_DEVICE_TABLE
Date: Fri, 28 Nov 2014 00:00:15 +0000
Message-ID: <1417132815-22949-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
List-Id: devicetree@vger.kernel.org

The unittest code has a MODULE_DEVICE_TABLE that isn't needed by any of
the unittests, and isn't even correct. Remove it.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
This applies against my devicetree/next branch, and I am applying it right away.

 drivers/of/unittest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index cc0c5ec5d464..7a7ae07d592f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -965,7 +965,6 @@ static struct of_device_id selftest_match[] = {
 	{ .compatible = "selftest", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, altera_jtaguart_match);
 
 static struct platform_driver selftest_driver = {
 	.probe			= selftest_probe,
-- 
1.9.1
