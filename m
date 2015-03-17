From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] fix the node option breakage
Date: Tue, 17 Mar 2015 16:14:51 +0000
Message-ID: <1426608893-3739-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 106937e8ccdc
("of: fix handling of '/' in options for of_find_node_by_path()")
broke handling of paths with both ':' and '/'.

Revert that commit and replace it with the squash of 106937e8ccdc
and the fix verified by Hans de Goede.

The tests added by Peter Hurley and committed together with
106937e8ccdc are still valid, but selftest will report 2 errors
until the new fix goes in.

If acceptable, 2/2 should go to stable for 3.19.

Leif Lindholm (2):
  Revert "of: fix handling of '/' in options for of_find_node_by_path()"
  of: fix handling of '/' in paths with options

 drivers/of/base.c     | 10 ++++------
 drivers/of/unittest.c |  5 +++++
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
