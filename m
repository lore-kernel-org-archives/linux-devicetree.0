From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] hwmon: Add devicetree bindings to gpio-fan
Date: Sat, 8 Sep 2012 09:32:23 +0200
Message-ID: <20120908073223.GB14466@lunn.ch>
References: <1347035675-23907-1-git-send-email-jm@lentin.co.uk>
 <1347035675-23907-2-git-send-email-jm@lentin.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1347035675-23907-2-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jamie

> +static int gpio_fan_get_of_pdata(struct device *dev,
> +			    struct gpio_fan_platform_data *pdata)
> +{
> +	struct device_node *node;
> +	struct gpio_fan_speed  *speed;
> +	unsigned *ctrl;
> +	unsigned i;
> +	u32 u;
> +	struct property *prop;
> +	const __be32 *p;
> +
> +	node = dev->of_node;
> +
> +	/* Fill GPIO pin array */
> +	pdata->num_ctrl = of_gpio_count(node);
> +	ctrl = devm_kzalloc(dev, pdata->num_ctrl * sizeof(unsigned),
> +				GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +	for (i = 0; i < of_gpio_count(node); i++) {


It seems unlikely the number of gpio pins is going to change while
inside this loop. So just use pdata->num_ctrl instead of counting them
every iteration.

> +		int val;
> +
> +		val = of_get_gpio(node, i);
> +		if (val >= 0)
> +			ctrl[i] = val;
> +		else
> +			return -EINVAL;
> +	}
> +	pdata->ctrl = ctrl;
> +
> +	/* Get speed map array size */
> +	i = 0;
> +	of_property_for_each_u32(node, "gpio-fan,speed-map", prop, p, u)
> +		i++;
> +	if (i & 1) {
> +		dev_err(dev, "gpio-fan,speed-map contains odd number of entries");
> +		return -ENODEV;
> +	}

This is not so clear on the first reading. i is the number of numbers
in the speed-map, and each entry needs two numbers, hence the (i & 1).
Maybe a comment to explain this? Or see if there is an of_ function
which returns records instead of individual properties?

> +static const struct of_device_id of_gpio_fan_match[] = {
> +	{ .compatible = "gpio-fan", },
> +	{},
> +};

This should probably have an __devinitdata attribute.

     Andrew
