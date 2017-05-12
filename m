From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/9] arm: dts: extend mt7623 support
Date: Fri, 12 May 2017 15:56:37 +0800
Message-ID: <cover.1494574682.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Changes since v2:
- exclude those patches already queued into v4.11-next/dts32
- exclude those patches already sent in separation
- add mt7623a SoC basic support
- update binding SoC for mt7623n and relevant boards

Changes since v1:
Continue the upstream journey based on the previous John Crispin's good work.
- add fixes for the v1 suggestion
- fix typo in the commit log
- add missing pinctrl bindings for mt7623
- reuse pinctrl driver for mt7623
- enhance existing nodes since the way for binding is changed e.g USB
- add more nodes which already gets support from the latest tree e.g MT7530 DSA
- add the dts file for Bananapi R2 (BPI-R2) board

John Crispin (4):
  arm: dts: mt7623: add mt7623-mt6323.dtsi file
  arm: dts: mt7623: cleanup the mt7623n rfb uart nodes
  arm: dts: mt7623: enable the usb device on the mt7623n rfb
  arm: dts: mt7623: enable the nand device on the mt7623n nand rfb

Sean Wang (5):
  arm: dts: mt7623: rename mt7623-evb.dts to
    arch/arm/boot/dts/mt7623n-rfb.dtsi
  dt-bindings: arm: mediatek: update for MT7623n SoC and relevant boards
  dt-bindings: arm: mediatek: add bindings for mediatek MT7623a SoC
    Platform
  ARM: mediatek: add MT7623a smp bringup code
  arm: dts: mt7623: add dts file for Bananapi R2 (BPI-R2) board

 Documentation/devicetree/bindings/arm/mediatek.txt |  11 +-
 arch/arm/boot/dts/Makefile                         |   3 +-
 arch/arm/boot/dts/mt7623-evb.dts                   |  33 --
 arch/arm/boot/dts/mt7623-mt6323.dtsi               | 269 ++++++++++++
 arch/arm/boot/dts/mt7623.dtsi                      |   8 +-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts      | 478 +++++++++++++++++++++
 arch/arm/boot/dts/mt7623n-rfb-nand.dts             | 109 +++++
 arch/arm/boot/dts/mt7623n-rfb.dtsi                 |  61 +++
 arch/arm/mach-mediatek/mediatek.c                  |   2 +
 arch/arm/mach-mediatek/platsmp.c                   |   1 +
 10 files changed, 933 insertions(+), 42 deletions(-)
 delete mode 100644 arch/arm/boot/dts/mt7623-evb.dts
 create mode 100644 arch/arm/boot/dts/mt7623-mt6323.dtsi
 create mode 100644 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb-nand.dts
 create mode 100644 arch/arm/boot/dts/mt7623n-rfb.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
