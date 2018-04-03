Return-Path: <SRS0=PEGO=GY=redhat.com=hdegoede@kernel.org>
Subject: Re: [PATCH v2 2/5] usb: typec: fusb302: remove max_snk_* for sink
 config
References: <1521817127-23061-1-git-send-email-jun.li@nxp.com>
 <1521817127-23061-3-git-send-email-jun.li@nxp.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <66fb9f1a-3331-201d-9ec2-747df3c98926@redhat.com>
Date: Tue, 3 Apr 2018 17:25:43 +0200
MIME-Version: 1.0
In-Reply-To: <1521817127-23061-3-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, heikki.krogerus@linux.intel.com
Cc: linux@roeck-us.net, rmfrfs@gmail.com, yueyao.zhu@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi,

On 23-03-18 15:58, Li Jun wrote:
> Since max_snk_* is to be deprecated, so remove max_snk_* by adding a
> variable PDO for sink config.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>   drivers/usb/typec/fusb302/fusb302.c | 51 +++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
> index 7036171..db4d9cd 100644
> --- a/drivers/usb/typec/fusb302/fusb302.c
> +++ b/drivers/usb/typec/fusb302/fusb302.c
> @@ -120,6 +120,7 @@ struct fusb302_chip {
>   	enum typec_cc_polarity cc_polarity;
>   	enum typec_cc_status cc1;
>   	enum typec_cc_status cc2;
> +	u32 snk_pdo[PDO_MAX_OBJECTS];
>   
>   #ifdef CONFIG_DEBUG_FS
>   	struct dentry *dentry;
> @@ -1212,11 +1213,6 @@ static const u32 snk_pdo[] = {
>   static const struct tcpc_config fusb302_tcpc_config = {
>   	.src_pdo = src_pdo,
>   	.nr_src_pdo = ARRAY_SIZE(src_pdo),
> -	.snk_pdo = snk_pdo,
> -	.nr_snk_pdo = ARRAY_SIZE(snk_pdo),
> -	.max_snk_mv = 5000,
> -	.max_snk_ma = 3000,
> -	.max_snk_mw = 15000,
>   	.operating_snk_mw = 2500,
>   	.type = TYPEC_PORT_DRP,
>   	.data = TYPEC_PORT_DRD,
> @@ -1756,6 +1752,38 @@ static int init_gpio(struct fusb302_chip *chip)
>   	return 0;
>   }
>   
> +static int fusb302_composite_snk_pdo_array(struct fusb302_chip *chip)
> +{
> +	struct device *dev = chip->dev;
> +	u32 mv, ma, mw, min_mv;
> +	unsigned int i;
> +
> +	/* Copy the static snk pdo */
> +	for (i = 0; i < ARRAY_SIZE(snk_pdo); i++)
> +		chip->snk_pdo[i] = snk_pdo[i];

The static snk PDO is constant and only contains:
	PDO_FIXED(5000, 400, PDO_FIXED_FLAGS),

So you can just do:

	chip->snk_pdo[0] = PDO_FIXED(5000, 400, PDO_FIXED_FLAGS);

Here.

> +
> +	if (device_property_read_u32(dev, "fcs,max-sink-microvolt", &mv) ||
> +	    device_property_read_u32(dev, "fcs,max-sink-microamp", &ma) ||
> +	    device_property_read_u32(dev, "fcs,max-sink-microwatt", &mw))

You can drop the reading of "fcs,max-sink-microwatt" here, it was only
ever added because the tcpm code used to depend on max_mw being set,
now that that is no longer the case, we don't need it.

So this entire function can be simplified to:

static int fusb302_composite_snk_pdo_array(struct fusb302_chip *chip)
{
	struct device *dev = chip->dev;
	u32 max_uv, max_ua;

	chip->snk_pdo[0] = PDO_FIXED(5000, 400, PDO_FIXED_FLAGS);

	if (device_property_read_u32(dev, "fcs,max-sink-microvolt", &max_uv) ||
	    device_property_read_u32(dev, "fcs,max-sink-microamp", &max_ua))
		return 1;

	chip->snk_pdo[1] = PDO_VAR(5000, max_uv / 1000, max_ua / 1000);
	return 2;
}

> @@ -1784,18 +1812,13 @@ static int fusb302_probe(struct i2c_client *client,
>   	chip->tcpc_dev.config = &chip->tcpc_config;
>   	mutex_init(&chip->lock);
>   
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microvolt", &v))
> -		chip->tcpc_config.max_snk_mv = v / 1000;
> -
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microamp", &v))
> -		chip->tcpc_config.max_snk_ma = v / 1000;
> -
> -	if (!device_property_read_u32(dev, "fcs,max-sink-microwatt", &v))
> -		chip->tcpc_config.max_snk_mw = v / 1000;
> -
>   	if (!device_property_read_u32(dev, "fcs,operating-sink-microwatt", &v))
>   		chip->tcpc_config.operating_snk_mw = v / 1000;
>   
> +	/* Composite sink PDO */
> +	chip->tcpc_config.nr_snk_pdo = fusb302_composite_snk_pdo_array(chip);
> +	chip->tcpc_config.snk_pdo = chip->snk_pdo;
> +
>   	/*
>   	 * Devicetree platforms should get extcon via phandle (not yet
>   	 * supported). On ACPI platforms, we get the name from a device prop.
> 

Regards,

Hans
