From: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] of: fix handling of '/' in path options
Date: Mon,  9 Mar 2015 18:03:43 +0000
Message-ID: <1425924225-22748-1-git-send-email-leif.lindholm@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Commit 7914a7c5651a ("of: support passing console options with
stdout-path") neglected to deal with '/'s appearing past the ':'
terminator.

This mini-series fixes this oversight and adds the tests to prove it.

Leif Lindholm (1):
  of: fix handling of '/' in options for of_find_node_by_path()

Peter Hurley (1):
  of: unittest: Add options string testcase variants

 drivers/of/base.c     | 23 +++++++++++++++--------
 drivers/of/unittest.c | 11 +++++++++++
 2 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
