From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [RESEND Patch 0/3] Prefixes for Kirkwood DT files
Date: Wed,  5 Mar 2014 22:33:24 +0100
Message-ID: <1394055207-4639-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It has been reported that not all these patches made it to the
list. This is probably because git send-email used UTF8 encoded, since
some of the hunks contain context lines using none ASCII characters.

Andrew Lunn (3):
  DT: I2C: Add trivial bindings used by kirkwood boards
  DT: Vendors: Add vendor prefix for Macronix
  ARM: Kirkwood: DT: Add missing vendor prefix

 .../devicetree/bindings/i2c/trivial-devices.txt         | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt   |  1 +
 arch/arm/boot/dts/kirkwood-b3.dts                       |  2 +-
 arch/arm/boot/dts/kirkwood-cloudbox.dts                 |  2 +-
 arch/arm/boot/dts/kirkwood-dreamplug.dts                |  2 +-
 arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts          |  2 +-
 arch/arm/boot/dts/kirkwood-ns2-common.dtsi              |  2 +-
 arch/arm/boot/dts/kirkwood-nsa310.dts                   |  2 +-
 arch/arm/boot/dts/kirkwood-nsa310a.dts                  |  2 +-
 arch/arm/boot/dts/kirkwood-openblocks_a6.dts            |  2 +-
 arch/arm/boot/dts/kirkwood-openblocks_a7.dts            |  2 +-
 11 files changed, 27 insertions(+), 9 deletions(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
