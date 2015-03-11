From: Wang Long <long.wanglong@huawei.com>
Subject: [PATCH v2 2/5] of/unittest: Fix the wrong expected value in of_selftest_property_string
Date: Wed, 11 Mar 2015 08:36:51 +0000
Message-ID: <1426063014-211712-3-git-send-email-long.wanglong@huawei.com>
References: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426063014-211712-1-git-send-email-long.wanglong@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav.minocha.os@gmail.com, robherring2@gmail.com, robh+dt@kernel.org, pantelis.antoniou@konsulko.com, grant.likely@linaro.org
Cc: pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, peifeiyue@huawei.com, long.wanglong@huawei.com, ijc+devicetree@hellion.org.uk
List-Id: devicetree@vger.kernel.org

This patch fix the wrong expected value of of_property_match_string
in of_selftest_property_string.

Signed-off-by: Wang Long <long.wanglong@huawei.com>
---
 drivers/of/unittest.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 199fb23..00ddce7 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -378,9 +378,9 @@ static void __init of_selftest_property_string(void)
 	rc = of_property_match_string(np, "phandle-list-names", "first");
 	selftest(rc == 0, "first expected:0 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "second");
-	selftest(rc == 1, "second expected:0 got:%i\n", rc);
+	selftest(rc == 1, "second expected:1 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "third");
-	selftest(rc == 2, "third expected:0 got:%i\n", rc);
+	selftest(rc == 2, "third expected:2 got:%i\n", rc);
 	rc = of_property_match_string(np, "phandle-list-names", "fourth");
 	selftest(rc == -ENODATA, "unmatched string; rc=%i\n", rc);
 	rc = of_property_match_string(np, "missing-property", "blah");
-- 
1.8.3.4
