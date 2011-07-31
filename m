From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv2] mtd: gpio-nand: add device tree bindings
Date: Sat, 30 Jul 2011 21:19:31 -0600
Message-ID: <20110731031931.GE24334@ponder.secretlab.ca>
References: <1311936391-20127-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1311936391-20127-1-git-send-email-jamie@jamieiles.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2011 at 11:46:31AM +0100, Jamie Iles wrote:
> Add device tree bindings so that the gpio-nand driver may be
> instantiated from the device tree.  This also allows the partitions
> to be specified in the device tree.
> 
> v2:
> 	- add CONFIG_OF guards for non-dt platforms
> 	- compatible becomes gpio-control-nand
> 	- clarify some binding details
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Hey Jamie,

Mostly looks good.  Comments below.  You can add my acked-by when you
address them.

[...]
> +static int gpio_nand_of_get_config(struct device *dev,
> +				   struct gpio_nand_platdata *plat)
> +{
> +	int ret = gpio_nand_of_get_options(dev, plat);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	gpio_nand_of_get_gpio(dev, plat);
> +	gpio_nand_of_get_chip_delay(dev, plat);

Personally, I would just open code it and not bother with the extra
functions, but whatever you prefer.

> +
> +	return 0;
> +}
> +#else /* CONFIG_OF */
> +#define gpio_nand_id_table NULL
> +static inline int gpio_nand_of_get_config(struct device *dev,
> +					  struct gpio_nand_platdata *plat)
> +{
> +	return -ENODEV;
> +}
> +#endif /* CONFIG_OF */
> +
>  static int __devinit gpio_nand_probe(struct platform_device *dev)
>  {
>  	struct gpiomtd *gpiomtd;
>  	struct nand_chip *this;
>  	struct resource *res0, *res1;
> -	int ret;
> +	int ret = 0;
>  
> -	if (!dev->dev.platform_data)
> +	if (!dev->dev.of_node && !dev->dev.platform_data)
>  		return -EINVAL;
>  
>  	res0 = platform_get_resource(dev, IORESOURCE_MEM, 0);
> @@ -257,11 +325,17 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
>  		}
>  	}
>  
> -	memcpy(&gpiomtd->plat, dev->dev.platform_data, sizeof(gpiomtd->plat));
> +	if (dev->dev.platform_data)
> +		memcpy(&gpiomtd->plat, dev->dev.platform_data,
> +		       sizeof(gpiomtd->plat));
> +	else
> +		ret = gpio_nand_of_get_config(&dev->dev, &gpiomtd->plat);
> +	if (ret)
> +		goto err_config;
>  
>  	ret = gpio_request(gpiomtd->plat.gpio_nce, "NAND NCE");
>  	if (ret)
> -		goto err_nce;
> +		goto err_config;

Nit: There's not much purpose it changing the label.

>  	gpio_direction_output(gpiomtd->plat.gpio_nce, 1);
>  	if (gpio_is_valid(gpiomtd->plat.gpio_nwp)) {
>  		ret = gpio_request(gpiomtd->plat.gpio_nwp, "NAND NWP");
> @@ -312,12 +386,21 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
>  		goto err_wp;
>  	}
>  
> -	if (gpiomtd->plat.adjust_parts)
> -		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
> -					   gpiomtd->mtd_info.size);
> +	if (dev->dev.platform_data) {
> +		if (gpiomtd->plat.adjust_parts)
> +			gpiomtd->plat.adjust_parts(&gpiomtd->plat,
> +						   gpiomtd->mtd_info.size);
> +	} else {
> +		ret = of_mtd_parse_partitions(&dev->dev, dev->dev.of_node,
> +					      &gpiomtd->plat.parts);
> +		if (ret < 0)
> +			goto err_wp;
>  
> +		gpiomtd->plat.num_parts = (unsigned int)ret;

Is the casting necessary?  I don't think it is.

> +	}
>  	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
>  			    gpiomtd->plat.num_parts);
> +

Nit: Unrelated whitespace change.

>  	platform_set_drvdata(dev, gpiomtd);
>  
>  	return 0;
> @@ -335,7 +418,7 @@ err_ale:
>  		gpio_free(gpiomtd->plat.gpio_nwp);
>  err_nwp:
>  	gpio_free(gpiomtd->plat.gpio_nce);
> -err_nce:
> +err_config:
>  	iounmap(gpiomtd->io_sync);
>  	if (res1)
>  		release_mem_region(res1->start, resource_size(res1));
> @@ -352,6 +435,7 @@ static struct platform_driver gpio_nand_driver = {
>  	.remove		= gpio_nand_remove,
>  	.driver		= {
>  		.name	= "gpio-nand",
> +		.of_match_table = gpio_nand_id_table,
>  	},
>  };
>  
> -- 
> 1.7.4.1
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
