From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: imx6sx: Initial UDOO Neo enablement
Date: Tue,  5 Jul 2016 06:04:07 +0200
Message-ID: <1467691450-22975-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for the i.MX 6SoloX based UDOO Neo boa=
rds.

=46irst, a typo in another imx6sx board is fixed, found by code review.

The main patch adds an initial set of device trees with serial, LEDs,
Ethernet, I2C and PMIC.

A second patch adds SD card support. This part does not yet work stable=
,
I keep getting timeouts on next-20160701 with UDOO Neo Basic after vary=
ing time.

Regards,
Andreas

Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas F=C3=A4rber (3):
  ARM: dts: imx6sx-sabreauto: Fix misspelled property
  ARM: dts: imx6sx: Add UDOO Neo support
  ARM: dts: imx6sx-udoo-neo: Add SD

 arch/arm/boot/dts/Makefile                     |   5 +-
 arch/arm/boot/dts/imx6sx-sabreauto.dts         |   2 +-
 arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts    |  69 ++++++
 arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts |  54 +++++
 arch/arm/boot/dts/imx6sx-udoo-neo-full.dts     |  69 ++++++
 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi         | 295 +++++++++++++++++=
++++++++
 6 files changed, 492 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi

--=20
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
