From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH v3 2/2] mfd: lm3533: Support initialization from
 Device Tree
Date: Mon, 11 Apr 2016 13:30:09 +0100
Message-ID: <20160411123009.GV8094@x1>
References: <1459405677-15696-1-git-send-email-bjorn.andersson@linaro.org>
 <1459405677-15696-2-git-send-email-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459405677-15696-2-git-send-email-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Mar 2016, Bjorn Andersson wrote:

> From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>=20
> Implement Device Tree parsing functions to support initialization of =
the
> lm3533 drivers.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> Changes since v2:
> - Drop vendor prefix of vendor properties
> - Specify unit of various properties
> - Fix reference paths
>=20
> Changes since v1:
> - Added unit to boost-freq and als-resistance (as the frequency now c=
omes with
>   a unit specifier I changed it to be expressed in kHz)
>=20
>  drivers/mfd/lm3533-core.c | 264 ++++++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 264 insertions(+)
>=20
> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 5abcbb2e8849..dbf26d86fe85 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/gpio.h>
>  #include <linux/i2c.h>
>  #include <linux/mfd/core.h>
> +#include <linux/of_gpio.h>
>  #include <linux/regmap.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> @@ -25,6 +26,7 @@
> =20
>  #include <linux/mfd/lm3533.h>
> =20
> +#define LM3533_DEFAULT_BRIGHTNESS	200

The MFD doesn't care about child specifics.  These needs to go into
the child driver.

>  #define LM3533_BOOST_OVP_MASK		0x06
>  #define LM3533_BOOST_OVP_SHIFT		1
> @@ -588,10 +590,266 @@ static const struct regmap_config regmap_confi=
g =3D {
>  	.precious_reg	=3D lm3533_precious_register,
>  };
> =20
> +static int lm3533_of_parse_enum(struct device_node *node,
> +				const char *propname,
> +				const unsigned *match, size_t num_matches)
> +{
> +	size_t i;
> +	int ret;
> +	u32 val;
> +
> +	ret =3D of_property_read_u32(node, propname, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i =3D 0; i < num_matches; i++) {
> +		if (val =3D=3D match[i])
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int lm3533_of_parse_pwm_zones(struct device_node *node)
> +{
> +	const char *propname =3D "ti,pwm-zones";
> +	u32 zones[5];
> +	int count;
> +	int ret;
> +	int i;
> +
> +	count =3D of_property_count_u32_elems(node, propname);
> +	if (count =3D=3D -EINVAL)
> +		return 0;
> +	if (count <=3D 0)
> +		return count;
> +	if (count >=3D ARRAY_SIZE(zones))
> +		return -EINVAL;
> +
> +	ret =3D of_property_read_u32_array(node, propname, zones, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Enable pwm input, and enable the selected zones */
> +	ret =3D BIT(0);
> +	for (i =3D 0; i < count; i++)
> +		ret |=3D BIT(zones[i] + 1);
> +
> +	return ret;
> +}

Move to PWM driver.

> +static int lm3533_of_parse_als_node(struct device *dev,
> +				    struct device_node *node,
> +				    struct lm3533_platform_data *pdata)
> +{
> +	struct lm3533_als_platform_data *als_pdata;
> +	int ret;
> +	u32 val;
> +
> +	als_pdata =3D devm_kzalloc(dev,
> +				 sizeof(struct lm3533_als_platform_data),
> +				 GFP_KERNEL);
> +	if (!als_pdata)
> +		return -ENOMEM;
> +
> +	als_pdata->pwm_mode =3D of_property_read_bool(node, "ti,pwm-mode");
> +
> +	ret =3D of_property_read_u32(node, "ti,als-resistance-ohm", &val);
> +	if (ret < 0 && ret !=3D -EINVAL) {
> +		dev_err(dev, "unable to read ti,als-resistance-ohm");
> +		return ret;
> +	}
> +
> +	/* Leave at high-Z, if the property was omitted or specified as 0 *=
/
> +	if (!ret && val !=3D 0)
> +		als_pdata->r_select =3D 200000 / val;
> +
> +	pdata->als =3D als_pdata;
> +
> +	return 0;
> +}

Move to wherever the ALS driver is.

> +static int lm3533_of_parse_bl_node(struct device *dev,
> +				   struct device_node *node,
> +				   struct lm3533_platform_data *pdata)
> +{
> +	struct lm3533_bl_platform_data *bl_pdata;
> +	int ret;
> +	u32 reg;
> +	u32 val;
> +
> +	ret =3D of_property_read_u32(node, "reg", &reg);
> +	if (ret < 0 || reg >=3D ARRAY_SIZE(lm3533_bl_devs)) {
> +		dev_err(dev, "invalid reg property\n");
> +		return ret;
> +	}
> +
> +	bl_pdata =3D &pdata->backlights[reg];
> +
> +	/* Increment num_backlights if we're filling a new space */
> +	if (reg + 1 > pdata->num_backlights)
> +		pdata->num_backlights =3D reg + 1;
> +
> +	ret =3D of_property_read_string(node, "label",
> +				      (const char **)&bl_pdata->name);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse label\n");
> +		return ret;
> +	}
> +
> +	ret =3D of_property_read_u32(node, "led-max-microamp", &val);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse led-max-microamp\n");
> +		return ret;
> +	}
> +	bl_pdata->max_current =3D val;
> +
> +	val =3D LM3533_DEFAULT_BRIGHTNESS;
> +	ret =3D of_property_read_u32(node, "default-brightness", &val);
> +	if (ret < 0 && ret !=3D -EINVAL) {
> +		dev_err(dev, "unable to parse default-brightness\n");
> +		return ret;
> +	}
> +	bl_pdata->default_brightness =3D val;
> +
> +	ret =3D lm3533_of_parse_pwm_zones(node);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,pwm-zones\n");
> +		return ret;
> +	}
> +	bl_pdata->pwm =3D ret;
> +
> +	return 0;
> +}

Move to the Backlight driver.

> +static int lm3533_of_parse_led_node(struct device *dev,
> +				    struct device_node *node,
> +				    struct lm3533_platform_data *pdata)
> +{
> +	struct lm3533_led_platform_data *led_pdata;
> +	int ret;
> +	u32 reg;
> +	u32 val;
> +
> +	ret =3D of_property_read_u32(node, "reg", &reg);
> +	if (ret < 0 || reg >=3D ARRAY_SIZE(lm3533_led_devs)) {
> +		dev_err(dev, "invalid reg property\n");
> +		return ret;
> +	}
> +
> +	led_pdata =3D &pdata->leds[reg];
> +
> +	/* Increment num_leds if we're filling a new space */
> +	if (reg + 1 > pdata->num_leds)
> +		pdata->num_leds =3D reg + 1;
> +
> +	ret =3D of_property_read_string(node, "label",
> +				      (const char **)&led_pdata->name);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse label\n");
> +		return ret;
> +	}
> +
> +	ret =3D of_property_read_u32(node, "led-max-microamp", &val);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse led-max-microamp\n");
> +		return ret;
> +	}
> +	led_pdata->max_current =3D val;
> +
> +	ret =3D of_property_read_string(node, "linux,default-trigger",
> +				      &led_pdata->default_trigger);
> +	if (ret < 0 && ret !=3D -EINVAL) {
> +		dev_err(dev, "unable to parse default-trigger\n");
> +		return ret;
> +	}
> +
> +	ret =3D lm3533_of_parse_pwm_zones(node);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,pwm-zones\n");
> +		return ret;
> +	}
> +	led_pdata->pwm =3D ret;
> +
> +	return 0;
> +}

Move to LED driver.

> +static int lm3533_pdata_from_of_node(struct device *dev)
> +{
> +	struct lm3533_platform_data *pdata;
> +	struct device_node *node;
> +	int ret;
> +	const unsigned freqs[] =3D {
> +		[LM3533_BOOST_FREQ_500KHZ] =3D 500000,
> +		[LM3533_BOOST_FREQ_1000KHZ] =3D 1000000,
> +	};
> +	const unsigned ovps[] =3D {
> +		[LM3533_BOOST_OVP_16V] =3D 16000,
> +		[LM3533_BOOST_OVP_24V] =3D 24000,
> +		[LM3533_BOOST_OVP_32V] =3D 32000,
> +		[LM3533_BOOST_OVP_40V] =3D 40000,
> +	};
> +
> +	pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	pdata->backlights =3D devm_kcalloc(dev,
> +					 ARRAY_SIZE(lm3533_bl_devs),
> +					 sizeof(struct lm3533_bl_platform_data),
> +					 GFP_KERNEL);
> +	if (!pdata->backlights)
> +		return -ENOMEM;

These needs to go into the Backlight driver.

> +	pdata->leds =3D devm_kcalloc(dev,
> +				   ARRAY_SIZE(lm3533_led_devs),
> +				   sizeof(struct lm3533_led_platform_data),
> +				   GFP_KERNEL);
> +	if (!pdata->leds)
> +		return -ENOMEM;

This needs to go into the LED driver.

> +	pdata->gpio_hwen =3D of_get_named_gpio(dev->of_node, "hwen-gpios", =
0);
> +	if (pdata->gpio_hwen < 0)
> +		return pdata->gpio_hwen;
> +
> +	ret =3D lm3533_of_parse_enum(dev->of_node, "ti,boost-freq-hz", freq=
s, 2);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,boost-freq-hz\n");
> +		return ret;
> +	}

I'm not a big fan of this abstraction method, but at the very least
you should place the error message into the function.

> +	pdata->boost_freq =3D ret;
> +
> +	ret =3D lm3533_of_parse_enum(dev->of_node, "ti,boost-ovp-mv", ovps,=
 4);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,boost-ovp-mv\n");
> +		return ret;
> +	}
> +	pdata->boost_ovp =3D ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {

The MFD driver shouldn't have to care what child nodes are present.
Just regiser them as devices in their own right via mfd_add_devices()
or of_platform_populate.

> +		if (!strcmp(node->name, "als"))
> +			ret =3D lm3533_of_parse_als_node(dev, node, pdata);
> +		else if (!strcmp(node->name, "backlight"))
> +			ret =3D lm3533_of_parse_bl_node(dev, node, pdata);
> +		else if (!strcmp(node->name, "led"))
> +			ret =3D lm3533_of_parse_led_node(dev, node, pdata);
> +
> +		if (ret < 0) {
> +			of_node_put(node);
> +			return ret;
> +		}
> +	}
> +
> +	dev->platform_data =3D pdata;
> +
> +	return 0;
> +}
> +
>  static int lm3533_i2c_probe(struct i2c_client *i2c,
>  					const struct i2c_device_id *id)
>  {
>  	struct lm3533 *lm3533;
> +	int ret;
> =20
>  	dev_dbg(&i2c->dev, "%s\n", __func__);
> =20
> @@ -608,6 +866,12 @@ static int lm3533_i2c_probe(struct i2c_client *i=
2c,
>  	lm3533->dev =3D &i2c->dev;
>  	lm3533->irq =3D i2c->irq;
> =20
> +	if (i2c->dev.of_node) {
> +		ret =3D lm3533_pdata_from_of_node(lm3533->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	return lm3533_device_init(lm3533);
>  }
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
