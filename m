From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: imx6sx-sdb: add revb board
Date: Wed, 21 Jan 2015 09:34:52 +0800
Message-ID: <1421804094-26379-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

The imx6sx-sdb board has two revisions, the current mainline is the
reva which is experimental and will not be released, the revb board
is used widely for internal and external users.

The main changes between reva and revb board:
- OOP setting
- pfuse
- qspi
- can transceiver (not mainlined)

Changes for v2:

- Add missing Makefile entries for both dts files. [Patch 1/2] and [Patch 2/2]
- Delete OOP setting changed at imx6sx-sdb-reva, it is SoC feature,
  it doesn't need to be change unless board limitations. [Patch 1/2]
- Add explanation why OOP setting need to changed at imx6sx-sdb revb board. [Patch 2/2]
- Make imx6sx-sdb revb board as default imx6sx-sdb board. [Patch 2/2]

Peter Chen (2):
  ARM: imx6sx-sdb: change default board as reva board
  ARM: imx6sx-sdb: add revb board and make it default

 arch/arm/boot/dts/Makefile            |   3 +-
 arch/arm/boot/dts/imx6sx-sdb-reva.dts | 143 +++++++++
 arch/arm/boot/dts/imx6sx-sdb.dts      | 588 ++--------------------------------
 arch/arm/boot/dts/imx6sx-sdb.dtsi     | 547 +++++++++++++++++++++++++++++++
 4 files changed, 720 insertions(+), 561 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6sx-sdb-reva.dts
 create mode 100644 arch/arm/boot/dts/imx6sx-sdb.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
