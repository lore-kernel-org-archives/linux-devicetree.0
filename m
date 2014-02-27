From: Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] ARM: bcm21664: Add initial support.
Date: Thu, 27 Feb 2014 13:56:03 -0800
Message-ID: <1393538166-22868-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Broadcom Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds initial support for the Broadcom BCM21664 mobile SoC.

The series depends on the series "ARM: bcm281xx: Consolidate code":
    https://lkml.org/lkml/2014/2/25/548

Markus Mayer (3):
  ARM: DT: bcm21664: Device tree bindings
  ARM: bcm21664: Add board support.
  ARM: dts: bcm21664: Add device tree files.

 .../devicetree/bindings/arm/bcm/bcm21664.txt       |   15 +
 .../devicetree/bindings/arm/bcm/kona-resetmgr.txt  |   14 +
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/bcm21664-garnet.dts              |   56 ++++
 arch/arm/boot/dts/bcm21664.dtsi                    |  292 ++++++++++++++++++++
 arch/arm/mach-bcm/Makefile                         |    6 +-
 arch/arm/mach-bcm/board_bcm21664.c                 |   78 ++++++
 7 files changed, 461 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm21664.txt
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/kona-resetmgr.txt
 create mode 100644 arch/arm/boot/dts/bcm21664-garnet.dts
 create mode 100644 arch/arm/boot/dts/bcm21664.dtsi
 create mode 100644 arch/arm/mach-bcm/board_bcm21664.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
