From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 8/9] clk: sunxi-ng: Add A31/A31s clocks
Date: Wed, 27 Jul 2016 09:59:07 -0500
Message-ID: <20160727145907.GA24979@rob-hp-laptop>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
 <1469516671-19377-9-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469516671-19377-9-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, dev@linux-sunxi.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2016 at 03:04:30PM +0800, Chen-Yu Tsai wrote:
> Add a new style driver for the clock control unit in Allwinner A31/A31s.
> 
> A few clocks are still missing:
> 
>     - EMAC clock
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |    3 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    1 +
>  drivers/clk/sunxi-ng/ccu-sun6i-a31.c               | 1230 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun6i-a31.h               |   72 ++
>  include/dt-bindings/clock/sun6i-a31-ccu.h          |  187 +++
>  include/dt-bindings/reset/sun6i-a31-ccu.h          |  106 ++
>  7 files changed, 1608 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.h
>  create mode 100644 include/dt-bindings/clock/sun6i-a31-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun6i-a31-ccu.h
