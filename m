From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/3] reset: add socfpga reset-controller
Date: Fri,  4 Apr 2014 18:31:24 +0200
Message-ID: <1396629087-23727-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

This series converts the current rst-mgr entry in the socfpga.dtsi to
a driver that registers with the reset-controller framework.

1/3 adds the driver,
2/3 updates the binding to reflect this
3/3 updates the socfpga.dtsi and adds the DT-header file

Regards,
Steffen

Steffen Trumtrar (3):
  reset: add driver for socfpga
  Documentation: dt: socfpga: add reset-cells property
  ARM: socfpga: dts: add reset-controller

 .../bindings/arm/altera/socfpga-reset.txt          |   2 +
 arch/arm/boot/dts/socfpga.dtsi                     |   8 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-socfpga.c                      | 149 +++++++++++++++++++++
 include/dt-bindings/reset/altr,rst-mgr.h           |  90 +++++++++++++
 5 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 drivers/reset/reset-socfpga.c
 create mode 100644 include/dt-bindings/reset/altr,rst-mgr.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
