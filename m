From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH RFC 0/4] ARM: bcm2835: assign pins to sdhci pinctrl
Date: Thu, 19 Nov 2015 16:06:12 +0000
Message-ID: <1447949176-21926-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series fixes the pinctrl of the sdhci pins for all
Raspberry Pis.

The pin configuration based on the proprietary DTS [1].

[1] - https://www.raspberrypi.org/documentation/configuration/images/dt-blob.dts

Stefan Wahren (4):
  ARM: bcm2835: remove sdhci pins from GPIO pinctrl
  ARM: bcm2835: rename sdhci pin group
  ARM: bcm2835: specify card detect pin for RPi B
  ARM: bcm2835: assign pins to sdhci pinctrl

 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts |    6 +++++-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |    6 +++++-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts |    6 +++++-
 arch/arm/boot/dts/bcm2835-rpi-b.dts      |   11 ++++++++++-
 arch/arm/boot/dts/bcm2835-rpi.dtsi       |    2 +-
 5 files changed, 26 insertions(+), 5 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
