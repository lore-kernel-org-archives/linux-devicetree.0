From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v1 0/8] clk: meson: gxbb: more clock controller update for audio support
Date: Tue, 28 Mar 2017 16:45:57 +0200
Message-ID: <20170328144605.25278-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patchset is the 2nd round of update to the meson gxbb clock controller
to add initial audio support. The patchset is based on clk-next.

There is not much out of the ordinary here (adding new clocks and exposing
them) except maybe for 2 patches:
Patch #2: Adds a safety check while registering clocks to protect against
          holes in clk_hw_onecell_data, if it ever happens. Same thing is
	  done for the meson8b clock controller. 
Patch #3: Adds a new clock divider driver to implement the necessary
          policy for the i2s master clock (see patch changelog)

This patchset has been test on the gxbb p200 and gxl p230.

Jerome Brunet (8):
  dt-bindings: clock: gxbb: expose spdif clock gates
  clk: meson: gxbb: protect against holes in the onecell_data array
  clk: meson: add audio clock divider support
  clk: meson: gxbb: add cts_amclk
  clk: meson: gxbb: add cts_mclk_i958
  clk: meson: gxbb: add cts_i958 clock
  dt-bindings: clock: gxbb: expose i2s master clock
  dt-bindings: clock: gxbb: expose spdif master clock

 drivers/clk/meson/Makefile            |   2 +-
 drivers/clk/meson/clk-audio-divider.c | 149 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h              |  10 +++
 drivers/clk/meson/gxbb.c              | 144 ++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |  13 ++-
 include/dt-bindings/clock/gxbb-clkc.h |   5 ++
 6 files changed, 319 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/meson/clk-audio-divider.c

-- 
2.9.3
