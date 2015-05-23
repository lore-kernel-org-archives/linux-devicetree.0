From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] iio: light: Updated Vishay Capella cm32181 ambient
 light sensor driver.
Date: Sat, 23 May 2015 12:15:42 +0100
Message-ID: <5560615E.3000403@kernel.org>
References: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com> <1432268380-7302-5-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432268380-7302-5-git-send-email-ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/05/15 05:19, Kevin Tsai wrote:
> - Added Device Tree support.
> 
> Signed-off-by: Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/light/cm32181.txt      | 33 +++++++++++
>  MAINTAINERS                                        | 12 ++--
>  drivers/iio/light/cm32181.c                        | 66 ++++++++++------------
>  3 files changed, 70 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/cm32181.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/cm32181.txt b/Documentation/devicetree/bindings/iio/light/cm32181.txt
> new file mode 100644
> index 0000000..b81a3e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/cm32181.txt
> @@ -0,0 +1,33 @@
> +* Vishay Capella CM32181 Ambient Light sensor
> +
> +Required properties:
> +- compatible: must be "capella,cm32181"
> +- reg: the I2C address of the device
> +
> +Optional properties:
> +- capella,hw_id: hardware device id.
Why? Also listing it just the once would be good :)
I'd actively discourage this. If a new part using a different hw_id
turns up then the compatible string should distinguish it and the driver
be ammended to support it.

> +- capella,reg_cmd: command register initialization.
If you want to actually do this then you need to drop the magic numbers
and explicitly support everything these registers support.
> +- capella,reg_als_wh: high threshold register initialization.
> +- capella,reg_als_wl: low threshold register initialization.
> +- capella,calibscale: calibrated factor with 10^-5 notation.
This one is fair enough though impresively random unit.
Documentation here should indicate that this is dependent on device
packaging (and what else?)
> +- capella,hw_id: hardware device id.
> +- capella,mlux_per_bit: millilux per bit under the default IT.
Should be handled by the calibscale value above I think...

> +- capella,thd_percent: threshold percentage change to trigger.
Not a hardware dependent element to my mind. Should not really
be in the device tree...
> +
> +Example:
> +
> +cm32181@10 {
> +	compatible = "capella,cm32181";
> +	reg = <0x10>;
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <17 0>;
> +
> +	capella,hw_id = <0x81>;
> +	capella,reg_cmd = <0x04>;
> +	capella,reg_als_wh = <0xFFFF>;
> +	capella,reg_als_wl = <0x0000>;
> +	capella,calibscale = <10000>;
> +	capella,mlux_per_bit = <5>;
> +	capella,thd_percent = <5>;
> +};
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f8e0afb..ee6a8f6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2431,12 +2431,6 @@ F:	security/capability.c
>  F:	security/commoncap.c
>  F:	kernel/capability.c
>  
> -CAPELLA MICROSYSTEMS LIGHT SENSOR DRIVER
> -M:	Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> -S:	Maintained
> -F:	drivers/iio/light/cm*
> -F:	Documentation/devicetree/bindings/i2c/trivial-devices.txt
> -
>  CC2520 IEEE-802.15.4 RADIO DRIVER
>  M:	Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  L:	linux-wpan-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> @@ -10610,6 +10604,12 @@ L:	netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  S:	Maintained
>  F:	drivers/net/ethernet/via/via-velocity.*
>  
> +VISHAY CAPELLA LIGHT SENSOR DRIVER
> +M:	Kevin Tsai <ktsai-GubuWUlQtMwciDkP5Hr2oA@public.gmane.org>
> +S:	Maintained
> +F:	drivers/iio/light/cm*
> +F:	Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +
>  VIVID VIRTUAL VIDEO DRIVER
>  M:	Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
>  L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
> index 54bf0cb..b7abd46 100644
> --- a/drivers/iio/light/cm32181.c
> +++ b/drivers/iio/light/cm32181.c
> @@ -51,6 +51,7 @@
>  #define CM32181_HW_ID			0x81
>  #define CM32181_MLUX_PER_BIT		5	/* ALS_SM=01 IT=800ms */
>  #define CM32181_MLUX_PER_BIT_BASE_IT	800000	/* Based on IT=800ms */
> +#define CM32181_THD_PERCENT		5	/* 0 for polling mode */
>  #define	CM32181_CALIBSCALE_DEFAULT	1000
>  #define CM32181_CALIBSCALE_RESOLUTION	1000
>  #define CM32181_MLUX_PER_LUX		1000
> @@ -80,6 +81,7 @@ struct cm32181_als_info {
>  	int calibscale;
>  	int mlux_per_bit;
>  	int mlux_per_bit_base_it;
> +	int thd_percent;
>  };
>  
>  static struct cm32181_als_info cm32181_als_info_default = {
> @@ -90,6 +92,7 @@ static struct cm32181_als_info cm32181_als_info_default = {
>  	.calibscale = CM32181_CALIBSCALE_DEFAULT,
>  	.mlux_per_bit = CM32181_MLUX_PER_BIT,
>  	.mlux_per_bit_base_it = CM32181_MLUX_PER_BIT_BASE_IT,
> +	.thd_percent = CM32181_THD_PERCENT,
>  };
>  
>  struct cm32181_chip {
> @@ -99,6 +102,30 @@ struct cm32181_chip {
>  	u16 conf_regs[CM32181_CONF_REG_NUM];
>  };
>  
> +#ifdef CONFIG_OF
> +void cm32181_parse_dt(struct cm32181_chip *chip)
> +{
> +	struct device_node *dn = chip->client->dev.of_node;
> +	struct cm32181_als_info *als_info = chip->als_info;
> +	u32 temp_val;
> +
> +	if (!of_property_read_u32(dn, "capella,hw_id", &temp_val))
> +		als_info->hw_id = (uint8_t)temp_val;
> +	if (!of_property_read_u32(dn, "capella,reg_cmd", &temp_val))
> +		als_info->reg_cmd = (uint16_t)temp_val;
> +	if (!of_property_read_u32(dn, "capella,reg_als_wh", &temp_val))
> +		als_info->reg_als_wh = (uint16_t)temp_val;
> +	if (!of_property_read_u32(dn, "capella,reg_als_wl", &temp_val))
> +		als_info->reg_als_wl = (uint16_t)temp_val;
> +	if (!of_property_read_u32(dn, "capella,calibscale", &temp_val))
> +		als_info->calibscale = (int)temp_val;
> +	if (!of_property_read_u32(dn, "capella,mlux_per_bit", &temp_val))
> +		als_info->mlux_per_bit = (int)temp_val;
> +	if (!of_property_read_u32(dn, "capella,thd_percent", &temp_val))
> +		als_info->thd_percent = (int)temp_val;
> +}
> +#endif
> +
>  /**
>   * cm32181_reg_init() - Initialize CM32181 registers
>   * @chip:	pointer of struct cm32181_chip
> @@ -116,6 +143,10 @@ static int cm32181_reg_init(struct cm32181_chip *chip)
>  
>  	chip->als_info = &cm32181_als_info_default;
>  	als_info = chip->als_info;
> +#ifdef CONFIG_OF
> +	if (client->dev.of_node)
> +		cm32181_parse_dt(chip);
> +#endif
>  
>  	ret = i2c_smbus_read_word_data(client, CM32181_REG_ADDR_ID);
>  	if (ret < 0)
> @@ -208,33 +239,6 @@ static int cm32181_write_als_it(struct cm32181_chip *chip, int val, int val2)
>  		}
>  	}
>  	return -EINVAL;
Ah, here's where the dead code from the previous patch gets cleaned up.
Sort this out please.
> -
> -/*
> -	struct i2c_client *client = chip->client;
> -	u16 als_it;
> -	int ret, i, n;
> -
> -	n = ARRAY_SIZE(als_it_value);
> -	for (i = 0; i < n; i++)
> -		if (val <= als_it_value[i])
> -			break;
> -	if (i >= n)
> -		i = n - 1;
> -
> -	als_it = als_it_bits[i];
> -	als_it <<= CM32181_CMD_ALS_IT_SHIFT;
> -
> -	mutex_lock(&chip->lock);
> -	chip->conf_regs[CM32181_REG_ADDR_CMD] &=
> -		~CM32181_CMD_ALS_IT_MASK;
> -	chip->conf_regs[CM32181_REG_ADDR_CMD] |=
> -		als_it;
> -	ret = i2c_smbus_write_word_data(client, CM32181_REG_ADDR_CMD,
> -			chip->conf_regs[CM32181_REG_ADDR_CMD]);
> -	mutex_unlock(&chip->lock);
> -
> -	return ret;
> -*/
>  }
>  
>  /**
> @@ -344,14 +348,6 @@ static ssize_t cm32181_get_it_available(struct device *dev,
>  			cm32181_als_it_scales[i].val,
>  			cm32181_als_it_scales[i].val2);
>  	return len + scnprintf(buf + len, PAGE_SIZE - len, "\n");
Hmm. I missed this one.  Clean up whereever it came from.
> -/*
> -	int i, n, len;
> -
> -	n = ARRAY_SIZE(als_it_value);
> -	for (i = 0, len = 0; i < n; i++)
> -		len += sprintf(buf + len, "0.%06u ", als_it_value[i]);
> -	return len + sprintf(buf + len, "\n");
> -*/
>  }
>  
>  static const struct iio_chan_spec cm32181_channels[] = {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
