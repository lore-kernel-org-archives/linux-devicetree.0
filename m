From: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Subject: [PATCH v3 2/2] Add XRA1403 support to MAINTAINERS file
Date: Mon, 15 May 2017 08:58:26 +0300
Message-ID: <f1e912e9a36fea575903db455ed321e50171f62b.1494827688.git.nandor.han@ge.com>
References: <cover.1494827688.git.nandor.han@ge.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1494827688.git.nandor.han-JJi787mZWgc@public.gmane.org>
In-Reply-To: <cover.1494827688.git.nandor.han-JJi787mZWgc@public.gmane.org>
References: <cover.1494827688.git.nandor.han-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add XRA1403 support to MAINTAINERS list.

Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9deb67..db86335 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14078,6 +14078,14 @@ L:	linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Supported
 F:	drivers/char/xillybus/
 
+XRA1403 GPIO EXPANDER
+M:	Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
+M:	Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
+L:	linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	drivers/gpio/gpio-xra1403.c
+F:	Documentation/devicetree/bindings/gpio/gpio-xra1403.txt
+
 XTENSA XTFPGA PLATFORM SUPPORT
 M:	Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
