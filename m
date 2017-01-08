From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: mt7623: Add initial Geek Force support
Date: Sun,  8 Jan 2017 14:30:56 +0100
Message-ID: <20170108133100.10428-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Lai <paul-37fROp6E04DQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Andreas Färber (4):
  Documentation: devicetree: Add vendor prefix for AsiaRF
  Documentation: devicetree: arm: mediatek: Add Geek Force board
  ARM: dts: mt7623: Add Geek Force config
  MAINTAINERS: Extend ARM/Mediatek SoC support section

 Documentation/devicetree/bindings/arm/mediatek.txt |  3 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 MAINTAINERS                                        |  2 +
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/mt7623-geekforce.dts             | 77 ++++++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt7623-geekforce.dts

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
