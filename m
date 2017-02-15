From: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: [PATCH 0/5] Add Arria10 System Manager Reset Controller
Date: Wed, 15 Feb 2017 15:50:11 -0600
Message-ID: <1487195416-23827-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

This series of patches adds the Altera Arria10 Development Kit System
Manager Reset Controller.

Thor Thayer (5):
  dt-bindings: mfd: Add Altera Arria10 SR Reset Controller bindings
  dt-bindings: Add Arria10 System Resource reset manager offsets
  reset: Add Altera Arria10 System Resource Reset Controller
  mfd: altr_a10sr: Add Arria10 DevKit Resource Controller
  ARM: socfpga: dts: Add Devkit A10-SR Reset Controller

 .../devicetree/bindings/mfd/altera-a10sr.txt       |  11 ++
 MAINTAINERS                                        |   2 +
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi       |   5 +
 drivers/mfd/altera-a10sr.c                         |   4 +
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-a10sr.c                        | 176 +++++++++++++++++++++
 include/dt-bindings/reset/altr,rst-mgr-a10sr.h     |  31 ++++
 8 files changed, 237 insertions(+)
 create mode 100644 drivers/reset/reset-a10sr.c
 create mode 100644 include/dt-bindings/reset/altr,rst-mgr-a10sr.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
