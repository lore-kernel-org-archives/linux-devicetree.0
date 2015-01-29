From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V2 RESEND 0/4] ARM: bcm2835: DT improvements
Date: Thu, 29 Jan 2015 18:10:46 +0000
Message-ID: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series contains DT improvements for the Raspberry Pi.

Patch 1,2: Add missing vendor prefix and root compatible properties
Patch 3,4: Use constants for pin function instead of error-prone numbers

Changes in V2:
- add all currently known Raspberry Pi boards to binding documentation 
  as suggested by Stephen Warren

Stefan Wahren (4):
  dt-bindings: Add vendor prefix for Raspberry Pi
  dt-bindings: Add root properties for Raspberry Pi
  ARM: bcm2835: Add header file for pinctrl constants
  ARM: bcm2835: Use pinctrl header

 Documentation/devicetree/bindings/arm/bcm2835.txt  |   31 ++++++++++++++++++--
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |    4 +--
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |    4 +--
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |    8 ++---
 arch/arm/boot/dts/bcm2835.dtsi                     |    3 +-
 include/dt-bindings/pinctrl/bcm2835.h              |   27 +++++++++++++++++
 7 files changed, 67 insertions(+), 11 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/bcm2835.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
