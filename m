From: richard.gong-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCHv1] Add reset manager offsets for Stratix10
Date: Thu,  1 Jun 2017 09:23:58 -0500
Message-ID: <1496327039-21942-1-git-send-email-richard.gong@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, richard.gong-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, Richard Gong <richard.gong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Richard Gong <richard.gong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

There are several changes in reset manager offsets from Arria10 to
stratix10. This patch is derived from Steffen Trumtrar's "altr,rst-mgr-a10.h"
and adds additional offset updates for Stratix10

Richard Gong (1):
  dt-bindings: reset: Add reset manager offsets for Stratix10

 include/dt-bindings/reset/altr,rst-mgr-s10.h | 108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 include/dt-bindings/reset/altr,rst-mgr-s10.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
