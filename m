From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for Mali-DP driver
Date: Mon, 25 Apr 2016 15:19:24 +0100
Message-ID: <1461593964-27722-4-git-send-email-Liviu.Dudau@arm.com>
References: <1461593964-27722-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461593964-27722-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add MAINTAINERS entry for ARM Mali-DP driver and update the
HDLCD file matching pattern to cover only HDLCD rather than
the whole drivers/gpu/drm/arm directory.

Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
---
 MAINTAINERS | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d5b4be..a5a4346 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -850,9 +850,17 @@ F:	include/uapi/linux/if_arcnet.h
 ARM HDLCD DRM DRIVER
 M:	Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
 S:	Supported
-F:	drivers/gpu/drm/arm/
+F:	drivers/gpu/drm/arm/hdlcd_*
 F:	Documentation/devicetree/bindings/display/arm,hdlcd.txt
 
+ARM MALI-DP DRM DRIVER
+M:	Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
+M:	Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
+M:	Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
+S:	Supported
+F:	drivers/gpu/drm/arm/
+F:	Documentation/devicetree/bindings/display/arm,malidp.txt
+
 ARM MFM AND FLOPPY DRIVERS
 M:	Ian Molton <spyro-pTmfFsKkaRw@public.gmane.org>
 S:	Maintained
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
