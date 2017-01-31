From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCHv2 04/16] ov7670: add devicetree support
Date: Tue, 31 Jan 2017 08:53:08 +0200
Message-ID: <20170131065308.GP7139@valkosipuli.retiisi.org.uk>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
 <20170130140628.18088-5-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170130140628.18088-5-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <guennadi.liakhovetski-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, Jan 30, 2017 at 03:06:16PM +0100, Hans Verkuil wrote:
> @@ -1549,6 +1551,29 @@ static const struct ov7670_devtype ov7670_devdata[] = {
>  	},
>  };
>  
> +static int ov7670_init_gpio(struct i2c_client *client, struct ov7670_info *info)
> +{
> +	/* Request the power down GPIO asserted */

You're setting both GPIOs to low state. How about just removing the
comments? I think they're just confusing.

> +	info->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "pwdn",
> +			GPIOD_OUT_LOW);
> +	if (IS_ERR(info->pwdn_gpio)) {
> +		dev_info(&client->dev, "can't get %s GPIO\n", "pwdn");
> +		return PTR_ERR(info->pwdn_gpio);
> +	}
> +
> +	/* Request the reset GPIO deasserted */
> +	info->resetb_gpio = devm_gpiod_get_optional(&client->dev, "resetb",
> +			GPIOD_OUT_LOW);
> +	if (IS_ERR(info->resetb_gpio)) {
> +		dev_info(&client->dev, "can't get %s GPIO\n", "resetb");
> +		return PTR_ERR(info->resetb_gpio);
> +	}
> +
> +	usleep_range(3000, 5000);
> +
> +	return 0;
> +}
> +
>  static int ov7670_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
