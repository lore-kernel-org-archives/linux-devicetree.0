Return-Path: <SRS0=xE6g=XG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47686 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfIKTt7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Sep 2019 15:49:59 -0400
Subject: Re: [PATCH v7 2/2] leds: add LED driver for EL15203000 board
References: <20190909071632.14392-1-oleg@kaa.org.ua>
 <20190909071632.14392-3-oleg@kaa.org.ua>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <7a6fbf7c-56d4-e8af-c2f2-0a22f987f724@ti.com>
Date: Wed, 11 Sep 2019 14:49:52 -0500
MIME-Version: 1.0
In-Reply-To: <20190909071632.14392-3-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz
List-ID: <devicetree@vger.kernel.org>

Oleh

On 9/9/19 2:16 AM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the LEDs found on
> the Crane Merchandising System EL15203000 LEDs board
> (aka RED LEDs board).
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>   .../testing/sysfs-class-led-driver-el15203000 |  32 ++
>   drivers/leds/Kconfig                          |  13 +
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-el15203000.c                | 356 ++++++++++++++++++
>   4 files changed, 402 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
>   create mode 100644 drivers/leds/leds-el15203000.c

[...]

> +
> +static int el15203000_pattern_set_P(struct led_classdev *ldev,
> +				    struct led_pattern *pattern,
> +				    u32 len, int repeat)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	if (repeat > 0)
> +		return -EINVAL;
> +
> +	if (is_cascade(pattern, len, false, false)) {
> +		dev_dbg(led->priv->dev, "Cascade mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_CASCADE);
> +	} else if (is_cascade(pattern, len, true, false)) {
> +		dev_dbg(led->priv->dev, "Inverse cascade mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
> +	} else if (is_bounce(pattern, len, false)) {
> +		dev_dbg(led->priv->dev, "Bounce mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_BOUNCE);
> +	} else if (is_bounce(pattern, len, true)) {
> +		dev_dbg(led->priv->dev, "Inverse bounce mode for 0x%02x(%c)",
> +			led->reg, led->reg);
> +
> +		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
> +	}
> +

nitpicking a bit not a blocker just some clean up

maybe remove the dev_dbg statements and just set a local variable to the 
pipe cmd

if (is_cascade(pattern, len, false, false))

     pipe_cmd = EL_PIPE_CASCADE;

else if (is_cascade(pattern, len, true, false))

     pipe_cmd = EL_PIPE_INV_CASCADE;

else

     return -EINVAL;


return el15203000_cmd(led, pipe_cmd0:

> +	return -EINVAL;
> +}
> +
> +static int el15203000_pattern_clear(struct led_classdev *ldev)
> +{
> +	struct el15203000_led	*led = container_of(ldev,
> +						    struct el15203000_led,
> +						    ldev);
> +
> +	return el15203000_cmd(led, EL_OFF);
> +}
> +
> +static int el15203000_probe_dt(struct el15203000 *priv)
> +{
> +	struct el15203000_led	*led = priv->leds;
> +	struct fwnode_handle	*child;
> +	int			ret;
> +
> +	device_for_each_child_node(priv->dev, child) {
> +		struct led_init_data	init_data = {};
> +
> +		ret = fwnode_property_read_u32(child, "reg", &led->reg);
> +		if (ret) {
> +			dev_err(priv->dev, "LED without ID number");
> +			fwnode_handle_put(child);
> +
> +			return ret;
> +		}
> +
> +		if (led->reg > U8_MAX) {
> +			dev_err(priv->dev, "LED value %d is invalid", led->reg);
> +			fwnode_handle_put(child);
> +
> +			return -EINVAL;
> +		}
> +
> +		fwnode_property_read_string(child, "linux,default-trigger",
> +					    &led->ldev.default_trigger);
> +
> +		led->priv			  = priv;
> +		led->ldev.max_brightness	  = LED_ON;
> +		led->ldev.brightness_set_blocking = el15203000_set_blocking;
> +
> +		if (led->reg == 'S') {
> +			led->ldev.pattern_set	= el15203000_pattern_set_S;
> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
> +		} else if (led->reg == 'P') {
> +			led->ldev.pattern_set	= el15203000_pattern_set_P;
> +			led->ldev.pattern_clear	= el15203000_pattern_clear;
> +		}
> +
> +		init_data.fwnode = child;
> +		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
> +						     &init_data);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"failed to register LED device %s, err %d",
> +				led->ldev.name, ret);
> +			fwnode_handle_put(child);
> +
> +			return ret;
> +		}
> +
> +		led++;
> +	}
> +
> +	return ret;
> +}
> +
> +static int el15203000_probe(struct spi_device *spi)
> +{
> +	struct el15203000	*priv;
> +	size_t			count;
> +	int			ret;
> +
> +	count = device_get_child_node_count(&spi->dev);
> +	if (!count) {
> +		dev_err(&spi->dev, "LEDs are not defined in device tree!");
> +		return -ENODEV;
> +	}
> +
> +	priv = devm_kzalloc(&spi->dev, struct_size(priv, leds, count),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->lock);
> +	priv->count	= count;
> +	priv->dev	= &spi->dev;
> +	priv->spi	= spi;
> +	priv->delay	= jiffies -
> +			  usecs_to_jiffies(EL_FW_DELAY_USEC);
> +
> +	ret = el15203000_probe_dt(priv);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;

Another nitpick again just some clean up.

Set spi_set_drvdata before you call the probe_dt then return on 
el15203000_probe_dt this will allow you to eliminate the local ret variable.

so it would look like this:

spi_set_drvdata(spi, priv);

return el15203000_probe_dt(priv);

Otherwise

Reviewed-by: Dan Murphy <dmurphy@ti.com>

<snip>
