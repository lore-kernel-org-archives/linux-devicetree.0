From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 0/2] HWMON driver for Broadcom STB DPFE
Date: Tue, 18 Apr 2017 13:17:00 -0700
Message-ID: <20170418201702.57019-1-code@mmayer.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux HWMON List <linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

This series introduces a driver to interact with the Broadcom STB DDR
PHY Front End (DPFE), specifically to communicate with the DCPU that is
part of the DDR PHY and which is running its own firmware.

The DCPU provides information such as DRAM refresh rate, which can be
used as indirect indicator for the DRAM temperature (the higher the
refresh rate, the hotter the RAM).

Markus Mayer (2):
  dt/bindings: Add bindings for Broadcom STB DRAM Sensors
  hwmon: (brcmstb) Add driver for Broadcom STB DPFE

 .../devicetree/bindings/hwmon/brcmstb-dpfe.txt     |  68 ++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  13 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/brcmstb-dpfe.c                       | 689 +++++++++++++++++++++
 5 files changed, 779 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/brcmstb-dpfe.txt
 create mode 100644 drivers/hwmon/brcmstb-dpfe.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
