From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=20V3=200/5=5D=20ARM=3A=20dts=3A=20bcm2835=3A=20Add=20Raspberry=20Pi=20Zero?=
Date: Sun, 21 Aug 2016 15:09:58 +0000
Message-ID: <1471792204-21908-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series add support for Raspberry Pi Zero with USB host mode. It's
based on the patch "ARM64: dts: bcm: Use a symlink to R-Pi dtsi files
from arch=arm" from Ian Campbell. Currently there is a bug [1] which needs
to fixed before because after applying these patch series the bug isn't
reproducible anymore but not fixed.

The patches 1-3 fixes the USB DT settings for bcm283x. Patch 3 is only compile
tested, so it would be nice if someone with a RPi 3 could test it.
The last patch based on the work of Lubomir Rintel [2] and Noralf Trønnes [3].

Note: Patch 3 can't be cherry-picked because it depends on Patch 2.

Changes since V2:
- rebase on "ARM64: dts: bcm: Use a symlink to R-Pi dtsi files from arch=arm"
- add dtsi file to easily specify host mode for bcm283x boards
- drop all dwc2 changes (incl. USB otg/gadget support) because of known
  issues [4]
- add copyright and license to new dts file

Changes since V1:
- rebase to current linux-next
- add patches 1 - 4 for otg/gadget support
- add patch 5 with model compatible
- use polarity define for ACT LED

[1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-August/004216.html
[2] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-February/003221.html
[3] - https://github.com/raspberrypi/linux/pull/1239/
[4] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-August/004197.html

Stefan Wahren (5):
  ARM: dts: bcm283x: Add missing USB clock
  ARM: dts: bcm283x: Add dtsi for USB host mode
  ARM64: dts: bcm283x: Use dtsi for USB host mode
  DT: bindings: bcm: Add Raspberry Pi Zero
  ARM: dts: bcm2835: Add Raspberry Pi Zero

 .../devicetree/bindings/arm/bcm/brcm,bcm2835.txt   |    4 ++
 arch/arm/boot/dts/Makefile                         |    3 +-
 arch/arm/boot/dts/bcm2835-rpi-a-plus.dts           |    1 +
 arch/arm/boot/dts/bcm2835-rpi-a.dts                |    1 +
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts           |    1 +
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts           |    1 +
 arch/arm/boot/dts/bcm2835-rpi-b.dts                |    1 +
 arch/arm/boot/dts/bcm2835-rpi-zero.dts             |   40 ++++++++++++++++++++
 arch/arm/boot/dts/bcm2836-rpi-2-b.dts              |    1 +
 arch/arm/boot/dts/bcm283x-rpi-usb-host.dtsi        |    3 ++
 arch/arm/boot/dts/bcm283x.dtsi                     |    9 +++++
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts   |    1 +
 .../boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi    |    1 +
 13 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero.dts
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-usb-host.dtsi
 create mode 120000 arch/arm64/boot/dts/broadcom/bcm283x-rpi-usb-host.dtsi

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
