From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/3] clk: at91: sckc: add support for SAM9X60
Date: Mon, 18 Feb 2019 22:20:07 +0100
Message-ID: <20190218212007.GW10129@piout.net>
References: <1550146447-1441-1-git-send-email-claudiu.beznea@microchip.com>
 <1550146447-1441-3-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550146447-1441-3-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14/02/2019 12:14:32+0000, Claudiu.Beznea@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Add support for SAM9X60.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/clk/at91/sckc.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
> index b7163d3a2269..b3075c51d260 100644
> --- a/drivers/clk/at91/sckc.c
> +++ b/drivers/clk/at91/sckc.c
> @@ -459,6 +459,36 @@ static void __init of_at91sam9x5_sckc_setup(struct device_node *np)
>  CLK_OF_DECLARE(at91sam9x5_clk_sckc, "atmel,at91sam9x5-sckc",
>  	       of_at91sam9x5_sckc_setup);
>  
> +static const struct clk_slow_offsets at91sam9x60_offsets = {
> +	.cr_rcen = AT91_SCKC_OFFSET_INVALID,
> +	.cr_osc32en = 1,
> +	.cr_osc32byp = 2,
> +	.cr_oscsel = 24,
> +};
> +
> +static void __init of_at91sam9x60_sckc_setup(struct device_node *np)
> +{
> +	struct device_node *childnp;
> +	void (*clk_setup)(struct device_node *np, void __iomem *io,
> +			  const struct clk_slow_offsets *offsets);
> +	const struct of_device_id *clk_id;
> +	void __iomem *regbase = of_iomap(np, 0);
> +
> +	if (!regbase)
> +		return;
> +
> +	for_each_child_of_node(np, childnp) {
> +		clk_id = of_match_node(sckc_clk_ids, childnp);
> +		if (!clk_id)
> +			continue;
> +		clk_setup = clk_id->data;
> +		clk_setup(childnp, regbase, &at91sam9x60_offsets);
> +	}

You actually need to have new bindings. The sam9x60 registration should
look more like the sama5d4 registration. I have a rework for the sam9x5
sckc that I will send this week to have a proper binding (i.e: no
children).

However, there is a fundamental change in the sam9x60, previously, the
sckc had only one output clock. the sam9x60 has both td_slck and
md_slck. Both need to be accessible because they are input to the PMC.

This means you will have to register the sckc with of_clk_hw_onecell_get
as the get callback.

We could still decide to do the same with sam9x5 even if it has only one
output clock.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
