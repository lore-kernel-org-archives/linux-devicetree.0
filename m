From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v2 0/2] SoC driver for Broadcom STB DPFE
Date: Tue, 13 Jun 2017 15:37:08 -0700
Message-ID: <20170613223710.31719-1-code@mmayer.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Broadcom Kernel List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

This series introduces a driver to interact with the Broadcom STB DDR
PHY Front End (DPFE), specifically to communicate with the DCPU that is
part of the DDR PHY and which is running its own firmware.

The DCPU provides information such as DRAM refresh rate, which can be
used as indirect indicator for the DRAM temperature (the higher the
refresh rate, the hotter the RAM).

The series was previously submitted as HWMON driver[1]. It has been
removed from that subsystem, because it doesn't provide any standard
HWMON data due to hardware design properties, and is now implemented as
SoC driver.

Changes since v1:
  - binding simplified to use one node with three memory regions
    instead of three nodes with one region
  - no longer part of the HWMON subsystem
  - better error handling and error reporting to userland
  - uses [readl|writel]_relaxed() directly, since there is no need for
    wrappers doing endian conversion
  - re-download firmware upon "resume"
  - minor changes to improve clarity

[1] https://lkml.org/lkml/2017/4/18/640

Markus Mayer (2):
  dt/bindings: Add bindings for Broadcom STB DRAM Sensors
  soc: brcmstb: Add driver for DPFE

 .../devicetree/bindings/soc/bcm/brcm,dpfe-cpu.txt  |  27 +
 MAINTAINERS                                        |   8 +
 drivers/soc/bcm/brcmstb/Makefile                   |   2 +-
 drivers/soc/bcm/brcmstb/dpfe.c                     | 689 +++++++++++++++++++++
 4 files changed, 725 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,dpfe-cpu.txt
 create mode 100644 drivers/soc/bcm/brcmstb/dpfe.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
