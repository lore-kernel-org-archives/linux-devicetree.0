From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 0/5] BCM2835 pinctrl DT rework (resend)
Date: Fri, 26 Feb 2016 10:19:11 -0800
Message-ID: <1456510756-15337-1-git-send-email-eric@anholt.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here's a series for cleaning up the pinctrl groups on BCM2835
(Raspberry Pi).  This was partially inspired by Stefan Wahren's
patches for the EMMC SDHCI controller, but really triggered by needing
to switch pinmuxes to enable the SDHOST SD controller (which gives me
a 60% read speed improvement).  Patches for adding that driver will
follow.

I think this is more or less how pinctrl is expected to be used for a
platform like this.  It certainly cleans up the board files.

This is a resend because only 3 came through last time.  My former
SMTP relay decided to start rejecting half my mails this week.  I've
now swapped systems.

Eric Anholt (5):
  ARM: bcm2835: Define standard pinctrl groups in the gpio node.
  ARM: bcm2835: Replace alt0/i2s_alt[02] with standard groups.
  ARM: bcm2835: Move the emmc pin group to bcm283x.dtsi.
  ARM: bcm2835: Add a group for mapping pins 48-53 to sdhost.
  ARM: bcm2835: Move most RPi default pin groups to their devices.

 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts |  11 +-
 arch/arm/boot/dts/bcm2835-rpi-a.dts      |  11 +-
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |  11 +-
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts |  11 +-
 arch/arm/boot/dts/bcm2835-rpi-b.dts      |   4 -
 arch/arm/boot/dts/bcm2835-rpi.dtsi       |  30 ++++--
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts    |  11 +-
 arch/arm/boot/dts/bcm283x.dtsi           | 178 +++++++++++++++++++++++++++++++
 8 files changed, 213 insertions(+), 54 deletions(-)

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
