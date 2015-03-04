From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 3/3 RESEND] MAINTAINERS: add info for e3x0-poweroff driver.
Date: Wed,  4 Mar 2015 14:25:49 -0800
Message-ID: <1425507949-30499-4-git-send-email-moritz.fischer@ettus.com>
References: <1425507949-30499-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425507949-30499-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85024e2..19c0ae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3522,6 +3522,14 @@ S:	Supported
 F:	drivers/input/misc/e3x0-button.c
 F:	Documentation/devicetree/bindings/input/e3x0-button.txt
 
+E3X0 POWEROFF DRIVER
+M:	Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
+L:	usrp-users-p6fHTpcPDZaz3Dx2OeFgIA@public.gmane.org
+W:	http://www.ettus.com
+S:	Supported
+F:	drivers/power/reset/e3x0-poweroff.c
+F:	Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
+
 E4000 MEDIA DRIVER
 M:	Antti Palosaari <crope-X3B1VOXEql0@public.gmane.org>
 L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
