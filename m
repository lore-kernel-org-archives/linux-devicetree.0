From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v12 0/4] Add clock support for Mediatek MT2701
Date: Mon, 22 Aug 2016 16:29:21 +0800
Message-ID: <1471854565-19810-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series is based on clk-next, add clock and reset controller support
for Mediatek MT2701.

Since some patches in v11 had been applied into clk-next, they were not
included in v12 series.

changes since v11:
- Rebase to clk-next.
- Return error code from probe() if clock registration fail.

changes since v10:
- Remove COMMON_CLK dependency from clk/mediatek/Kconfig.

changes since v9:
- Rebase to v4.8-rc1.
- Drop a fix patch of parent clock initial state. It will be replaced by a new
  patch from Mike/Stephen.
- Replace clk.h with clk-provider.h.
- Correct register settings of clocks.

changes since v8:
- Rebase to v4.7-rc1.
- Include mt2701-resets.h in mt2701.dtsi.
- Remove an unused property from apmixedsys DT node.

changes since v7:
- Rebase to clk-next.
- Implement subsystem clocks in seperated files.
- Replace critical clock enabling with CLK_IS_CRITICAL flag.
- Reduce most clock registrations in CLK_OF_DECLARE().
- Remove __init and __initconst from most init fucntions and data,
  and replace driver registration with platform_driver_register().
- Replace some common function or variable names with unique names.
- Use real clock for UARTs.

changes since v6:
- Rebase to v4.6-rc1.
- Register subsystem clocks in probe() instead of CLK_OF_DECLARE().
- Add clocks that referred by subsystem clocks.
- Fix clk_data size of apmixedsys.
- Add config options for each subsystem clock provider.

changes since v5:
- Rebase to v4.5-rc1 and [1].
- Enable critical clocks for MT2701
- Refine dt-binding documents, add reset controller support for hifsys.

changes since v4:
- Rebase to v4.5-rc1.
- Remove CLK_SET_RATE_PARENT from divider flags.
- Add img_jpgdec_smi clock.
- Move clk/mediatek/Kconfig into menu section in clk/Kconfig.

changes since v3:
- Change the parent of mm_mdp_bls_26m from clk26m to pwm_sel.

changes since v2:
- Fix ethsys definition.
- Replace read-modify-write with regmap_update_bits() in clock operations.
- Move mt2701-resets.h to include/dt-bindings/reset/.
- Add hifsys reset patch from John Crispin.

changes since v1:
- Document MT2701 compatible strings.

[1] https://patchwork.kernel.org/patch/8147901/

Erin Lo (1):
  arm: dts: mt2701: Use real clock for UARTs

James Liao (1):
  arm: dts: mt2701: Add clock controller device nodes

Shunli Wang (2):
  clk: mediatek: Add MT2701 clock support
  reset: mediatek: Add MT2701 reset driver

 arch/arm/boot/dts/mt2701.dtsi          |   50 +-
 drivers/clk/mediatek/Kconfig           |   43 ++
 drivers/clk/mediatek/Makefile          |    7 +
 drivers/clk/mediatek/clk-gate.c        |   52 ++
 drivers/clk/mediatek/clk-gate.h        |    2 +
 drivers/clk/mediatek/clk-mt2701-bdp.c  |  141 +++++
 drivers/clk/mediatek/clk-mt2701-eth.c  |   83 +++
 drivers/clk/mediatek/clk-mt2701-hif.c  |   84 +++
 drivers/clk/mediatek/clk-mt2701-img.c  |   83 +++
 drivers/clk/mediatek/clk-mt2701-mm.c   |  126 ++++
 drivers/clk/mediatek/clk-mt2701-vdec.c |   94 +++
 drivers/clk/mediatek/clk-mt2701.c      | 1047 ++++++++++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c         |   40 ++
 drivers/clk/mediatek/clk-mtk.h         |   41 +-
 drivers/clk/mediatek/clk-pll.c         |    1 +
 15 files changed, 1884 insertions(+), 10 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt2701-bdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-hif.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701.c

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
