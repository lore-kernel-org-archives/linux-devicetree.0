From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] media: adv7604: fix default-input property inconsistencies
Date: Fri, 16 Sep 2016 11:39:40 +0200
Message-ID: <20160916093942.17213-1-ulrich.hecht+renesas@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, william.towle-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

This is a fix for the inconsistency in the adv7604 bindings regarding the
default-input property, clarifying that it should be a property of the
device, not the endpoint, and a patch to implement it.

CU
Uli


Ulrich Hecht (2):
  media: adv7604: fix bindings inconsistency for default-input
  media: adv7604: automatic "default-input" selection

 Documentation/devicetree/bindings/media/i2c/adv7604.txt | 3 +--
 drivers/media/i2c/adv7604.c                             | 5 ++++-
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
