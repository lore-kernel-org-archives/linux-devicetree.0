From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: bcm2835: More flexible IO register remapping
Date: Mon, 12 Jun 2017 11:19:38 -0700
Message-ID: <0643c2ba-9cd3-b985-99d4-af02715aab85@gmail.com>
References: <28279803-78d2-4231-939b-89a8c895aba9@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <28279803-78d2-4231-939b-89a8c895aba9-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/12/2017 07:25 AM, Phil Elwell wrote:
> The BCM2835 AUX block contains two registers - AUXIRQ and AUXENB.
> The addition of an irqchip driver using AUXIRQ is hampered by
> the current DT node reserving both registers with a compatible string
> claimed by this bcm2835-aux-clk driver.
> 
> Ease the transition to separate DT nodes by detecting and handling
> the case where this driver's MEM resource has been reduced to include
> only the AUXENB register. Otherwise, use devm_ioremap to remap the
> region without reserving it.
> 
> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
> ---
>  drivers/clk/bcm/clk-bcm2835-aux.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
> index bd750cf..70d389e 100644
> --- a/drivers/clk/bcm/clk-bcm2835-aux.c
> +++ b/drivers/clk/bcm/clk-bcm2835-aux.c
> @@ -37,9 +37,22 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
>  	parent = __clk_get_name(parent_clk);
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	reg = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(reg))
> -		return PTR_ERR(reg);
> +	/*
> +	 * If the MEM resource is only 4 bytes long it covers just the
> +	 * AUXENB register, otherwise it is the entire AUX block.
> +	 */

Would be worth commenting why devm_ioremap_resource() is used here (to
avoid the implicit request mem_region) and not in the other case. Might
also be worth adding a comment that explains that this is temporary and
this kludge should be removed in the future in favor of the new bindings
only.

Thanks!
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
