From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/2] backlight arcxcnn add support for ArcticSand
 devices
Date: Fri, 06 Jan 2017 17:31:17 -0800
Message-ID: <1483752677.2449.7.camel@perches.com>
References: <1483735689-5452-1-git-send-email-olimpiu@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483735689-5452-1-git-send-email-olimpiu@arcticsand.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olimpiu Dejeu <olimpiu@arcticsand.com>, robh@kernel.org
Cc: lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jingoohan1@gmail.com, bdodge@arcticsand.com
List-Id: devicetree@vger.kernel.org

On Fri, 2017-01-06 at 15:48 -0500, Olimpiu Dejeu wrote:
> backlight: Add support for Arctic Sand LED backlight driver chips
> This driver provides support for the Arctic Sand arc2c0608 chip, 
>     and provides a framework to support future devices.

style trivia:

> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlight/arcxcnn_bl.c
[]
> +static int arcxcnn_bl_update_status(struct backlight_device *bl)
> +{
> +	struct arcxcnn *lp = bl_get_data(bl);
> +	u32 brightness = bl->props.brightness;
> +
> +	if (bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +		brightness = 0;
> +
> +	arcxcnn_set_brightness(lp, brightness);
> +
> +	/* set power-on/off/save modes */
> +	if (bl->props.power == 0)
> +		/* take out of standby */
> +		arcxcnn_update_bit(lp, ARCXCNN_CMD, ARCXCNN_CMD_STDBY, 0);
> +	else
> +		 /* place in low-power standby mode */
> +		arcxcnn_update_bit(lp, ARCXCNN_CMD,
> +				ARCXCNN_CMD_STDBY, ARCXCNN_CMD_STDBY);

This is generally smaller code using a temporary and
a single call instead of two calls like:

	int cmd;

	...

	if (bl->props.power == 0)
		cmd = 0;		/* take out of standby */
	else
		cmd = ARCXCNN_CMD_STDBY;
	arcxcnn_update_bit(lp, ARCXCNN_CMD, ARCXCNN_CMD_STDBY, cmd);

or maybe

	arcxcnn_update_bit(lp, ARCXCNN_CMD, ARCXCNN_CMD_STDBY,
			   bl->props.power == 0 ? 0 : ARCXCNN_CMD_STDBY);

> +static int arcxcnn_backlight_register(struct arcxcnn *lp)
> +{
> +	struct backlight_properties *props;
> +	const char *name = lp->pdata->name ? : "arctic_bl";
> +
> +	props = devm_kzalloc(lp->dev, sizeof(*props), GFP_KERNEL);
> +	if (!props)
> +		return -ENOMEM;
> +
> +	memset(props, 0, sizeof(props));

props has already been zeroed by devm_kzalloc and doesn't
need to be memset to 0 again.

> +	props->type = BACKLIGHT_PLATFORM;
> +	props->max_brightness = MAX_BRIGHTNESS;
> +
> +	if (lp->pdata->initial_brightness > props->max_brightness)
> +		lp->pdata->initial_brightness = props->max_brightness;
> +
> +	props->brightness = lp->pdata->initial_brightness;
> +
> +	lp->bl = devm_backlight_device_register(lp->dev, name, lp->dev, lp,
> +				       &arcxcnn_bl_ops, props);
> +

This blank line above is generally not needed.

> +	if (IS_ERR(lp->bl))
> +		return PTR_ERR(lp->bl);

the typical style is:

	rtn = foo(...)
	if (rtn < 0)
		error_handler...

> +static void arcxcnn_parse_dt(struct arcxcnn *lp)
> +{
> +	struct device *dev = lp->dev;
> +	struct device_node *node = dev->of_node;
> +	u32 prog_val, num_entry, entry, sources[ARCXCNN_LEDEN_BITS];
> +	int ret;
[]
> +	ret = of_property_count_u32_elems(node, "led-sources");
> +	if (ret < 0) {
> +		lp->pdata->leden = ARCXCNN_LEDEN_MASK; /* all on is default */
> +	} else {
> +		num_entry = ret;
> +		if (num_entry > ARCXCNN_LEDEN_BITS)
> +			num_entry = ARCXCNN_LEDEN_BITS;
> +
> +		ret = of_property_read_u32_array(node, "led-sources", sources,
> +					num_entry);
> +		if (ret < 0) {
> +			dev_err(dev, "led-sources node is invalid.\n");
> +		} else {
> +			u8 onbit;
> +
> +			lp->pdata->leden = 0;
> +
> +			/* for each enable in source, set bit in led enable */
> +			for (entry = 0; entry < num_entry; entry++) {
> +				onbit = 1 << sources[entry];
> +				lp->pdata->leden |= onbit;
> +			}
> +		}
> +	}
> +}

The cascading indentation can be avoided by using return;
as necessary

	ret = of_property_count_u32_elems(node, "led-sources");
	if (ret < 0) {
		lp->pdata->leden = ARCXCNN_LEDEN_MASK; /* all on is default */
		return;
	}

	num_entry = min(ret, ARCXCNN_LEDEN_BITS);
	ret = of_property_read_u32_array(node, "led-sources", sources, num_entry);
	if (ret < 0) {
		dev_err(dev, "led-sources node is invalid\n");
		return;
	}

	lp->pdata->leden = 0;

	/* for each enable in source, set bit in led enable */
	for (entry = 0; entry < num_entry; entry++) {
		u8 onbit = 1 << sources[entry];

		lp->pdata->leden |= onbit;
	}
