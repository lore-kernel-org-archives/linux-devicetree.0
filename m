From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: at91/tc: add device tree support to atmel_tclib
Date: Sat, 28 Jan 2012 11:29:47 -0700
Message-ID: <20120128182947.GA4053@ponder.secretlab.ca>
References: <a311afe3c46da62f7a1e82d2fa933e24ad4eef7e.1326995849.git.nicolas.ferre@atmel.com>
 <185a4d609becfcd60bbd15b09612160cf6ea9346.1326995849.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <185a4d609becfcd60bbd15b09612160cf6ea9346.1326995849.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2012 at 07:05:11PM +0100, Nicolas Ferre wrote:
> Device tree support added to atmel_tclib: the generic Timer Counter
> library. This is used by the clocksource/clockevent driver tcb_clksrc.
> 
> The current DT enabled platforms are also modified to use it:
> - .dtsi files are modified to add Timer Counter Block entries
> - alias are created to allow identification of each block
> - clkdev lookup tables are added for clocks identification.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
...
> diff --git a/arch/arm/mach-at91/at91sam9g45_devices.c b/arch/arm/mach-at91/at91sam9g45_devices.c
> index 545bbe9..a0a217d 100644
> --- a/arch/arm/mach-at91/at91sam9g45_devices.c
> +++ b/arch/arm/mach-at91/at91sam9g45_devices.c
> @@ -995,8 +995,25 @@ static struct platform_device at91sam9g45_tcb1_device = {
>  	.num_resources	= ARRAY_SIZE(tcb1_resources),
>  };
>  
> +#if defined(CONFIG_OF)
> +static struct of_device_id tcb_ids[] = {
> +	{ .compatible = "atmel,at91rm9200-tcb" },
> +	{ /*sentinel*/ }
> +};
> +#endif
> +

Where is the documentation for this new binding?  Every new binding must
be documented in Documentation/devicetree/bindings, even if it is just a
short file listing all the trivial (only reg and irq) bindings used by
atmel devices.

Otherwise this looks fine and you can add my Acked-by:

g.
