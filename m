From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/13] clk: sunxi-ng: Add A64 clocks
Date: Fri, 29 Jul 2016 16:15:11 -0500
Message-ID: <20160729211511.GA5571@rob-hp-laptop>
References: <20160726203041.29366-1-maxime.ripard@free-electrons.com>
 <20160726203041.29366-9-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160726203041.29366-9-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2016 at 10:30:36PM +0200, Maxime Ripard wrote:
> Add the A64 CCU clocks set.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/sunxi-ng/Kconfig                       |  13 +-
>  drivers/clk/sunxi-ng/Makefile                      |   2 +-
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h              |  68 +++
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c                | 483 +++++++++++++++++++++
>  include/dt-bindings/clock/sun50i-a64-ccu.h         | 132 ++++++
>  include/dt-bindings/reset/sun50i-a64-ccu.h         |  97 +++++
>  7 files changed, 793 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a64.h
>  create mode 100644 include/dt-bindings/clock/sun50i-a64-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun50i-a64-ccu.h
