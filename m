From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/4] clk: at91: sckc: add support to specify registers
 bit offsets
Date: Fri, 10 May 2019 23:32:42 +0200
Message-ID: <20190510213242.GE7622@piout.net>
References: <1557487388-32098-1-git-send-email-claudiu.beznea@microchip.com>
 <1557487388-32098-3-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557487388-32098-3-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu.Beznea@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/05/2019 11:23:31+0000, Claudiu.Beznea@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Different IPs uses different bit offsets in registers for the same
> functionality, thus adapt the driver to support this.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  drivers/clk/at91/sckc.c | 100 ++++++++++++++++++++++++++++++++----------------
>  1 file changed, 67 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
> index 6c55a7a86f79..2a4ac548de80 100644
> --- a/drivers/clk/at91/sckc.c
> +++ b/drivers/clk/at91/sckc.c
> @@ -22,15 +22,23 @@
>  #define SLOWCK_SW_TIME_USEC	((SLOWCK_SW_CYCLES * USEC_PER_SEC) / \
>  				 SLOW_CLOCK_FREQ)
>  
> -#define	AT91_SCKC_CR			0x00
> -#define		AT91_SCKC_RCEN		(1 << 0)
> -#define		AT91_SCKC_OSC32EN	(1 << 1)
> -#define		AT91_SCKC_OSC32BYP	(1 << 2)
> -#define		AT91_SCKC_OSCSEL	(1 << 3)
> +#define	AT91_SCKC_CR		0x00
> +#define		AT91_SCKC_RCEN(off)	((off)->cr_rcen)
> +#define		AT91_SCKC_OSC32EN(off)	((off)->cr_osc32en)
> +#define		AT91_SCKC_OSC32BYP(off)	((off)->cr_osc32byp)
> +#define		AT91_SCKC_OSCSEL(off)	((off)->cr_oscsel)
> +
> +struct clk_slow_bits {
> +	u32 cr_rcen;

This bit is only used on sam9x5 so I wouldn't bother having it in the
structure, especially since its use will always be quite separate from
the other ones as it is controlling a separate clock.

> +	u32 cr_osc32en;
> +	u32 cr_osc32byp;
> +	u32 cr_oscsel;
> +};
>  
>  struct clk_slow_osc {
>  	struct clk_hw hw;
>  	void __iomem *sckcr;
> +	const struct clk_slow_bits *bits;
>  	unsigned long startup_usec;
>  };
>  
> @@ -39,6 +47,7 @@ struct clk_slow_osc {
>  struct clk_sama5d4_slow_osc {
>  	struct clk_hw hw;
>  	void __iomem *sckcr;
> +	const struct clk_slow_bits *bits;
>  	unsigned long startup_usec;
>  	bool prepared;
>  };
> @@ -48,6 +57,7 @@ struct clk_sama5d4_slow_osc {
>  struct clk_slow_rc_osc {
>  	struct clk_hw hw;
>  	void __iomem *sckcr;
> +	const struct clk_slow_bits *bits;
>  	unsigned long frequency;
>  	unsigned long accuracy;
>  	unsigned long startup_usec;
> @@ -58,6 +68,7 @@ struct clk_slow_rc_osc {
>  struct clk_sam9x5_slow {
>  	struct clk_hw hw;
>  	void __iomem *sckcr;
> +	const struct clk_slow_bits *bits;
>  	u8 parent;
>  };
>  
> @@ -69,10 +80,11 @@ static int clk_slow_osc_prepare(struct clk_hw *hw)
>  	void __iomem *sckcr = osc->sckcr;
>  	u32 tmp = readl(sckcr);
>  
> -	if (tmp & (AT91_SCKC_OSC32BYP | AT91_SCKC_OSC32EN))
> +	if (tmp & (AT91_SCKC_OSC32BYP(osc->bits) |
> +		   AT91_SCKC_OSC32EN(osc->bits)))

I still find that:

	if (tmp & (osc->bits->cr_osc32byp | osc->bits->cr_osc32en))

would be shorter and easier to read and still fits on one line.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
