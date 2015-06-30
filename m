From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] Add Mediatek MT8173 subsystem clocks support
Date: Tue, 30 Jun 2015 10:58:43 +0800
Message-ID: <1435633127-31952-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.1-rc1 plus [1], and contains subsystem
clocks support for Mediatek MT8173.

There are many different implementation suggestions due to each subsystem
HW contains multiple functions, such as clock and reset controllers.

In this patch, I still put subsystem clock implementations in
drivers/clk/mediatek, no mater reset controllers may need to implement
in the same directory in the future. That's because many other vendors
also implement clock and reset controllers in drivers/clk, and it looks
like an acceptible way.

changes since v1:
- Add CA7PLL and CA15PLL as critical clocks.
- Use the same register descriptor for imgsys, vensys and vencltsys.
- Generalize apmixedsys special clocks registration.

[1] https://lkml.org/lkml/2015/5/21/97

James Liao (3):
  dt-bindings: ARM: Mediatek: Document devicetree bindings for clock
    controllers
  clk: mediatek: Add subsystem clocks of MT8173
  clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS

Sascha Hauer (1):
  clk: mediatek: mt8173: Fix enabling of critical clocks

 .../bindings/arm/mediatek/mediatek,imgsys.txt      |  22 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  22 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |  22 +
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   |  22 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |  22 +
 drivers/clk/mediatek/clk-mt8173.c                  | 467 ++++++++++++++++++++-
 drivers/clk/mediatek/clk-pll.c                     |   7 +-
 include/dt-bindings/clock/mt8173-clk.h             |  94 ++++-
 8 files changed, 664 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt

--
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
