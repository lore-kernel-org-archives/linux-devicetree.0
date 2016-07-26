From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=20V2=20RFC=200/6=5D=20ARM=3A=20dts=3A=20bcm2835=3A=20Add=20Raspberry=20Pi=20Zero?=
Date: Tue, 26 Jul 2016 18:53:27 +0000
Message-ID: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series is only a draft and not intended to be merged. Patche=
s 1 and 2
aren't bcm2835 specific and should be helpful for other platforms.=20
The patches 2 - 4 are required for otg / gadget mode. The last patch
based on the work of Lubomir Rintel [1] and Noralf Tr=C3=B8nnes [2].

Changes since V1:
- rebase to current linux-next
- add patches 1 - 4 for otg/gadget support
- add patch 5 with model compatible
- use polarity define for ACT LED

[1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-Februa=
ry/003221.html
[2] - https://github.com/raspberrypi/linux/pull/1239/

Stefan Wahren (6):
  usb: dwc2: core: Avoid nonsense error in gadget mode
  usb: dwc2: Add DT properties to specify fifo size in host/otg mode
  ARM: dts: bcm283x: Add missing usb clock
  ARM: dts: bcm283x: Add generic USB PHY
  DT: bindings: bcm: Add Raspberry Pi Zero
  ARM: dts: bcm2835: Add Raspberry Pi Zero

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |    4 ++
 Documentation/devicetree/bindings/usb/dwc2.txt     |    3 ++
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |   57 ++++++++++++=
++++++++
 arch/arm/boot/dts/bcm283x.dtsi                     |   15 ++++++
 drivers/usb/dwc2/core.c                            |   35 +++++++++---
 6 files changed, 108 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero.dts

--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
