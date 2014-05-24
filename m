From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v2 1/4] MAINTAINERS: Add entry for APM X-Gene SoC EDAC driver
Date: Fri, 23 May 2014 19:21:04 -0600
Message-ID: <1400894467-1585-2-git-send-email-lho@apm.com>
References: <1400894467-1585-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400894467-1585-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a MAINTAINERS entry for APM X-Gene SoC EDAC driver.

Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 MAINTAINERS |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e67ea24..ecef44c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3321,6 +3321,14 @@ W:	bluesmoke.sourceforge.net
 S:	Maintained
 F:	drivers/edac/sb_edac.c
 
+EDAC-XGENE
+APPLIED MICRO (APM) X-GENE SOC EDAC
+M:     Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
+M:     Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
+S:     Supported
+F:     drivers/edac/xgene_edac.c
+F:     Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
+
 EDIROL UA-101/UA-1000 DRIVER
 M:	Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
 L:	alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org (moderated for non-subscribers)
-- 
1.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
