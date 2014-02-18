From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] of: reimplement the matching method for __of_match_node()
Date: Tue, 18 Feb 2014 15:57:28 +0800
Message-ID: <1392710250-29913-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This implemented the matching method for __of_match_node() suggested
by Grant Likely. You can find more detail at:
  http://patchwork.ozlabs.org/patch/320286/

Kevin Hao (2):
  Revert "of: search the best compatible match first in
    __of_match_node()"
  of: reimplement the matching method for __of_match_node()

 drivers/of/base.c | 126 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 67 insertions(+), 59 deletions(-)

-- 
1.8.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
