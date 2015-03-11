From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH v2 1/5] of/unittest: remove the duplicate of_changeset_init
Date: Wed, 11 Mar 2015 08:36:50 +0000
Message-ID: <1426063014-211712-2-git-send-email-long.wanglong@huawei.com>
References: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav.minocha.os@gmail.com, robherring2@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, grant.likely@linaro.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com, long.wanglong@huawei.com, ijc+devicetree@hellion.org.uk
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
