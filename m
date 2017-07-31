From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] clk: meson: expose clk ids
Date: Mon, 31 Jul 2017 13:38:30 +0200
Message-ID: <20170731113832.26490-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In previous cycles, concerns have been raised about the way clocks are
exposed for the meson clock controller, only when validated and required
in DT.

Instead, this patchset expose all the known clocks which may be needed in
DT later on. The clocks left out are internal clocks which should never be
used directly in DT. These are mostly internal muxes and dividers of
composite clocks.

While this should reduce the patch flow on the related header files, It
won't stop it completely. There are still many clocks we don't know about
yet. We tend discover a few in every cycle.

This patchset depends on these fixes [0] to avoid issues when adding new
clk ids.

[0]: https://lkml.kernel.org/r/20170727161755.10393-1-jbrunet@baylibre.com

Jerome Brunet (2):
  clk: meson8b: expose every clock in the bindings
  clk: meson-gxbb: expose almost every clock in the bindings

 drivers/clk/meson/gxbb.h                 | 117 ++-----------------------------
 drivers/clk/meson/meson8b.h              | 103 ++-------------------------
 include/dt-bindings/clock/gxbb-clkc.h    |  60 ++++++++++++++++
 include/dt-bindings/clock/meson8b-clkc.h |  70 ++++++++++++++++++
 4 files changed, 141 insertions(+), 209 deletions(-)

-- 
2.9.4
