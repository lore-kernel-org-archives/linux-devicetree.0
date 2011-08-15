From: Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
Date: Mon, 15 Aug 2011 16:57:56 +0300
Message-ID: <1313416681.2553.2.camel@sauron>
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
Reply-To: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312902747-21372-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2011-08-09 at 16:12 +0100, Jamie Iles wrote:
> +static int gpio_nand_of_get_options(struct device *dev,
> +				    struct gpio_nand_platdata *plat)
> +{
> +	u32 width;
> +
> +	if (!of_property_read_u32(dev->of_node, "bank-width", &width)) {
> +		if (width == 2) {
> +			plat->options |= NAND_BUSWIDTH_16;
> +		} else if (width != 1) {
> +			dev_err(dev, "invalid bank-width %u\n", width);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void gpio_nand_of_get_gpio(struct device *dev,
> +				  struct gpio_nand_platdata *plat)
> +{
> +	plat->gpio_rdy = of_get_gpio(dev->of_node, 0);
> +	plat->gpio_nce = of_get_gpio(dev->of_node, 1);
> +	plat->gpio_ale = of_get_gpio(dev->of_node, 2);
> +	plat->gpio_cle = of_get_gpio(dev->of_node, 3);
> +	plat->gpio_nwp = of_get_gpio(dev->of_node, 4);
> +}
> +
> +static void gpio_nand_of_get_chip_delay(struct device *dev,
> +					struct gpio_nand_platdata *plat)
> +{
> +	u32 chip_delay;
> +
> +	if (!of_property_read_u32(dev->of_node, "chip-delay", &chip_delay))
> +		plat->chip_delay = (int)chip_delay;
> +}
> +
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
> +
> +	return 0;
> +}

Do we really need to have 3 additional helper functions for
'gpio_nand_of_get_config()' ?

-- 
Best Regards,
Artem Bityutskiy
