From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: memory: da8xx-ddrctl: new driver
Date: Mon, 21 Nov 2016 17:43:54 -0800
Message-ID: <5833A2DA.40701@gmail.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
 <1477925138-23457-2-git-send-email-bgolaszewski@baylibre.com>
 <a309a738-7fa7-3aab-4457-f7d693e6b37f@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a309a738-7fa7-3aab-4457-f7d693e6b37f-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sekhar,

(And adding Sudeep since he becomes involved in this further
down thread and at that point says he will re-work this
proposed work around in a manner that is incorrect in a
manner that is similar to this proposed work around.)

On 11/21/16 08:33, Sekhar Nori wrote:
> On Monday 31 October 2016 08:15 PM, Bartosz Golaszewski wrote:
>> +static int da8xx_ddrctl_probe(struct platform_device *pdev)
>> +{
>> +	const struct da8xx_ddrctl_config_knob *knob;
>> +	const struct da8xx_ddrctl_setting *setting;
>> +	struct device_node *node;
>> +	struct resource *res;
>> +	void __iomem *ddrctl;
>> +	struct device *dev;
>> +	u32 reg;
>> +
>> +	dev = &pdev->dev;
>> +	node = dev->of_node;
>> +
>> +	setting = da8xx_ddrctl_get_board_settings();
>> +	if (!setting) {
>> +		dev_err(dev, "no settings for board '%s'\n",
>> +			of_flat_dt_get_machine_name());
>> +		return -EINVAL;
>> +	}
> 
> This causes a section mismatch because of_flat_dt_get_machine_name() 
> has an __init annotation. I did not notice that before, sorry.
> 
> It can be fixed with a patch like below:
> 
> ---8<---
> diff --git a/drivers/memory/da8xx-ddrctl.c b/drivers/memory/da8xx-ddrctl.c
> index a20e7bbbcbe0..9ca5aab3ac54 100644
> --- a/drivers/memory/da8xx-ddrctl.c
> +++ b/drivers/memory/da8xx-ddrctl.c
> @@ -102,6 +102,18 @@ static const struct da8xx_ddrctl_setting *da8xx_ddrctl_get_board_settings(void)
>  	return NULL;
>  }
>  
> +static const char* da8xx_ddrctl_get_machine_name(void)
> +{
> +	const char *str;
> +	int ret;
> +
> +	ret = of_property_read_string(of_root, "model", &str);
> +	if (ret)
> +		ret = of_property_read_string(of_root, "compatible", &str);
> +
> +	return str;
> +}
> +
>  static int da8xx_ddrctl_probe(struct platform_device *pdev)
>  {
>  	const struct da8xx_ddrctl_config_knob *knob;
> @@ -118,7 +130,7 @@ static int da8xx_ddrctl_probe(struct platform_device *pdev)
>  	setting = da8xx_ddrctl_get_board_settings();
>  	if (!setting) {
>  		dev_err(dev, "no settings for board '%s'\n",
> -			of_flat_dt_get_machine_name());

da8xx_ddrctl_get_board_settings() tries to match based on the "compatible"
property in the root node.  The "model" property in the root node has
nothing to do with the failure to match. So creating and then using
da8xx_ddrctl_get_machine_name() to potentially report model is not useful.

It should be sufficient to simply report that no compatible matched.


> +			da8xx_ddrctl_get_machine_name());
>  		return -EINVAL;
>  	}
> ---8<--- 
> 
> A similar fix is required for the other driver in this series (patch 
> 2/5). I need some advise on whether I should introduce a common 
> function to get the machine name post kernel boot-up (I cannot see an 
> existing one). If yes, any advise on which file it should go into?
> 
> Thanks,
> Sekhar
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
