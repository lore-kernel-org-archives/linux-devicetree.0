From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] of/unittest: Fix the wrong expected value in of_selftest_property_string
Date: Wed, 11 Mar 2015 03:37:20 +0000
Message-ID: <1426045043-128610-3-git-send-email-long.wanglong@huawei.com>
References: <1426045043-128610-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426045043-128610-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch fix the wrong expected value of of_property_match_string
in of_selftest_property_string.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
