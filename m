From: "George G. Davis" <ggdavisiv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drivers: of: Export of_reserved_mem_device_{init,release}
Date: Fri,  9 Jan 2015 09:29:05 -0500
Message-ID: <1420813745-130341-1-git-send-email-george_davis@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "George G. Davis" <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Export of_reserved_mem_device_{init,release} so that modules
can initialize and release their assigned per-device cma_area.

Signed-off-by: George G. Davis <george_davis-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 drivers/of/of_reserved_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index dc566b3..5eeb5b2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -265,6 +265,7 @@ int of_reserved_mem_device_init(struct device *dev)
 
 	return ret;
 }
+EXPORT_SYMBOL(of_reserved_mem_device_init);
 
 /**
  * of_reserved_mem_device_release() - release reserved memory device structures
@@ -289,3 +290,4 @@ void of_reserved_mem_device_release(struct device *dev)
 
 	rmem->ops->device_release(rmem, dev);
 }
+EXPORT_SYMBOL(of_reserved_mem_device_release);
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
