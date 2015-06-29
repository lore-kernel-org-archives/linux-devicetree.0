From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 0/4] arm64: add initial support for the Rockchip rk3368
Date: Mon, 29 Jun 2015 14:31:17 +0200
Message-ID: <3333434.ZKWQ6GxgtB@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds initial support for the new rk3368 ARM64 soc from Rockchip.

Overall it looks like someone dropped some A53 cores into a rk3288, so
it shares a lot of peripherals that only differ in details. Therefore
stuff like the mmc, usb, spi, i2c controllers work out of the box.
The support for the gmac already made it into the merge window as well
as the pinctrl support.

Interestingly, in its core the rk3368 seems trying to be a model student
with psci for smp and using scpi for ddr frequency scaling, although I
currently do not understand how the mailbox works yet. The display
controllers also are only minimally different so I'm hopefully to have
working graphics in the near-ish future :-)


As mentioned in the dts patch, this series depends on the dt-binding
header for the clock ids, so will need a shared branch once this is ready.

changes since v1:
- add missing device_type = "memeory", as found by Mark Rutland
- fix patch subject for patch4 (the board is called R88),
  found by Naoki Fukaumi

Heiko Stuebner (4):
  arm64: add Rockchip architecture entry
  arm64: defconfig: enable ARCH_ROCKCHIP
  arm64: dts: add Rockchip rk3368 core dtsi and board dts for the r88
    board
  dt-bindings: document rk3368 R89 board from Rockchip

 Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
 arch/arm64/Kconfig                                 |  10 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        | 353 ++++++++
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           | 900 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 7 files changed, 1275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/Makefile
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-r88.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368.dtsi

-- 
2.1.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
