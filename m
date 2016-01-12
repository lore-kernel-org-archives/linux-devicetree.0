From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 0/3] edac: xgene: Add missing SoC register bus error handling and fix CE promotes to UE
Date: Tue, 12 Jan 2016 16:04:57 -0700
Message-ID: <1452639900-30919-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org
Cc: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add missing register bus error handling for SoC and fix an checking
condition for CE error promotes to UE. DT binding and documentation are
also updated.

---
Loc Ho (3):
  Documentation: Update the APM X-Gene SoC EDAC DTS binding with fix to
    the RB
  edac: xgene: Add missing SoC register bus error handling and fix CE
    promotes to UE
  arm64: Update the APM X-Gene EDAC node to the RB register resource

 .../devicetree/bindings/edac/apm-xgene-edac.txt    |    7 ++
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |    6 ++
 drivers/edac/xgene_edac.c                          |   62 +++++++++++++++++++-
 3 files changed, 74 insertions(+), 1 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
