From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] of: fix a regression when trying to find the best compatible match
Date: Fri, 14 Feb 2014 13:22:44 +0800
Message-ID: <1392355366-1445-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This fix a regression when trying to find the best compatible match. You can
find the detail of the issue reported by Stephen Chivers at:
  https://lists.ozlabs.org/pipermail/linuxppc-dev/2014-February/115278.html

I have made a patch to fix this previously.
  http://patchwork.ozlabs.org/patch/319624/

This is another respin with the implementation suggested by Rob Herring.

Kevin Hao (2):
  Revert "OF: base: match each node compatible against all given matches
    first"
  of: search the best compatible match first in __of_match_node()

 drivers/of/base.c | 88 ++++++++++++++++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
