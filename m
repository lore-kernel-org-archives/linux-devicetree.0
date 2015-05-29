From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 0/3] edac: Add L3/SoC support to the APM X-Gene SoC EDAC driver
Date: Fri, 29 May 2015 16:04:32 -0600
Message-ID: <1432937075-16558-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v1:
* Add L3/SoC support to the APM X-Gene SoC EDAC driver

---
Loc Ho (3):
  Documentation: Update the APM X-Gene SoC EDAC DTS binding for L3/SoC
    subnodes
  edac: Add L3/SoC support to the APM X-Gene SoC EDAC driver
  arm64: Add L3/SoC DT subnodes to the APM X-Gene SoC EDAC node

 .../devicetree/bindings/edac/apm-xgene-edac.txt    |   18 +
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   10 +
 drivers/edac/xgene_edac.c                          |  746 +++++++++++++++++++-
 3 files changed, 773 insertions(+), 1 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
