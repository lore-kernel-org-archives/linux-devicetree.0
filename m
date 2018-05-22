From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/6] clk: meson: axg: add audio clock controller support
Date: Tue, 22 May 2018 18:34:51 +0200
Message-ID: <20180522163457.13834-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The purpose of this patchset is to add support for the clock controller
dedicated to the audio subsystem found on A113 based SoCs

The series depends on the CLK_MUX_ROUND_CLOSEST fixes [merged in clk-next]
and the duty cycle support [1] making their way into CCF.

First patch is a clean-up of the meson clk Kconfig.
Then, there is 3 clock provider drivers for clocks found in the audio
The last 3 are for the clock controller itself.

Changes since v1: [2]
 * Rebase clk-meson's next/drivers
 * Correct typo in documentation and squash DT patches

[1]: https://lkml.kernel.org/r/20180420211141.28929-1-jbrunet@baylibre.com
[2]: https://lkml.kernel.org/r/20180425163304.10852-1-jbrunet@baylibre.com

Jerome Brunet (6):
  clk: meson: clean-up meson clock configuration
  clk: meson: add clk-phase clock driver
  clk: meson: add triple phase clock driver
  clk: meson: add axg audio sclk divider driver
  dt-bindings: clock: add meson axg audio clock controller bindings
  clk: meson: axg: add the audio clock controller driver

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |  56 ++
 drivers/clk/meson/Kconfig                          |  28 +-
 drivers/clk/meson/Makefile                         |   3 +
 drivers/clk/meson/axg-audio.c                      | 845 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.h                      | 127 ++++
 drivers/clk/meson/clk-phase.c                      |  63 ++
 drivers/clk/meson/clk-triphase.c                   |  68 ++
 drivers/clk/meson/clkc-audio.h                     |  28 +
 drivers/clk/meson/clkc.h                           |   8 +
 drivers/clk/meson/sclk-div.c                       | 243 ++++++
 include/dt-bindings/clock/axg-audio-clkc.h         |  94 +++
 11 files changed, 1554 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
 create mode 100644 drivers/clk/meson/axg-audio.c
 create mode 100644 drivers/clk/meson/axg-audio.h
 create mode 100644 drivers/clk/meson/clk-phase.c
 create mode 100644 drivers/clk/meson/clk-triphase.c
 create mode 100644 drivers/clk/meson/clkc-audio.h
 create mode 100644 drivers/clk/meson/sclk-div.c
 create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h

-- 
2.14.3
