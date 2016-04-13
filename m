From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2 v5] clk/axs10x: Add I2S PLL clock driver
Date: Wed, 13 Apr 2016 12:35:38 -0500
Message-ID: <20160413173538.GA21769@rob-hp-laptop>
References: <cover.1460451903.git.joabreu@synopsys.com>
 <faab7d0fa8f93a815fc1114c7b752eddcdc2cfca.1460451903.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <faab7d0fa8f93a815fc1114c7b752eddcdc2cfca.1460451903.git.joabreu@synopsys.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, CARLOS.PALMINHA@synopsys.com, Vineet.Gupta1@synopsys.com, Alexey.Brodkin@synopsys.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 10:14:22AM +0100, Jose Abreu wrote:
> The ARC SDP I2S clock can be programmed using a
> specific PLL.
> 
> This patch has the goal of adding a clock driver
> that programs this PLL.
> 
> At this moment the rate values are hardcoded in
> a table but in the future it would be ideal to
> use a function which determines the PLL values
> given the desired rate.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> ---
> 
> Changes v4 -> v5:
> * Documentation update (as suggested by Alexey Brodkin)
> * Changed compatible string to "snps,axs10x-i2s-pll-clock" (as suggested by Alexey Brodkin)
> 
> Changes v3 -> v4:
> * Added binding document (as suggested by Stephen Boyd)
> * Minor code style fixes (as suggested by Stephen Boyd)
> * Use ioremap (as suggested by Stephen Boyd)
> * Implement round_rate (as suggested by Stephen Boyd)
> * Change to platform driver (as suggested by Stephen Boyd)
> * Use {readl/writel}_relaxed (as suggested by Vineet Gupta)
> 
> Changes v2 -> v3:
> * Implemented recalc_rate
> 
> Changes v1 -> v2:
> * Renamed folder to axs10x (as suggested by Alexey Brodkin)
> * Added more supported rates
> 
>  .../bindings/clock/axs10x-i2s-pll-clock.txt        |  17 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/axs10x/Makefile                        |   1 +
>  drivers/clk/axs10x/i2s_pll_clock.c                 | 217 +++++++++++++++++++++
>  4 files changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
>  create mode 100644 drivers/clk/axs10x/Makefile
>  create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c
