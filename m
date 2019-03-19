From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/4] clk: meson8b: add the VPU clock tree
Date: Tue, 19 Mar 2019 22:51:17 +0100
Message-ID: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: narmstrong@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
The VPU clock tree is slightly different on all three SoCs. The details
are explained in patch #4.

Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
exists on Meson8m2 - Meson8 and Meson8b don't have it.
A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
compatible string which is already available) to account for this SoC
specific clock setup.

dependencies:
This series is meant to be applied on top of my other patch from [0]:
  dt-bindings: clock: meson8b: drop the "ABP" clock definition


[0] https://patchwork.kernel.org/patch/10860387/


Martin Blumenstingl (4):
  dt-bindings: clock: meson8b: export the VPU clock
  clk: meson: meson8b: use a sparate clock table for Meson8m2
  clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
  clk: meson: meson8b: add the VPU clock trees

 drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h              |  12 +-
 include/dt-bindings/clock/meson8b-clkc.h |   1 +
 3 files changed, 433 insertions(+), 2 deletions(-)

-- 
2.21.0
