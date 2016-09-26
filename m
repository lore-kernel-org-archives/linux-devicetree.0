From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v2] MIPS: Octeon: mark GPIO controller node not populated
 after IRQ init.
Date: Mon, 26 Sep 2016 23:41:01 +0300
Message-ID: <20160926204101.GB19498@raspberrypi.musicnaut.iki.fi>
References: <57C0922C.40907@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57C0922C.40907-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Steven J. Hill" <Steven.Hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Aug 26, 2016 at 02:02:04PM -0500, Steven J. Hill wrote:
> We clear the OF_POPULATED flag for the GPIO controller node on Octeon
> processors. Otherwise, none of the devices hanging on the GPIO lines
> are probed. The 'gpio-leds' driver on OCTEON failed to probe in addition
> to other devices on Cavium 71xx and 78xx development boards.
> 
> Fixes: 15cc2ed6dcf9 ("of/irq: Mark initialised interrupt controllers as populated")
> Signed-off-by: Steven J. Hill <steven.hill-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> Tested-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>

Ralf, I think this patch should be still included in v4.8 final.

Thanks,

A.

> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index 5a9b87b..c1eb1ff 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1619,6 +1619,12 @@ static int __init octeon_irq_init_gpio(
>  		return -ENOMEM;
>  	}
> 
> +	/*
> +	 * Clear the OF_POPULATED flag that was set by of_irq_init()
> +	 * so that all GPIO devices will be probed.
> +	 */
> +	of_node_clear_flag(gpio_node, OF_POPULATED);
> +
>  	return 0;
>  }
>  /*
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
