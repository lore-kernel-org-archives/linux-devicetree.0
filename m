From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/7] clk: sun6i: Unify AHB1 clock and fix rate calculation
Date: Sat,  6 Sep 2014 18:47:21 +0800
Message-ID: <1410000448-9999-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBROMVOQAKGQE56GOECY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series unifies the mux and divider parts of the AHB1 clock found
on sun6i and sun8i, while also adding support for the pre-divider on
the PLL6 input.

The rate calculation logic must factor in which parent it is using to
calculate the rate, to decide whether to use the pre-divider or not.
This is beyond the original factors clk design in sunxi. To avoid
feature bloat, this is implemented as a seperate composite clk.

The new clock driver is registered with a separate OF_CLK_DECLARE.
This is done so that assigned-clocks* properties on the clk provider
node can actually work. The clock framework arranges the clock setup
order by checking whether all clock parents are available, by checking
the node matching OF_CLK_DECLARE.

However, the sunxi clk driver is based on the root node compatible,
has no defined dependencies (parents), and is setup before the fixed-rate
clocks. Thus when the ahb1 clock is added, all parents have rate = 0.
There is no way to calculate the required clock factors to set a default
clock rate under these circumstances. This happens when we set the
defaults in the clock node (provider), rather than a clock consumer.

I can think of 2 ways to solve the dependency issue, but neither is
pretty. One would be to move the root fixed-rate clocks into the sunxi
clk driver. The other would be separating all the clocks into individual
OF_CLK_DECLARE statements, which adds a lot of boilerplate code.


The contents of this series are as follows:

Patch 1 adds support for a fixed divider on the output of factor clocks,
which is used by the next patch.

Patch 2 fixes PLL6 rate calculation error, due to one of the factor values
starting from 1, instead of 0. It also adds the /2 divider on the output.

Patch 3 adds the unified AHB1 clock driver.

Patch 4 and 5 unify the AHB1 clock nodes on sun6i and sun8i respectively.

Patch 6 sets the default parent and clock rate for AHB1, as required by
the DMA controller. Curiously I did not require this when I tried dmatest
on my A31 Hummingbird.

Patch 7 removes the clk_set_parent calls from the sun6i-dma driver, as
it no longer works, and is replaced by the previous patch.


Suggestions are more than welcome.


Cheers
ChenYu


Chen-Yu Tsai (7):
  clk: sunxi: Add post clk divider for factor clocks
  clk: sunxi: Fix PLL6 calculation on sun6i
  clk: sunxi: unify sun6i AHB1 clock with proper PLL6 pre-divider
  ARM: dts: sun8i: Unify ahb1 clock nodes
  ARM: dts: sun6i: Unify ahb1 clock nodes
  ARM: dts: sun6i: Add required ahb1 clock parent and rates for dma
    controller
  dmaengine: sun6i: Remove obsolete clk muxing code

 Documentation/devicetree/bindings/clock/sunxi.txt |   2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                  |  17 +-
 arch/arm/boot/dts/sun8i-a23.dtsi                  |  12 +-
 drivers/clk/sunxi/clk-factors.c                   |   3 +
 drivers/clk/sunxi/clk-factors.h                   |   1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 215 +++++++++++++++++++++-
 drivers/dma/sun6i-dma.c                           |  23 ---
 7 files changed, 227 insertions(+), 46 deletions(-)

-- 
2.1.0
