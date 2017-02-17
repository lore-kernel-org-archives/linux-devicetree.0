From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v1 0/2] Introduce devm_of_platform_populate() helper
Date: Fri, 17 Feb 2017 15:31:24 +0100
Message-ID: <1487341886-13829-1-git-send-email-benjamin.gaignard@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vincent.abriou-qxv4g6HH51o@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lost of calls to of_platform_populate() are not unbalanced by a call
to of_platform_depopulate(). This create issues while drivers are
bind/unbind.
    
In way to solve those issues is to add devm_of_platform_populate()
which will call of_platform_depopulate() when the device is unbound
from the bus. This also could make drivers more robust in case that
probe failed after calling of_platform_populate().

Benjamin Gaignard (2):
  of: add devm_ functions for populate and depopulate
  drm: sti: make driver use devm_of_platform_populate()

 drivers/gpu/drm/sti/sti_drv.c |  3 +-
 drivers/of/platform.c         | 77 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_platform.h   | 20 +++++++++++
 3 files changed, 98 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
