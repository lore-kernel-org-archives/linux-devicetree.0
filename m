From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/9] clk: meson: update clock controller for audio support
Date: Thu,  9 Mar 2017 11:41:45 +0100
Message-ID: <20170309104154.28295-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset is a first round of update to the meson clock controllers
to bring audio support. The patchset is based on clk-next. It could be
rebased on amlogic tree later on, if you prefer the patches to go through
Kevin's tree.

First patch fix an issue found while writing patch 5 (Giving ternary
operator to SET_PARM)

Following Stephen comment on the v1, patch 2 adds the const qualifiers
missing upstream.

Patches 3 and 4 put the generic muxes and divisors declaration in tables so
the register address fixup works in the same way as the clock gates. We are
going to add more of these clock types for audio or gpu support, so we
can't continue to fix addresses individually like it is currently done.

Patches 5 to 8 improve the support of the mpll clocks, now allowing the
rate to be set. Among other things, the mplls are the parent clocks of the
i2s and spdif clocks.

Patch 9 expose the clock gates required to power on the i2s output.

These patches have been tested on the meson gxbb p200 board, as part of the
ongoing work to bring audio support to meson SoC family.

Changes since v1 [0]:
 * Add SET_PARM fix to the series
 * Add missing const qualifiers to the clock arrays
 * No more additional patches required as SAR clocks have been merged

[0]: http://lkml.kernel.org/r/20170228133002.17894-1-jbrunet@baylibre.com

Jerome Brunet (9):
  clk: meson: fix SET_PARM macro
  clk: meson: add missing const qualifiers on gate arrays
  clk: meson8b: put dividers and muxes in tables
  clk: gxbb: put dividers and muxes in tables
  clk: meson: mpll: add rw operation
  clk: meson: gxbb: mpll: use rw operation
  clk: meson8b: add the mplls clocks 0, 1 and 2
  clk: meson: mpll: correct N2 maximum value
  dt-bindings: clk: gxbb: expose i2s output clock gates

 drivers/clk/meson/clk-mpll.c          | 152 ++++++++++++++++++++++++++++++++--
 drivers/clk/meson/clkc.h              |   6 +-
 drivers/clk/meson/gxbb.c              |  66 ++++++++++++---
 drivers/clk/meson/gxbb.h              |  10 +--
 drivers/clk/meson/meson8b.c           | 127 ++++++++++++++++++++++++++--
 drivers/clk/meson/meson8b.h           |  20 ++++-
 include/dt-bindings/clock/gxbb-clkc.h |   5 ++
 7 files changed, 356 insertions(+), 30 deletions(-)

-- 
2.9.3
