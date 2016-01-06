From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 09/10] [media] tvp5150: Initialize the chip on probe
Date: Wed, 06 Jan 2016 12:59:50 +0200
Message-ID: <1730920.ntKvfybiDd@avalon>
References: <1451910332-23385-1-git-send-email-javier@osg.samsung.com> <1451910332-23385-10-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451910332-23385-10-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Enrico Butera <ebutera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eduard Gavin <egavinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Javier,

Thankk you for the patch.

On Monday 04 January 2016 09:25:31 Javier Martinez Canillas wrote:
> After power-up, the tvp5150 decoder is in a unknown state until the
> RESETB pin is driven LOW which reset all the registers and restarts
> the chip's internal state machine.
> 
> The init sequence has some timing constraints and the RESETB signal
> can only be used if the PDN (Power-down) pin is first released.
> 
> So, the initialization sequence is as follows:
> 
> 1- PDN (active-low) is driven HIGH so the chip is power-up
> 2- A 20 ms delay is needed before sending a RESETB (active-low) signal.
> 3- The RESETB pulse duration is 500 ns.
> 4- A 200 us delay is needed for the I2C client to be active after reset.
> 
> This patch used as a reference the logic in the IGEPv2 board file from
> the ISEE 2.6.37 vendor tree.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
>  drivers/media/i2c/tvp5150.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index caac96a577f8..fed89a811ab7 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -5,6 +5,7 @@
>   * This code is placed under the terms of the GNU General Public License v2
> */
> 
> +#include <linux/of_gpio.h>

Let's keep the headers sorted alphabetically if you don't mind :-)

>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/videodev2.h>
> @@ -1197,6 +1198,36 @@ static int tvp5150_detect_version(struct tvp5150
> *core) return 0;
>  }
> 
> +static inline int tvp5150_init(struct i2c_client *c)
> +{
> +	struct gpio_desc *pdn_gpio;
> +	struct gpio_desc *reset_gpio;
> +
> +	pdn_gpio = devm_gpiod_get_optional(&c->dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdn_gpio))
> +		return PTR_ERR(pdn_gpio);
> +
> +	if (pdn_gpio) {
> +		gpiod_set_value_cansleep(pdn_gpio, 0);
> +		/* Delay time between power supplies active and reset */
> +		msleep(20);

How about usleep_range() instead ?

> +	}
> +
> +	reset_gpio = devm_gpiod_get_optional(&c->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return PTR_ERR(reset_gpio);
> +
> +	if (reset_gpio) {
> +		/* RESETB pulse duration */
> +		ndelay(500);

Is the timing so sensitive that we need a delay, or could we use 
usleep_range() ?

> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +		/* Delay time between end of reset to I2C active */
> +		usleep_range(200, 250);
> +	}
> +
> +	return 0;
> +}
> +
>  static int tvp5150_probe(struct i2c_client *c,
>  			 const struct i2c_device_id *id)
>  {
> @@ -1209,6 +1240,10 @@ static int tvp5150_probe(struct i2c_client *c,
>  	     I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
>  		return -EIO;
> 
> +	res = tvp5150_init(c);
> +	if (res)
> +		return res;
> +
>  	core = devm_kzalloc(&c->dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
