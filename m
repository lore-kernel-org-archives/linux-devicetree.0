From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH] of/selftest: remove the duplicate of_changeset_init
Date: Mon, 2 Mar 2015 06:49:21 +0000
Message-ID: <1425278961-29678-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pantelis.antoniou@konsulko.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, long.wanglong@huawei.com, peifeiyue@huawei.com
List-Id: devicetree@vger.kernel.org

Remove the duplicate of_changeset_init. In of_selftest_changeset
testcase, the "struct of_changeset chgset" is initialized twice,
but only once is enough. so, drop the first initializtion code.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 drivers/of/unittest.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 0cf9a23..199fb23 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -478,7 +478,6 @@ static void __init of_selftest_changeset(void)
 	struct device_node *n1, *n2, *n21, *nremove, *parent, *np;
 	struct of_changeset chgset;
 
-	of_changeset_init(&chgset);
 	n1 = __of_node_dup(NULL, "/testcase-data/changeset/n1");
 	selftest(n1, "testcase setup failure\n");
 	n2 = __of_node_dup(NULL, "/testcase-data/changeset/n2");
-- 
1.8.3.4
