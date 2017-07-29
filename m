From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] mfd: ds1374: Add Dallas/Maxim DS1374 Multi Function
 Device
Date: Sat, 29 Jul 2017 13:07:37 +0200
Message-ID: <20170729110737.dl2nly5xvurmb7eo@piout.net>
References: <1499975665-14581-1-git-send-email-mdf@kernel.org>
 <1499975665-14581-2-git-send-email-mdf@kernel.org>
 <20170717075117.btnhbmgpofwn7zdk@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170717075117.btnhbmgpofwn7zdk@dell>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17/07/2017 at 08:51:17 +0100, Lee Jones wrote:
> > +static int ds1374_probe(struct i2c_client *client,
> > +			const struct i2c_device_id *id)
> > +{
> > +	struct ds1374 *ds1374;
> > +	u32 mode;
> > +	int err;
> > +
> > +	ds1374 = devm_kzalloc(&client->dev, sizeof(struct ds1374), GFP_KERNEL);
> > +	if (!ds1374)
> > +		return -ENOMEM;
> > +
> > +	ds1374->regmap = devm_regmap_init_i2c(client, &ds1374_regmap_config);
> > +	if (IS_ERR(ds1374->regmap))
> > +		return PTR_ERR(ds1374->regmap);
> > +
> > +	if (IS_ENABLED(CONFIG_OF) && client->dev.of_node) {
> > +		err = of_property_read_u32(client->dev.of_node,
> > +					   "dallas,mode", &mode);
> > +		if (err < 0) {
> > +			dev_err(&client->dev, "missing dallas,mode property\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		ds1374->remapped_reset
> > +			= of_property_read_bool(client->dev.of_node,
> > +						"dallas,remap-reset");
> > +
> > +		ds1374->mode = (enum ds1374_mode)mode;
> > +	} else if (IS_ENABLED(CONFIG_RTC_DRV_DS1374_WDT)) {
> > +		ds1374->mode = DS1374_MODE_RTC_WDT;
> > +	} else {
> > +		ds1374->mode = DS1374_MODE_RTC_ALM;
> > +	}
> 
> This is non-standard.  So if OF is enabled, you're taking the 'mode'
> from platform data (DT) and if it's not, you're relying on Kconfig.
> May I suggest that you pick platform data OR Kconfig, but not mix the
> two.
> 

I've explicitly asked for that. CONFIG_RTC_DRV_DS1374_WDT has been in
the kernel since 2014. Requiring the use of dallas,mode now would break
the functionality for people not updating their DT.

However, my suggestion was that if OF is enabled and dallas,mode is not
present, then rely on CONFIG_RTC_DRV_DS1374_WDT to set the mode.

I personally don't care too much about breaking the DT ABI but this one
can be a bit tricky to discover and I still think it can be avoided.
At least, we should silently ignore CONFIG_RTC_DRV_DS1374_WDT.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
