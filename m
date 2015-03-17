From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] of: unittest: Add option string test case with longer path
Date: Tue, 17 Mar 2015 12:30:32 -0700
Message-ID: <1426620632-23383-2-git-send-email-computersforpeace@gmail.com>
References: <1425924225-22748-2-git-send-email-leif.lindholm@linaro.org>
 <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426620632-23383-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Peter Hurley <peter@hurleysoftware.com>, Leif Lindholm <leif.lindholm@linaro.org>, stable@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There were regressions seen with commit 106937e8ccdc ("of: fix handling
of '/' in options for of_find_node_by_path()"), where we couldn't handle
extra '/' before the ':'. Let's test for this now.

Confirmed that this test fails without the previous patch and passes
when patched. All other tests pass.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/of/unittest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index aba8946cac46..52c45c7df07f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -97,6 +97,11 @@ static void __init of_selftest_find_node_by_name(void)
 		 "option path test, subcase #1 failed\n");
 	of_node_put(np);
 
+	np = of_find_node_opts_by_path("/testcase-data/testcase-device1:test/option", &options);
+	selftest(np && !strcmp("test/option", options),
+		 "option path test, subcase #2 failed\n");
+	of_node_put(np);
+
 	np = of_find_node_opts_by_path("/testcase-data:testoption", NULL);
 	selftest(np, "NULL option path test failed\n");
 	of_node_put(np);
-- 
1.9.1
