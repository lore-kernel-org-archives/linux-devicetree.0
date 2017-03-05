From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/6] iio: iio-interrupt-trigger: device-tree support
Date: Sun, 5 Mar 2017 12:18:38 +0000
Message-ID: <dc57ecb6-79ce-ba24-0b23-5166e30f8162@kernel.org>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-5-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488300679-3259-5-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, =?UTF-8?Q?Gr=c3=a9gor_Boirie?= <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28/02/17 16:51, Fabrice Gasnier wrote:
> From: Grégor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
> 
> Add compatible string that should be used in DT.
> Also cascade of_node to newly allocated trigger device.
> 
> Signed-off-by: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
I'd normally not keep Gregor's sign off in a patch that has been
changed like this.  If Gregor is happy it's a different matter,
but I suspect he hasn't replied yet as he is always very busy!

> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Otherwise, all good, subject to convincing the device tree
guys about the binding.

Jonathan
> ---
> Original PATCH from Gregor Boirie:
> https://marc.info/?l=linux-iio&m=145590953607905&w=4
> 
> Updates:
> - compatible string changed to "interrupt-trigger"
> - cascade of_node down to iio trigger device
> ---
>  drivers/iio/trigger/iio-trig-interrupt.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iio/trigger/iio-trig-interrupt.c b/drivers/iio/trigger/iio-trig-interrupt.c
> index e18f12b..6ee1f7e 100644
> --- a/drivers/iio/trigger/iio-trig-interrupt.c
> +++ b/drivers/iio/trigger/iio-trig-interrupt.c
> @@ -62,6 +62,7 @@ static int iio_interrupt_trigger_probe(struct platform_device *pdev)
>  	}
>  	iio_trigger_set_drvdata(trig, trig_info);
>  	trig_info->irq = irq;
> +	trig->dev.of_node = pdev->dev.of_node;
>  	trig->ops = &iio_interrupt_trigger_ops;
>  	ret = request_irq(irq, iio_interrupt_trigger_poll,
>  			  irqflags, trig->name, trig);
> @@ -104,11 +105,20 @@ static int iio_interrupt_trigger_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id iio_interrupt_trigger_of_match[] = {
> +	{ .compatible = "interrupt-trigger" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, iio_interrupt_trigger_of_match);
> +#endif
> +
>  static struct platform_driver iio_interrupt_trigger_driver = {
>  	.probe = iio_interrupt_trigger_probe,
>  	.remove = iio_interrupt_trigger_remove,
>  	.driver = {
>  		.name = "iio_interrupt_trigger",
> +		.of_match_table = of_match_ptr(iio_interrupt_trigger_of_match),
>  	},
>  };
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
