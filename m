From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/2] clk: meson: add mmc input 0 clocks
Date: Mon, 31 Jul 2017 13:56:01 +0200
Message-ID: <20170731115603.29720-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patchset adds the clocks feeding the clock input 0 of the mmc
controllers

This patchset depends on the following patchset being merged first:
* https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
* https://lkml.kernel.org/r/20170731113832.26490-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

FIXME:
We need CLK_IGNORE_UNUSED in clock flags because mmc DT node point to
xtal instead of these clocks. W/O the flag, CCF would gate the mmc clocks
on boot, killing the mmc controllers. CLK_IGNORE_UNUSED could be removed
once the DT is fixed

Changes between v2 and v3 [1]:
* Split driver and header changes
* Add CLK_INGORE_UNUSED flag

Changes between v1 and v2 [0]:
* Correct commit description and comments.

[1]: https://lkml.kernel.org/r/20170727103902.3262-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
[0]: https://lkml.kernel.org/r/20170726203138.11367-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org

Jerome Brunet (2):
  clk: meson: gxbb: Add sd_emmc clk0 clkids
  clk: meson: gxbb: Add sd_emmc clk0 clocks

 drivers/clk/meson/gxbb.c              | 177 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |  10 +-
 include/dt-bindings/clock/gxbb-clkc.h |   3 +
 3 files changed, 188 insertions(+), 2 deletions(-)

-- 
2.9.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
