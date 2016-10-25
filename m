From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: leds-pca963x: workaround group blink scaling issue
Date: Tue, 25 Oct 2016 09:15:42 +0200
Message-ID: <381331a9-29f8-f2de-2e07-d0c30a31ae06@samsung.com>
References: <CGME20161013131722eucas1p10501fce7ca4fa256fce58c5411d2a097@eucas1p1.samsung.com>
 <1476364572-26849-1-git-send-email-matt@ranostay.consulting>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1476364572-26849-1-git-send-email-matt@ranostay.consulting>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Ranostay <mranostay@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Matt Ranostay <matt@ranostay.consulting>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Matt,

Patch applied.

Thanks,
Jacek Anaszewski

On 10/13/2016 03:16 PM, Matt Ranostay wrote:
> PCA9632TK part seems to incorrectly blink at ~1.3x of the programmed
> rate. This patchset add a nxp,period-scale devicetree property to
> adjust for this misconfiguration.
>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Matt Ranostay <matt@ranostay.consulting>
> ---
>  Documentation/devicetree/bindings/leds/pca963x.txt |  3 +++
>  drivers/leds/leds-pca963x.c                        | 18 +++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
> index dafbe9931c2b..dfbdb123a9bf 100644
> --- a/Documentation/devicetree/bindings/leds/pca963x.txt
> +++ b/Documentation/devicetree/bindings/leds/pca963x.txt
> @@ -7,6 +7,9 @@ Optional properties:
>  - nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
>    to open-drain, newer chips to totem pole)
>  - nxp,hw-blink : use hardware blinking instead of software blinking
> +- nxp,period-scale : In some configurations, the chip blinks faster than expected.
> +		     This parameter provides a scaling ratio (fixed point, decimal divided
> +		     by 1000) to compensate, e.g. 1300=1.3x and 750=0.75x.
>
>  Each led is represented as a sub-node of the nxp,pca963x device.
>
> diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
> index 407eba11e187..b6ce1f2ec33e 100644
> --- a/drivers/leds/leds-pca963x.c
> +++ b/drivers/leds/leds-pca963x.c
> @@ -59,6 +59,7 @@ struct pca963x_chipdef {
>  	u8			grpfreq;
>  	u8			ledout_base;
>  	int			n_leds;
> +	unsigned int		scaling;
>  };
>
>  static struct pca963x_chipdef pca963x_chipdefs[] = {
> @@ -189,6 +190,14 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
>  	return pca963x_brightness(pca963x, value);
>  }
>
> +static unsigned int pca963x_period_scale(struct pca963x_led *pca963x,
> +	unsigned int val)
> +{
> +	unsigned int scaling = pca963x->chip->chipdef->scaling;
> +
> +	return scaling ? DIV_ROUND_CLOSEST(val * scaling, 1000) : val;
> +}
> +
>  static int pca963x_blink_set(struct led_classdev *led_cdev,
>  		unsigned long *delay_on, unsigned long *delay_off)
>  {
> @@ -207,14 +216,14 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
>  		time_off = 500;
>  	}
>
> -	period = time_on + time_off;
> +	period = pca963x_period_scale(pca963x, time_on + time_off);
>
>  	/* If period not supported by hardware, default to someting sane. */
>  	if ((period < PCA963X_BLINK_PERIOD_MIN) ||
>  	    (period > PCA963X_BLINK_PERIOD_MAX)) {
>  		time_on = 500;
>  		time_off = 500;
> -		period = time_on + time_off;
> +		period = pca963x_period_scale(pca963x, 1000);
>  	}
>
>  	/*
> @@ -222,7 +231,7 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
>  	 *	(time_on / period) = (GDC / 256) ->
>  	 *		GDC = ((time_on * 256) / period)
>  	 */
> -	gdc = (time_on * 256) / period;
> +	gdc = (pca963x_period_scale(pca963x, time_on) * 256) / period;
>
>  	/*
>  	 * From manual: period = ((GFRQ + 1) / 24) in seconds.
> @@ -294,6 +303,9 @@ pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
>  	else
>  		pdata->blink_type = PCA963X_SW_BLINK;
>
> +	if (of_property_read_u32(np, "nxp,period-scale", &chip->scaling))
> +		chip->scaling = 1000;
> +
>  	return pdata;
>  }
>
>


-- 
Best regards,
Jacek Anaszewski
