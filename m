From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/7] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Tue, 21 Feb 2017 11:49:08 +0100
Message-ID: <5e5bb50b-2bfc-15fb-6047-8b94530bef54@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
 <1487610788-6939-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487610788-6939-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
     small self-review

On 20/02/2017 18:13, Jacopo Mondi wrote:

[snip]

> +/**
> + * rza1_pinctrl_register() - Enumerate pins, ports, gpiochips and functions and
> + *			     register to pinctrl and gpio cores
> + *
> + * @rza1_pctl: RZ/A1 pin controller device
> + */
> +static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
> +{
> +	int ret;
> +	unsigned int i;
> +	struct rza1_port *ports;
> +	struct pinctrl_pin_desc *pins;
> +
> +	pins = devm_kcalloc(rza1_pctl->dev, RZA1_NPINS, sizeof(*pins),
> +			    GFP_KERNEL);
> +	ports = devm_kcalloc(rza1_pctl->dev, RZA1_NPORTS, sizeof(*ports),
> +			     GFP_KERNEL);
> +	if (!pins || !ports)
> +		return -ENOMEM;
> +
> +	rza1_pctl->pins		= pins;
> +	rza1_pctl->desc.pins	= pins;
> +	rza1_pctl->desc.npins	= RZA1_NPINS;
> +	rza1_pctl->ports	= ports;
> +
> +	for (i = 0; i < RZA1_NPINS; ++i) {
> +		unsigned int port = RZA1_PIN_TO_PORT(i);
> +		unsigned int offset = RZA1_PIN_TO_OFFSET(i);
> +
> +		pins[i].number = i;
> +		pins[i].name = kasprintf(GFP_KERNEL, "P%u-%u", port, offset);
> +
> +		if (i % RZA1_PINS_PER_PORT == 0) {
> +			/*
> +			 * Setup ports;
> +			 * they provide per-port lock and logical base address.
> +			 */
> +			unsigned int port_id = RZA1_PIN_TO_PORT(i);
> +
> +			ports[port_id].id = port_id;
> +			ports[port_id].base = rza1_pctl->base;
> +			ports[port_id].pins = &pins[i];
> +			spin_lock_init(&ports[port_id].lock);
> +		}
> +	}
> +
> +	ret = devm_pinctrl_register_and_init(rza1_pctl->dev, &rza1_pctl->desc,
> +					     rza1_pctl, &rza1_pctl->pctl);
> +	if (ret) {
> +		dev_err(rza1_pctl->dev,
> +			"RZ/A1 pin controller registration failed\n");
> +		return ret;
> +	}
> +
> +	ret = rza1_parse_dt(rza1_pctl);
> +	if (ret) {
> +		dev_err(rza1_pctl->dev, "RZ/A1 DT parsing failed\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rza1_pinctrl_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	unsigned int i;
> +	struct resource *res;
> +	struct rza1_pinctrl *rza1_pctl;
> +
> +	rza1_pctl = devm_kzalloc(&pdev->dev, sizeof(*rza1_pctl), GFP_KERNEL);
> +	if (!rza1_pctl)
> +		return -ENOMEM;
> +
> +	rza1_pctl->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (ret)
> +		return -ENODEV;
> +
> +	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(rza1_pctl->base))
> +		return PTR_ERR(rza1_pctl->base);
> +
> +	mutex_init(&rza1_pctl->mutex);
> +
> +	platform_set_drvdata(pdev, rza1_pctl);
> +
> +	rza1_pctl->desc.name	= DRIVER_NAME;
> +	rza1_pctl->desc.pctlops	= &rza1_pinctrl_ops;
> +	rza1_pctl->desc.pmxops	= &rza1_pinmux_ops;
> +	rza1_pctl->desc.owner	= THIS_MODULE;
> +
> +	ret = rza1_pinctrl_register(rza1_pctl);
> +	if (ret)
> +		return ret;
> +
> +	/* register pin control ranges collected while parsing device tree */
> +	for (i = 0; i < rza1_pctl->ngpiochips; i++)
> +		pinctrl_add_gpio_range(rza1_pctl->pctl,
> +				       &rza1_pctl->gpio_ranges[i]);

On a second thought, since I do have a "register" function, I should 
move this loop there.

Thanks
    j
