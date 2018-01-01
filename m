From: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCHv5 3/3] MAINTAINERS: Add entry for Socionext ethernet driver
Date: Mon,  1 Jan 2018 10:45:04 +0530
Message-ID: <1514783705-4402-1-git-send-email-jassisinghbrar@gmail.com>
References: <1514783559-4226-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514783559-4226-1-git-send-email-jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Add entry for the Socionext Netsec controller driver and DT bindings.

Acked-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6e86e2..5d2fcd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12630,6 +12630,13 @@ F:	drivers/md/raid*
 F:	include/linux/raid/
 F:	include/uapi/linux/raid/
 
+SOCIONEXT (SNI) NETSEC NETWORK DRIVER
+M:	Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
+S:	Maintained
+F:	drivers/net/ethernet/socionext/netsec.c
+F:	Documentation/devicetree/bindings/net/socionext-netsec.txt
+
 SONIC NETWORK DRIVER
 M:	Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>
 L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
