From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/6] ARM: dts: bcm283x: add and use pinctrl groups
Date: Wed, 14 Sep 2016 10:23:29 +0200
Message-ID: <1473841415-937-1-git-send-email-kraxel@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

  Hi,

New in v3: Fixes in patch #2 (dpi name, drop changelog from commit
message) and patch #5 (drop unused alt3 group), the other patches are
unmodified.

cheers,
  Gerd

Eric Anholt (1):
  ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.

Gerd Hoffmann (5):
  pinctrl: bcm2835: add pull defines to dt bindings
  ARM: dts: bcm283x: add pinctrl group to &pwm, drop pins from &gpio
  ARM: dts: bcm283x: add pinctrl group to &i2c0, drop pins from &gpio
  ARM: dts: bcm283x: add pinctrl group to &i2c1, drop pins from &gpio
  ARM: dts: bcm283x: add pinctrl group to &sdhci, drop pins from &gpio

 arch/arm/boot/dts/bcm2835-rpi.dtsi    |  15 ++-
 arch/arm/boot/dts/bcm283x.dtsi        | 203 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c |   6 -
 include/dt-bindings/pinctrl/bcm2835.h |   5 +
 4 files changed, 217 insertions(+), 12 deletions(-)

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
