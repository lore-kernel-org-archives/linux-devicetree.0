From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V2 0/3] ARM: bcm283x: Raspberry Pi Zero W support
Date: Sun, 30 Jul 2017 19:10:31 +0200
Message-ID: <1501434634-2325-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds support for the Raspberry Pi Zero W. It depends
on "V2 ARM: dts: bcm283x: Move the BCM2837 DT contents from arm64 to arm."

Currently there is a regression [1] in the brcmfmac driver. This hack [2]
avoids the issue and make wifi probe on RPi Zero W.

Changes in V2:
- add aliases comment and gpio-line-names into bcm2835-rpi-zero-w.dts
- rebased on V2 of arm64 to arm patch

[1] - http://marc.info/?l=linux-wireless&m=150029709021719&w=2
[2] - https://github.com/lategoodbye/rpi-zero/commit/95ef5b8fbc05d9ec086970648767cafa10483622

Stefan Wahren (3):
  ARM: bcm283x: Define UART pinmuxing on board level
  dt-bindings: bcm: Add Raspberry Pi Zero W
  ARM: dts: bcm2835: Add Raspberry Pi Zero W

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |   4 +
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |   6 +
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |   6 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |   6 +
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |   6 +
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |   6 +
 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts           | 139 +++++++++++++++++++++
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |   6 +
 arch/arm/boot/dts/bcm2835-rpi.dtsi                 |   2 +-
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |   6 +
 arch/arm/boot/dts/bcm2837-rpi-3-b.dts              |  10 ++
 12 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
