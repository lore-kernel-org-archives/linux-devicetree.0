From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 00/10] Add Basic SoC support for MT6797
Date: Mon, 6 Feb 2017 20:15:26 +0800
Message-ID: <1486383336-16892-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Chou <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chieh-Jay Liu <Chieh-Jay.Liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds basic SoC support for mediatek's first 10-core
chip, X20, also known as MT6797.

- based on 4.10-rc2
- support multiple base address for sysirq
- support common clk

Changes since v1:
- add multiple base addresses support, v1 only allow 2 bases
- clean up clk driver


Kevin-CW Chen (2):
  dt-bindings: arm: mediatek: document clk bindings for MT6797
  clk: mediatek: add clk support for MT6797

Mars Cheng (8):
  Document: DT: mediatek: multiple base address support for sysirq
  irqchip: mtk-sysirq: extend intpol base to arbitrary number
  Document: DT: Add bindings for mediatek MT6797 SoC Platform
  arm64: dts: mediatek: add mt6797 support
  soc: mediatek: refine scysys for mediatek platforms
  soc: mediatek: add MT6797 power dt-bindings
  soc: mediatek: add MT6797 scysys support
  arm64: dts: mediatek: add clk nodes for MT6797

 Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |    3 +-
 .../interrupt-controller/mediatek,sysirq.txt       |   14 +-
 .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |    6 +-
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6797-evb.dts        |   36 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi           |  250 +++++++
 drivers/clk/mediatek/Kconfig                       |   33 +
 drivers/clk/mediatek/Makefile                      |    5 +
 drivers/clk/mediatek/clk-mt6797-img.c              |   76 +++
 drivers/clk/mediatek/clk-mt6797-mm.c               |  136 ++++
 drivers/clk/mediatek/clk-mt6797-vdec.c             |   93 +++
 drivers/clk/mediatek/clk-mt6797-venc.c             |   78 +++
 drivers/clk/mediatek/clk-mt6797.c                  |  716 ++++++++++++++++++++
 drivers/irqchip/irq-mtk-sysirq.c                   |   71 +-
 drivers/soc/mediatek/mtk-scpsys.c                  |  149 +++-
 include/dt-bindings/clock/mt6797-clk.h             |  281 ++++++++
 include/dt-bindings/power/mt6797-power.h           |   30 +
 25 files changed, 1956 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6797.dtsi
 create mode 100644 drivers/clk/mediatek/clk-mt6797-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797.c
 create mode 100644 include/dt-bindings/clock/mt6797-clk.h
 create mode 100644 include/dt-bindings/power/mt6797-power.h

--
1.7.9.5
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
