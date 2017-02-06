From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/3] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver
Date: Mon, 6 Feb 2017 15:03:37 +0100
Message-ID: <cover.1486388711.git.richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds a driver for configuration of the Microchip USB251xB
USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
configuration interface and two to four USB 2.0 downstream ports.

CHANGES v3:
	- move ascii2utf16le() to lib/string.c and also use it also for
		ascii2desc in drivers/usb/core/hcd.c
	- remove platform data support from usb251xb driver

CHANGES v2:
	- fix max-{b,s}p-current property name
	- add descriptor string handling from platform_data
	- fix non-dt handling

Richard Leitner (3):
  lib/string: introduce ascii2utf16le() helper
  usb: core: hcd: use ascii2utf16le() in ascii2desc()
  usb: misc: add USB251xB/xBi Hi-Speed Hub Controller Driver

 Documentation/devicetree/bindings/usb/usb251xb.txt |  83 +++
 MAINTAINERS                                        |   8 +
 drivers/usb/core/hcd.c                             |  22 +-
 drivers/usb/misc/Kconfig                           |   9 +
 drivers/usb/misc/Makefile                          |   1 +
 drivers/usb/misc/usb251xb.c                        | 664 +++++++++++++++++++++
 include/linux/string.h                             |   1 +
 lib/string.c                                       |  26 +
 8 files changed, 802 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
 create mode 100644 drivers/usb/misc/usb251xb.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
