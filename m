From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/3] watchdog: orion: don't enable rstout if an interrupt
 is configured
Date: Tue, 10 Oct 2017 20:41:53 -0700
Message-ID: <227eed69-c4c8-01a1-3c6b-6cf95e84a9cd@roeck-us.net>
References: <20171011022958.31268-1-chris.packham@alliedtelesis.co.nz>
 <20171011022958.31268-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171011022958.31268-3-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/10/2017 07:29 PM, Chris Packham wrote:
> The orion_wdt_irq invokes panic() so we are going to reset the CPU
> regardless.  By not setting this bit we get a chance to gather debug
> from the panic output before the system is reset.
> 
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>

Unless I am missing something, this assumes that the interrupt is
handled, ie that the system is not stuck with interrupts disabled.
This makes the watchdog less reliable. This added verbosity comes
at a significant cost. I'd like to get input from others if this
is acceptable.

That would be different if there was a means to configure a pretimeout,
ie a means to tell the system to generate an irq first, followed by a
hard reset if the interrupt is not served. that does not seem to be
the case here, though.

Guenter

> ---
>   drivers/watchdog/orion_wdt.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index ea676d233e1e..ce88f339ef7f 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -71,6 +71,7 @@ struct orion_watchdog {
>   	unsigned long clk_rate;
>   	struct clk *clk;
>   	const struct orion_watchdog_data *data;
> +	int irq;
>   };
>   
>   static int orion_wdt_clock_init(struct platform_device *pdev,
> @@ -203,9 +204,11 @@ static int armada375_start(struct watchdog_device *wdt_dev)
>   						dev->data->wdt_enable_bit);
>   
>   	/* Enable reset on watchdog */
> -	reg = readl(dev->rstout);
> -	reg |= dev->data->rstout_enable_bit;
> -	writel(reg, dev->rstout);
> +	if (!dev->irq) {
> +		reg = readl(dev->rstout);
> +		reg |= dev->data->rstout_enable_bit;
> +		writel(reg, dev->rstout);
> +	}
>   
>   	atomic_io_modify(dev->rstout_mask, dev->data->rstout_mask_bit, 0);
>   	return 0;
> @@ -228,9 +231,12 @@ static int armada370_start(struct watchdog_device *wdt_dev)
>   						dev->data->wdt_enable_bit);
>   
>   	/* Enable reset on watchdog */
> -	reg = readl(dev->rstout);
> -	reg |= dev->data->rstout_enable_bit;
> -	writel(reg, dev->rstout);
> +	if (!dev->irq) {
> +		reg = readl(dev->rstout);
> +		reg |= dev->data->rstout_enable_bit;
> +		writel(reg, dev->rstout);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -247,8 +253,9 @@ static int orion_start(struct watchdog_device *wdt_dev)
>   						dev->data->wdt_enable_bit);
>   
>   	/* Enable reset on watchdog */
> -	atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit,
> -				      dev->data->rstout_enable_bit);
> +	if (!dev->irq)
> +		atomic_io_modify(dev->rstout, dev->data->rstout_enable_bit,
> +					      dev->data->rstout_enable_bit);
>   
>   	return 0;
>   }
> @@ -595,6 +602,8 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   			dev_err(&pdev->dev, "failed to request IRQ\n");
>   			goto disable_clk;
>   		}
> +
> +		dev->irq = irq;
>   	}
>   
>   	watchdog_set_nowayout(&dev->wdt, nowayout);
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
