From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/2] arm64: meson-gxbb: NanoPi K2 enablement
Date: Mon, 15 May 2017 03:11:28 +0200
Message-ID: <20170515011130.29265-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, techsupport-/wLt9BB+Iy7nC/t2CciAbw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds initial support for the Amlogic S905 based
FriendlyARM NanoPi K2 SBC.

Tested with mainline U-Boot.

Regards,
Andreas

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: techsupport-/wLt9BB+Iy7nC/t2CciAbw@public.gmane.org

Andreas Färber (2):
  dt-bindings: arm: amlogic: Add NanoPi K2
  arm64: dts: amlogic: Add NanoPi K2

 Documentation/devicetree/bindings/arm/amlogic.txt  |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      | 152 +++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts

-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
