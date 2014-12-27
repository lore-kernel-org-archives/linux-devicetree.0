From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] Add Armada 385 General Purpose Development Board support
Date: Sat, 27 Dec 2014 12:00:32 +0100
Message-ID: <1419678035-10658-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

this patch set adds the support for the Armada 385 GP board, this board
is pretty close to the Armada 385 RD one. It comes with a new revision
of the Armada 385 SoC (B0).

I added a patch from Maxime's serie to support the AP board to this
series.

Thanks,

Gr=C3=A9gory


Gregory CLEMENT (2):
  ARM: mvebu: a38x: Add the pinctrl alias
  ARM: mvebu: Add Armada 385 General Purpose Development Board support

Maxime Ripard (1):
  ARM: mvebu: a38x: Fix node names

 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/armada-385-db.dts |   2 +-
 arch/arm/boot/dts/armada-385-gp.dts | 380 ++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/armada-385-rd.dts |   2 +-
 arch/arm/boot/dts/armada-385.dtsi   |   2 +-
 arch/arm/boot/dts/armada-38x.dtsi   |   4 +-
 6 files changed, 386 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-385-gp.dts

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
