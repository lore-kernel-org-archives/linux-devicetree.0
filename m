From: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] Add max7360 mfd driver and DT documentation
Date: Tue, 25 Apr 2017 11:15:55 +0300
Message-ID: <20170425081557.13941-1-valentin_sitdikov@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Valentin Sitdikov <valentin_sitdikov-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add initial support of mfd core driver for max7360 chip

Andrei Dranitca (1):
  mfd: max7360: Add mfd core device driver

Valentin Sitdikov (1):
  Add DT bindings documentation for the max7360 mfd driver

 Documentation/devicetree/bindings/mfd/max7360.txt |  72 ++++
 drivers/mfd/Kconfig                               |  16 +
 drivers/mfd/Makefile                              |   1 +
 drivers/mfd/max7360.c                             | 393 ++++++++++++++++++++++
 include/linux/mfd/max7360.h                       | 130 +++++++
 5 files changed, 612 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/max7360.txt
 create mode 100644 drivers/mfd/max7360.c
 create mode 100644 include/linux/mfd/max7360.h

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
