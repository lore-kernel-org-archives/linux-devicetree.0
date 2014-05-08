From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 0/4] edac: Add APM X-Gene SoC EDAC driver
Date: Thu,  8 May 2014 17:03:15 -0600
Message-ID: <1399590199-12256-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the APM X-Gene SoC EDAC driver.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
Loc Ho (4):
  edac: Fix MC scrub mode comparsion bug for correctable error
  Documentation: Add documentation for the APM X-Gene SoC EDAC DTS
    binding
  edac: Add APM X-Gene SoC EDAC driver
  arm64: Add APM X-Gene SoC EDAC DTS entries

 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   70 +
 arch/arm64/boot/dts/apm-storm.dtsi                 |   89 +
 drivers/edac/Kconfig                               |    9 +-
 drivers/edac/Makefile                              |    3 +
 drivers/edac/edac_mc.c                             |    2 +-
 drivers/edac/xgene_edac.c                          | 1915 ++++++++++++++++++++
 6 files changed, 2086 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/edac/apm-xgene-edac.txt
 create mode 100644 drivers/edac/xgene_edac.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
