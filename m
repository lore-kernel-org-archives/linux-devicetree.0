From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH v3 1/5] of/selftest: Fix GPIOs selftest to cover the 7th case
Date: Tue, 12 Feb 2013 23:06:37 +0000
Message-ID: <1360710401-16757-2-git-send-email-grant.likely@secretlab.ca>
References: <1360710401-16757-1-git-send-email-grant.likely@secretlab.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360710401-16757-1-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

The of_gpio_named_count() self test doesn't hit the out-of-range
condition even though it is coded. Fix the bug by increasing the for
loop range by one.

Reported-by: Andreas Larsson <andreas@gaisler.com>
Cc: Rob Herring <rob.herring@calxeda.com>
Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/of/selftest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/selftest.c b/drivers/of/selftest.c
index f24ffd7..9f62eb5 100644
--- a/drivers/of/selftest.c
+++ b/drivers/of/selftest.c
@@ -35,7 +35,7 @@ static void __init of_selftest_parse_phandle_with_args(void)
 		return;
 	}
 
-	for (i = 0; i < 7; i++) {
+	for (i = 0; i < 8; i++) {
 		bool passed = true;
 		rc = of_parse_phandle_with_args(np, "phandle-list",
 						"#phandle-cells", i, &args);
-- 
1.7.10.4
