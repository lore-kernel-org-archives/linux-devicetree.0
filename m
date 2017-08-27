From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/3] arm64: dts: Initial ProBox2 Ava support
Date: Sun, 27 Aug 2017 14:54:22 +0200
Message-ID: <20170827125425.3400-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wangchanchan <wangcc-G29FkNA0FJHz1n+OaKNE4w@public.gmane.org>, beelinkservice-M7q3wZ9fYQpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This mini-series adds a Device Tree for the PROBOX2 AVA Android TV Box.

Unlike the Zidoo X9S, serial (loady) was the only working way to boot a new
kernel from the vendor's U-Boot on this TV Box.
PROBOX2 support has been informed about bootloader issues with Ethernet, USB
and FAT on SD; the same symptoms have since been observed on the Lake I, so
be warned that those bugs might inconvenience other RTD1295 devices, too.

More details at:
https://en.opensuse.org/HCL:ProBox2_Ava

@PROBOX2: Please review the following three patches and either signal your
acknowledgement of my naming with an "Acked-by: name <email>" line or point
out any changes you would like to see applied (e.g., company name). Thanks!

Latest experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: support-UNCqqGnNuERBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Cc: Wangchanchan <wangcc-G29FkNA0FJHz1n+OaKNE4w@public.gmane.org>
Cc: beelinkservice-M7q3wZ9fYQpWk0Htik3J/w@public.gmane.org

Andreas Färber (3):
  dt-bindings: Add vendor prefix for ProBox2
  dt-bindings: arm: realtek: Add ProBox2 AVA
  arm64: dts: realtek: Add ProBox2 Ava

 Documentation/devicetree/bindings/arm/realtek.txt  |  1 +
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm64/boot/dts/realtek/Makefile               |  1 +
 .../arm64/boot/dts/realtek/rtd1295-probox2-ava.dts | 31 ++++++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1295-zidoo-x9s.dts  |  6 -----
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  6 +++++
 6 files changed, 40 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1295-probox2-ava.dts

-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
