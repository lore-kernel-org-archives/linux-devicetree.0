From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of/selftest: clean-up of_selftest_platform_populate pass/fail handling
Date: Tue, 13 May 2014 11:18:28 -0500
Message-ID: <1399997908-30916-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Move the pass/fail checks into selftest() calls instead of a separate if
condition. Unconditionally calling pass was wrong.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/selftest.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index fe70b86..c1d7d38 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -440,22 +440,18 @@ static void __init of_selftest_platform_populate(void)
 	/* Test that a missing irq domain returns -EPROBE_DEFER */
 	np = of_find_node_by_path("/testcase-data/testcase-device1");
 	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		selftest(0, "device 1 creation failed\n");
+	selftest(pdev, "device 1 creation failed\n");
+
 	irq = platform_get_irq(pdev, 0);
-	if (irq != -EPROBE_DEFER)
-		selftest(0, "device deferred probe failed - %d\n", irq);
+	selftest(irq == -EPROBE_DEFER, "device deferred probe failed - %d\n", irq);
 
 	/* Test that a parsing failure does not return -EPROBE_DEFER */
 	np = of_find_node_by_path("/testcase-data/testcase-device2");
 	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		selftest(0, "device 2 creation failed\n");
+	selftest(pdev, "device 2 creation failed\n");
 	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0 || irq == -EPROBE_DEFER)
-		selftest(0, "device parsing error failed - %d\n", irq);
+	selftest(irq < 0 && irq != -EPROBE_DEFER, "device parsing error failed - %d\n", irq);
 
-	selftest(1, "passed");
 }
 
 static int __init of_selftest(void)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
