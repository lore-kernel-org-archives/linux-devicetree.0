From: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: [PATCH v7 3/3] MAINTAINERS: auxdisplay: Added myself as maintainer for ht16k33 driver
Date: Thu,  6 Oct 2016 13:53:33 +0200
Message-ID: <1475754813-1200-4-git-send-email-robin@protonic.nl>
References: <1475754813-1200-1-git-send-email-robin@protonic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475754813-1200-1-git-send-email-robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
CC: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 841ffa3..7e7368e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2998,6 +2998,12 @@ F:	drivers/usb/host/whci/
 F:	drivers/usb/wusbcore/
 F:	include/linux/usb/wusb*
 
+HT16K33 LED CONTROLLER DRIVER
+M:	Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
+S:	Maintained
+F:	drivers/auxdisplay/ht16k33.c
+F:	Documentation/devicetree/bindings/display/ht16k33.txt
+
 CFAG12864B LCD DRIVER
 M:	Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 W:	http://miguelojeda.es/auxdisplay.htm
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
