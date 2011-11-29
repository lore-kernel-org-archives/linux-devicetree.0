From: Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/5] mfd: mc13xxx: add device tree probe support
Date: Tue, 29 Nov 2011 13:53:31 +0530
Message-ID: <4ED49683.10609@ti.com>
References: <1322487439-27254-1-git-send-email-shawn.guo@linaro.org>
 <1322487439-27254-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322487439-27254-2-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

[]...
> +};
> +MODULE_DEVICE_TABLE(of, mc13xxx_dt_ids);
> +
>   static int mc13xxx_probe(struct spi_device *spi)
>   {
> +	struct device_node *np = spi->dev.of_node;
> +	const struct of_device_id *of_id;
> +	struct spi_driver *sdrv = to_spi_driver(spi->dev.driver);
>   	struct mc13xxx *mc13xxx;
>   	struct mc13xxx_platform_data *pdata = dev_get_platdata(&spi->dev);
>   	enum mc13xxx_id id;
>   	int ret;
>
> -	if (!pdata) {
> -		dev_err(&spi->dev, "invalid platform data\n");
> -		return -EINVAL;
> -	}
> +	of_id = of_match_device(mc13xxx_dt_ids,&spi->dev);
> +	if (of_id)
> +		sdrv->id_table =&mc13xxx_device_id[(enum mc13xxx_id) of_id->data];
>
>   	mc13xxx = kzalloc(sizeof(*mc13xxx), GFP_KERNEL);
>   	if (!mc13xxx)
> @@ -735,6 +787,15 @@ static int mc13xxx_probe(struct spi_device *spi)
>   	if (ret)
>   		goto err_mask;
>
> +	mc13xxx->irq_gpio = of_get_named_gpio(np, "mc13xxx-irq-gpios", 0);
> +	if (gpio_is_valid(mc13xxx->irq_gpio)) {
> +		ret = gpio_request_one(mc13xxx->irq_gpio, GPIOF_IN,
> +				       "mc13xxx-irq");
> +		if (ret)
> +			goto err_mask;
> +		spi->irq = gpio_to_irq(mc13xxx->irq_gpio);

This seems wrong, because its adding information about the irq actually
being a gpio within the driver (which was otherwise hidden by the board
files doing a gpio_to_irq()). What happens if on some device this is
actually hooked to an irq line instead of a gpio?
There should be a better way to do this using Device tree.
