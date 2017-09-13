From: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/8] ARM: renesas: Latest r8a774[35] dts updates
Date: Wed, 13 Sep 2017 18:05:33 +0100
Message-ID: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series contains multiple additions to the r8a774[35] device trees.

I've bundled them into a series to help avoid merge issues due to multiple
changes to the same files. Hopefully this doesn't add too much confusion!


Kind regards, Chris


Fabrizio Castro (8):
  ARM: dts: r8a7745: Add APMU node and second CPU core
  ARM: dts: r8a7745: Add SDHI controllers
  ARM: dts: iwg22m: Enable SDHI1 controller
  ARM: dts: iwg22d: Enable SDHI0 controller
  ARM: dts: r8a7743: Add QSPI support
  ARM: dts: iwg20m: Add SPI NOR support
  ARM: dts: r8a7745: Add QSPI support
  ARM: drs: iwg22m: Add SPI NOR support

 arch/arm/boot/dts/r8a7743-iwg20m.dtsi       | 26 ++++++++++
 arch/arm/boot/dts/r8a7743.dtsi              | 17 +++++++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 37 ++++++++++++++
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi       | 43 +++++++++++++++++
 arch/arm/boot/dts/r8a7745.dtsi              | 75 +++++++++++++++++++++++++++++
 5 files changed, 198 insertions(+)

-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
