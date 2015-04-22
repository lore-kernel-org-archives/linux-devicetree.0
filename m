From: Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] Add DTE driver for Cygnus
Date: Wed, 22 Apr 2015 16:22:01 -0700
Message-ID: <1429744923-2007-1-git-send-email-jonathar@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Darren Edamura <dedamura-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset includes the Digital Timing Engine (DTE) driver for Cygnus SoC's.

Jonathan Richardson (2):
  misc: Add DT binding for cygnus Digital Timing Engine (DTE) driver.
  misc: Add initial Digital Timing Engine (DTE) driver for cygnus

 .../bindings/arm/bcm/brcm,cygnus-dte.txt           |   24 +
 drivers/misc/Kconfig                               |   11 +
 drivers/misc/Makefile                              |    1 +
 drivers/misc/bcm_cygnus_dte.c                      |  927 ++++++++++++++++++++
 include/linux/bcm_cygnus_dte.h                     |   99 +++
 5 files changed, 1062 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,cygnus-dte.txt
 create mode 100644 drivers/misc/bcm_cygnus_dte.c
 create mode 100644 include/linux/bcm_cygnus_dte.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
