From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/3] lm90: initialize parameters from devicetree
Date: Fri, 22 Jan 2016 06:53:44 -0800
Message-ID: <56A24278.8050909@roeck-us.net>
References: <1453404877-17897-1-git-send-email-stephan@kochen.nl>
 <1453404877-17897-3-git-send-email-stephan@kochen.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453404877-17897-3-git-send-email-stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=c3=a9phan_Kochen?= <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/21/2016 11:34 AM, St=C3=A9phan Kochen wrote:
> Allow a device tree to set initial temperature sensor parameters.
>
> Userspace can still override actual values through sysfs.
>
> Signed-off-by: St=C3=A9phan Kochen <stephan-j6uo2F6POYhmR6Xm/wNWPw@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/hwmon/lm90.txt | 40 +++++++++++++=
++++
>   drivers/hwmon/lm90.c                             | 55 +++++++++++++=
+++++++++--
>   2 files changed, 92 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/lm90.txt b/Docum=
entation/devicetree/bindings/hwmon/lm90.txt
> index e863248..045e94b 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm90.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm90.txt
> @@ -33,6 +33,38 @@ Optional properties:
>                 LM90 "-ALERT" pin output.
>                 See interrupt-controller/interrupts.txt for the forma=
t.
>
> +- update-interval: Interval at which temperatures are sampled,
> +  Type: unsigned   in milliseconds.
> +  Size: one cell
> +
> +- local-low:      Valid temperature range for the chip internal sens=
or,
> +  local-high:     outside which the alert will be set. Values are in
> +  local-critical: millicelcius.
> +  Type: signed
> +  Size: one cell
> +
> +- remote-low:      Valid temperature range for the external sensor,
> +  remote-high:     outside which the alert will be set. Values are i=
n
> +  remote-critical: millicelciius.
> +  Type: signed
> +  Size: one cell
> +
> +- remote-offset:   Where available, an external sensor temperature o=
ffset.
> +  Type: signed
> +  Size: one cell
> +
> +- local-emergency:  On max6659, max6695 and max6696, a configurable
> +  remote-emergency: 3rd upper bound on temperature.
> +  Type: signed
> +  Size: one cell
> +
> +- remote2-low:      On max6695 and max6696, a second external sensor=
=2E
> +  remote2-high:
> +  remote2-critical:
> +  remote2-emergency:
> +  Type: signed
> +  Size: one cell
> +

This very much smells like configuration, not hardware description.

Having said that, the thermal subsystem does something similar. This ra=
ises even more
questions, though. Since patch 3 of the series introduces registration =
with the thermal
subsystem, it seems to me that the thermal subsystem should provide any=
 limits used
to program the chips, and that there should be a mechanism for the ther=
mal subsystem
to interact with the driver to both set the limits and to be informed i=
f a limit
is exceeded.

Also, _if_ such a set of properties is introduced and accepted by the d=
evicetree
reviewers, it should probably be a set of properties which applies to _=
all_ hardware
monitoring drivers, not just to one. Even if support is not implemented=
 immediately
in the hwmon core, the properties should be usable in a generic way, an=
d not
reflect sysfs attribute names used by the hwmon subsystem.

Thanks,
Guenter

>   Example LM90 node:
>
>   temp-sensor {
> @@ -41,4 +73,12 @@ temp-sensor {
>   	vcc-supply =3D <&palmas_ldo6_reg>;
>   	interrupt-parent =3D <&gpio>;
>   	interrupts =3D <TEGRA_GPIO(O, 4) IRQ_TYPE_LEVEL_LOW>;
> +	update-interval =3D <500>;
> +	local-low =3D <5000>;
> +	local-high =3D <80000>;
> +	local-critical =3D <90000>;
> +	remote-low =3D <5000>;
> +	remote-high =3D <80000>;
> +	remote-critical =3D <90000>;
> +	remote-offset =3D <(-62125)>;
>   }
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 88daf72..8ae8791 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -93,6 +93,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/err.h>
>   #include <linux/mutex.h>
> +#include <linux/of.h>
>   #include <linux/sysfs.h>
>   #include <linux/interrupt.h>
>   #include <linux/regulator/consumer.h>
> @@ -1504,8 +1505,16 @@ static void lm90_restore_conf(struct i2c_clien=
t *client, struct lm90_data *data)
>   static void lm90_init_client(struct lm90_data *data)
>   {
>   	struct i2c_client *client =3D data->client;
> +	struct device *dev =3D &client->dev;
>   	u8 config, convrate;
> +	u32 ms;
> +#ifdef CONFIG_OF
> +	s32 temp;
> +#endif
>
> +	/*
> +	 * Save old conversion rate.
> +	 */
>   	if (lm90_read_reg(client, LM90_REG_R_CONVRATE, &convrate) < 0) {
>   		dev_warn(&client->dev, "Failed to read convrate register!\n");
>   		convrate =3D LM90_DEF_CONVRATE_RVAL;
> @@ -1515,14 +1524,24 @@ static void lm90_init_client(struct lm90_data=
 *data)
>   	/*
>   	 * Start the conversions.
>   	 */
> -	lm90_set_convrate_locked(data, 500);  /* 500ms / 2Hz  */
> +#ifdef CONFIG_OF
> +	if (of_property_read_u32(dev->of_node, "update-interval", &ms) < 0)
> +#endif
> +		ms =3D 500;  /* default rate: 2Hz */
> +	lm90_set_convrate_locked(data, ms);
> +
> +	/*
> +	 * Save old config
> +	 */
>   	if (lm90_read_reg(client, LM90_REG_R_CONFIG1, &config) < 0) {
> -		dev_warn(&client->dev, "Initialization failed!\n");
> +		dev_warn(dev, "Initialization failed!\n");
>   		return;
>   	}
>   	data->config_orig =3D config;
>
> -	/* Check Temperature Range Select */
> +	/*
> +	 * Check Temperature Range Select
> +	 */
>   	if (data->kind =3D=3D adt7461 || data->kind =3D=3D tmp451) {
>   		if (config & 0x04)
>   			data->flags |=3D LM90_FLAG_ADT7461_EXT;
> @@ -1545,6 +1564,36 @@ static void lm90_init_client(struct lm90_data =
*data)
>   	config &=3D 0xBF;	/* run */
>   	if (config !=3D data->config_orig) /* Only write if changed */
>   		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
> +
> +#ifdef CONFIG_OF
> +	/*
> +	 * Set initial values from devicetree
> +	 */
> +#define INIT_REG(_property, _index, _bits) { \
> +	if (of_property_read_s32(dev->of_node, _property, &temp) =3D=3D 0) =
\
> +		lm90_set_temp##_bits##_locked(data, _index, temp); \
> +}
> +	INIT_REG("local-low", LOCAL_LOW, 8);
> +	INIT_REG("local-high", LOCAL_HIGH, 8);
> +	INIT_REG("local-critical", LOCAL_CRIT, 8);
> +	INIT_REG("remote-low", REMOTE_LOW, 11);
> +	INIT_REG("remote-high", REMOTE_HIGH, 11);
> +	INIT_REG("remote-critical", REMOTE_CRIT, 8);
> +	if (data->flags & LM90_HAVE_OFFSET) {
> +		INIT_REG("remote-offset", REMOTE_OFFSET, 11);
> +	}
> +	if (data->flags & LM90_HAVE_EMERGENCY) {
> +		INIT_REG("local-emergency", LOCAL_EMERG, 8);
> +		INIT_REG("remote-emergency", REMOTE_EMERG, 8);
> +	}
> +	if (data->flags & LM90_HAVE_TEMP3) {
> +		INIT_REG("remote2-low", REMOTE2_LOW, 11);
> +		INIT_REG("remote2-high", REMOTE2_HIGH, 11);
> +		INIT_REG("remote2-critical", REMOTE2_CRIT, 8);
> +		INIT_REG("remote2-emergency", REMOTE2_EMERG, 8);
> +	}
> +#undef INIT_REG
> +#endif
>   }
>
>   static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
