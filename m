From: Mike Turquette <mturquette@linaro.org>
Subject: [PATCH v3 0/5] clk: dt: bindings for mux, divider & gate clocks
Date: Thu, 20 Jun 2013 23:14:11 -0700
Message-ID: <1371795256-16703-1-git-send-email-mturquette@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Matt Sealey <neko@bakuhatsu.net>, Stephen Boyd <sboyd@codeaurora.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Tero Kristo <t-kristo@ti.com>, Mike Turquette <mturquette@linaro.org>
List-Id: devicetree@vger.kernel.org

This series introduces binding definitions for common register-mapped
clock multiplexer, divider and gate IP blocks along with the
corresponding setup functions for matching DT data.  The bindings are
similar to the struct definitions but please don't hold that against the
binding: the struct definitions closely model the hardware register
layout.

This version fixes bugs and incorporates support for the hiword-mask
property needed on Hisilicon and Rockchip platforms.

Tested on OMAP4460 Panda ES.

Mike Turquette (5):
  clk: divider: replace bitfield width with mask
  clk: of: helper for determining number of parent clocks
  clk: dt: binding for basic multiplexer clock
  clk: dt: binding for basic divider clock
  clk: dt: binding for basic gate clock

 .../devicetree/bindings/clock/divider-clock.txt    |  90 +++++++++++++++
 .../devicetree/bindings/clock/gate-clock.txt       |  36 ++++++
 .../devicetree/bindings/clock/mux-clock.txt        |  79 +++++++++++++
 arch/arm/mach-imx/clk-busy.c                       |   2 +-
 drivers/clk/clk-divider.c                          | 127 ++++++++++++++++++---
 drivers/clk/clk-gate.c                             |  43 +++++++
 drivers/clk/clk-mux.c                              |  65 ++++++++++-
 drivers/clk/clk.c                                  |   6 +
 drivers/clk/mxs/clk-div.c                          |   2 +-
 include/linux/clk-private.h                        |   2 +-
 include/linux/clk-provider.h                       |  12 +-
 11 files changed, 441 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/divider-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/gate-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mux-clock.txt

-- 
1.8.1.2
