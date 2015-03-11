From: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] of/unittest: remove the duplicate of_changeset_init
Date: Wed, 11 Mar 2015 03:37:19 +0000
Message-ID: <1426045043-128610-2-git-send-email-long.wanglong@huawei.com>
References: <1426045043-128610-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426045043-128610-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, peifeiyue-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove the duplicate of_changeset_init. In of_selftest_changeset
testcase, the "struct of_changeset chgset" is initialized twice,
but only once is enough. so, drop the first initializtion code.

Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
