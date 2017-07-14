From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 14 Jul 2017 23:06:08 +0800
Message-ID: <1500044768.16278.37.camel@mtkswgap22>
References: <cover.1496425268.git.sean.wang@mediatek.com>
         <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
         <20170606182224.sifkfod7hehadjvm@sirena.org.uk>
         <1498233365.20651.25.camel@mtkswgap22>
         <20170623161420.tbhn6sjuz7jjhaiu@sirena.org.uk>
         <1498236198.20651.32.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1498236198.20651.32.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2017-06-24 at 00:43 +0800, Sean Wang wrote:
> On Fri, 2017-06-23 at 17:14 +0100, Mark Brown wrote:
> > On Fri, Jun 23, 2017 at 11:56:05PM +0800, Sean Wang wrote:
> > > On Tue, 2017-06-06 at 19:22 +0100, Mark Brown wrote:
> > 
> > > > > +	return (regval & info->desc.enable_mask) ?
> > > > > +		REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> > 
> > > > This isn't really a get_status() operation - it's just showing the
> > > > status of the enable we set.  The get_status() operation is for hardware
> > > > that has a mechanism for reading back the current physical status of the
> > > > regulator, usually including things like if it's in regulation or not.
> > 
> > > > Also please write normal conditional statements, it helps people read
> > > > the code.
> > 
> > > for the hardware, the way for reflect the current physical physical 
> > > has to depend on the bit reading as the bit we enable. It indeed tends
> > > to confuse other users and developers, we maybe can add some comments
> > > for this to avoid.
> > 
> > It's OK to just not have a get_status() operation - a lot of regulators
> > just can't do this and that's fine, the subsystem will cope.
> > 
> 
> understood. it seems to be better with subsystem coping. we'll remove
> get_status callback.
> 

Hi, Mark

We usually want to use /sys/class/regulator/regulator.*/status to get
actual status from hardware, but if we remove the get_status(), the
status entry under sysfs would be gone. So could I keep the get_status
callback in this driver ?

	Sean

> > > > > +static const struct of_device_id mt6380_of_match[] = {
> > > > > +	{ .compatible = "mediatek,mt6380-regulator", },
> > > > > +	{ /* sentinel */ },
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, mt6380_of_match);
> > 
> > > > Given that this driver is entirely specific to the parent PMIC there
> > > > should be no need for a separate compatible string, it's redundant.
> > 
> > > the parent of pmic is MediaTek pwrap which is possibly being used with
> > > various pmics such as MT6323, MT6797, MT6380 and so on. So extra
> > > matching we thought is required to identify which pmic is actually being
> > > connected. 
> > 
> > > For those opinions, maybe we didn't get your exact point. If something
> > > is wrong, please kindly guide us to the right place.
> > 
> > It sounds like pwrap should be a bus rather than using a platform device
> > here?  But I guess that's how things are for now so OK.
> 
> yes, it is a bus , a proprietary bus,  which is something like
> encapsulation of spi and there's some protocol running on this 
> between master/slave.
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
