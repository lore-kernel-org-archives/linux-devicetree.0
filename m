From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] fix unit name warnings on lpc18xx
Date: Wed, 30 Mar 2016 00:30:39 +0200
Message-ID: <1459290646-3592-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set fix all the unit name warnings from the new dtc
on lpc18xx. Note that this dtc version is not yet upstream.

Also note that the two first patches are not stricly for lpc18xx
but are needed to make dtc happy when compiling. If there are no
objections I can take them through the lpc18xx dt branch. My
plan is to send a pull request for these patches together with
some other stuff to arm-soc soon.

Joachim Eastwood (7):
  ARM: dts: armv7-m: add unit name to interrupt-controller
  ARM: dts: skeleton: add unit name to memory node
  ARM: dts: lpc18xx: remove unit addresses from creg childs
  ARM: dts: lpc4357-ea4357: fix unit name warnings from dtc
  ARM: dts: lpc4350-hitex-eval: fix unit name warnings from dtc
  ARM: dts: lpc4337-ciaa:: fix unit name warning from dtc
  dt-bindings: phy-lpc18xx-usb-otg: remove unit address from binding

 .../devicetree/bindings/phy/phy-lpc18xx-usb-otg.txt  |  2 +-
 arch/arm/boot/dts/armv7-m.dtsi                       |  2 +-
 arch/arm/boot/dts/lpc18xx.dtsi                       |  4 ++--
 arch/arm/boot/dts/lpc4337-ciaa.dts                   |  2 +-
 arch/arm/boot/dts/lpc4350-hitex-eval.dts             | 20 ++++++++++----------
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts          | 14 +++++++-------
 arch/arm/boot/dts/skeleton.dtsi                      |  2 +-
 arch/arm/boot/dts/skeleton64.dtsi                    |  2 +-
 8 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
