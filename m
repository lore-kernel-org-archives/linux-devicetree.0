From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/6] clk: sun6i: Unify AHB1 clock and fix rate calculation
Date: Sat, 27 Sep 2014 16:49:48 +0800
Message-ID: <1411807795-6575-1-git-send-email-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This is v2 of the sun6i AHB1 clock unification series. This series
unifies the mux and divider parts of the AHB1 clock found on sun6i
and sun8i, while also adding support for the pre-divider on the
PLL6 input.

The rate calculation logic must factor in which parent it is using to
calculate the rate, to decide whether to use the pre-divider or not.
This is beyond the original factors clk design in sunxi. To avoid
feature bloat, this is implemented as a seperate composite clk.

The new clock driver is registered with a separate OF_CLK_DECLARE.
As it shares its register with the APB1 div clock, thus shares the same
spinlock, it cannot reside in a separate file.

This series also fixes up the PLL6 clock.

Changes since v1:

  - Dropped "clk: sunxi: Add post clk divider for factor clocks"

  - Added "clk: sunxi: Specify number of child clocks for divs clocks"

  - Reworked the PLL6 clock into a divs clock with 2 outputs.
    This matches the style of PLL6 on the other sunxi platforms.

  - Dropped "dmaengine: sun6i: Remove obsolete clk muxing code".
    Already merged.

The contents of this series are as follows:

Patch 1 makes the number of outputs on divs clocks configurable.

Patch 2 changes PLL6 into a divs clock with 2 outputs, 1 the normal PLL6
and 1 at double the clock rate. This patch also fixes rate calculation
error, due to one of the factor values starting from 1, instead of 0.

Patch 3 updates the DT with the new multiple output PLL6.

Patch 4 adds the unified AHB1 clock driver.

Patch 5 and 6 unify the AHB1 clock nodes on sun6i and sun8i respectively.

Patch 7 sets the default parent and clock rate for AHB1, as required by
the DMA controller. This is included for completeness as the original
clock muxing code in the dmaengine driver was removed. Maxime will test
whether this is needed.


Cheers
ChenYu

Chen-Yu Tsai (7):
  clk: sunxi: Specify number of child clocks for divs clocks
  clk: sunxi: Implement A31 PLL6 as a divs clock for 2x output
  ARM: sun6i: DT: Add PLL6 multiple outputs
  clk: sunxi: unify sun6i AHB1 clock with proper PLL6 pre-divider
  ARM: dts: sun6i: Unify ahb1 clock nodes
  ARM: dts: sun8i: Unify ahb1 clock nodes
  ARM: dts: sun6i: Add required ahb1 clock parent and rates for dma
    controller

 Documentation/devicetree/bindings/clock/sunxi.txt |   7 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                  |  41 ++--
 arch/arm/boot/dts/sun8i-a23.dtsi                  |  12 +-
 drivers/clk/sunxi/clk-sunxi.c                     | 248 ++++++++++++++++++++--
 4 files changed, 259 insertions(+), 49 deletions(-)

-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
