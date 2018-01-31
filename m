From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/5] add MFD support for MediaTek audio subsystem
Date: Wed, 31 Jan 2018 15:42:40 +0800
Message-ID: <cover.1515639336.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is the 2nd version of the patch sets which modify clock driver to adapt
audio subsystem.  I still keeping 'simple-mfd' in the binding for discussion.
Rob, let me know if there is any problem with this.

changes since v2:
 - Drop useless changes in clk-mt7622-aud.c.
 - Revise binding text: 
	- Add more information about audio subsystem.
	- Separate clock node and AFE node.
 - Update license header.
changes since v1:
 - To avoid writing an MFD driver, we add "simple-mfd" in the audsys binding.
 - Move three top clocks to audio driver [1] as we remove mfd/mtk-audsys.c in v1.

Ryder Lee (5):
  clk: mediatek: update missing clock data for MT7622 audsys
  clk: mediatek: modify MT7622 audsys to adapt MFD device
  clk: mediatek: add audsys support for MT2701
  dt-bindings: clock: mediatek: update audsys documentation to adapt MFD
    device
  arm: dts: mediatek: add audio-subsystem node for both MT2701 and
    MT7623

 .../bindings/arm/mediatek/mediatek,audsys.txt      |  37 +++-
 arch/arm/boot/dts/mt2701.dtsi                      | 192 ++++++++++----------
 arch/arm/boot/dts/mt7623.dtsi                      | 193 ++++++++++-----------
 drivers/clk/mediatek/Kconfig                       |   6 +
 drivers/clk/mediatek/Makefile                      |   1 +
 drivers/clk/mediatek/clk-mt2701-aud.c              | 175 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt7622-aud.c              |   4 +-
 include/dt-bindings/clock/mt7622-clk.h             |   3 +-
 8 files changed, 406 insertions(+), 205 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt2701-aud.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
