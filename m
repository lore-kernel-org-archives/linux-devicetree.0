From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/7] clk: meson: update clock controller for audio support
Date: Tue, 28 Feb 2017 14:29:55 +0100
Message-ID: <20170228133002.17894-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset is a first round of update to the meson clock controllers
to bring audio support. The patchset is based on clk-next with two
additional patches from arm-soc next (to avoid conflict later on).
commit d356a86b1b30 ("clk: meson-gxbb: Export HDMI clocks")
commit 7d753a742127 ("clk: gxbb: add the SAR ADC clocks and expose them")

The 2 first patches of the series put the generic muxes and divisors
declaration in tables so the register address fixup works in the same way
as the clock gates. We are going to add more of these clock types for
audio or gpu support, so we can't continue to fix addresses individually
like it is currently done.

Patches 3 to 6 improve the support of the mpll clocks, now allowing the
rate to be set. Among other things, the mplls are the parent clocks of the
i2s and spdif clocks.

Patch 7 expose the clock gates required to power on the i2s output.

These patches have been tested on the meson gxbb p200 board, as part of the
ongoing work to bring audio support for meson SoC family.

Jerome Brunet (7):
  clk: meson8b: put dividers and muxes in tables
  clk: gxbb: put dividers and muxes in tables
  clk: meson: mpll: add rw operation
  clk: meson: gxbb: mpll: use rw operation
  clk: meson8b: add the mplls clocks 0, 1 and 2
  clk: meson: mpll: correct N2 maximum value
  dt-bindings: clk: gxbb: expose i2s output clock gates

 drivers/clk/meson/clk-mpll.c          | 152 ++++++++++++++++++++++++++++++++--
 drivers/clk/meson/clkc.h              |   4 +-
 drivers/clk/meson/gxbb.c              |  64 +++++++++++---
 drivers/clk/meson/gxbb.h              |  10 +--
 drivers/clk/meson/meson8b.c           | 126 +++++++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h           |  20 ++++-
 include/dt-bindings/clock/gxbb-clkc.h |   5 ++
 7 files changed, 354 insertions(+), 27 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
