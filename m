From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH 0/3] Device tree fixes for Axentia TSE-850 and Nattis
Date: Tue, 16 Jan 2018 17:08:32 +0100
Message-ID: <20180116160835.27943-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

Here's a series that is of the "documentation" kind. It fixes things
that don't really need fixing, but the fixes are correct none-the-less
and should prevent possible confusion.

Cheers,
Peter

Peter Rosin (3):
  ARM: dts: at91: nattis: use up-to-date mtd partitions
  ARM: dts: at91: nattis: add lvds-encoder
  ARM: dts: at91: tse850: make the sound dai cell count explicit

 arch/arm/boot/dts/at91-nattis-2-natte-2.dts | 56 ++++++++++++++++++++++-------
 arch/arm/boot/dts/at91-tse850-3.dts         |  1 +
 2 files changed, 44 insertions(+), 13 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
