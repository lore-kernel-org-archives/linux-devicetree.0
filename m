From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 0/6] Add clock support for Mediatek MT2701
Date: Wed, 20 Jan 2016 14:35:41 +0800
Message-ID: <1453271747-57397-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is based on 4.4-rc7, add clock and reset controller
support for Mediatek MT2701.

This patchset also refined makefile and Kconfig to support configurable
multiple SoC clock support.

There is only a minor change since v3, which is correcting the parent
of mm_mdp_bls_26m.

changes since v3:
- Change the parent of mm_mdp_bls_26m from clk26m to pwm_sel.

changes since v2:
- Fix ethsys definition.
- Replace read-modify-write with regmap_update_bits() in clock operations.
- Move mt2701-resets.h to include/dt-bindings/reset/.
- Add hifsys reset patch from John Crispin.

changes since v1:
- Document MT2701 compatible strings.

James Liao (2):
  clk: mediatek: Refine the makefile to support multiple clock drivers
  dt-bindings: ARM: Mediatek: Document bindings for MT2701

Shunli Wang (4):
  clk: mediatek: Add dt-bindings for MT2701 clocks
  clk: mediatek: Add MT2701 clock support
  reset: mediatek: Add MT2701 reset controller dt-binding file
  reset: mediatek: Add MT2701 reset driver

James Liao (2):
  clk: mediatek: Refine the makefile to support multiple clock drivers
  dt-bindings: ARM: Mediatek: Document bindings for MT2701

Shunli Wang (4):
  clk: mediatek: Add dt-bindings for MT2701 clocks
  clk: mediatek: Add MT2701 clock support
  reset: mediatek: Add MT2701 reset controller dt-binding file
  reset: mediatek: Add MT2701 reset driver

 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    1 +
 .../bindings/arm/mediatek/mediatek,bdpsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,hifsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,pericfg.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/mediatek/Kconfig                       |   31 +
 drivers/clk/mediatek/Makefile                      |    7 +-
 drivers/clk/mediatek/clk-gate.c                    |   52 +
 drivers/clk/mediatek/clk-gate.h                    |    2 +
 drivers/clk/mediatek/clk-mt2701.c                  | 1216 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                     |   25 +
 drivers/clk/mediatek/clk-mtk.h                     |   35 +-
 include/dt-bindings/clock/mt2701-clk.h             |  481 ++++++++
 include/dt-bindings/reset/mt2701-resets.h          |   83 ++
 20 files changed, 2000 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,bdpsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 drivers/clk/mediatek/Kconfig
 create mode 100644 drivers/clk/mediatek/clk-mt2701.c
 create mode 100644 include/dt-bindings/clock/mt2701-clk.h
 create mode 100644 include/dt-bindings/reset/mt2701-resets.h

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
