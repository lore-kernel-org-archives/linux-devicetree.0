From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] clocksource: Add renesas-ostm timer driver
Date: Wed, 25 Jan 2017 10:56:03 +0100
Message-ID: <20170125095603.GE2021@mai>
References: <20170123135423.28780-1-chris.brandt@renesas.com>
 <20170123135423.28780-3-chris.brandt@renesas.com>
 <20170123175210.GH2166@mai>
 <SG2PR06MB11657AE9653A4B66B1EA02718A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170124143222.GA2021@mai>
 <SG2PR06MB1165F79A1675FAC9ABEF12998A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165F79A1675FAC9ABEF12998A750-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 08:19:50PM +0000, Chris Brandt wrote:
> Hi Daniel,
> 
> On Tuesday, January 24, 2017, Daniel Lezcano wrote:
> > > > > +early_platform_init("earlytimer", &ostm_timer);
> > > > > +subsys_initcall(ostm_init); module_exit(ostm_exit);
> > > > > +
> > > > > +MODULE_AUTHOR("Chris Brandt");
> > > > > +MODULE_DESCRIPTION("Renesas OSTM Timer Driver");
> > > > > +MODULE_LICENSE("GPL v2");
> > > >
> > > > Maybe you can try with builtin_platform ?
> > >
> > > Good idea. But, now I get a "Section mismatch" during link time so
> > > I'll have to figure out why that is.
> > 
> > Mmh, I think it would be more consistent to convert this to:
> > 
> > CLOCKSOURCE_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > 
> > The only problem is to get the struct device associated to the of_node
> > passed as parameter to ostm_init in order to use the devm_* API.
> > 
> > I think of_find_device_by_node should return the platform_device, then
> > pdev->dev. If that works the other drivers will benefit from that to
> > pdev->remove all
> > the rollback code everywhere.
> 
> 
> It was a good idea....but it will not work.
> 
> While CLOCKSOURCE_OF_DECLARE is good at putting the driver at the
> front of the line for loading, it's too early in boot to detect
> a platform_device.
> 
> of_find_device_by_node calls bus_find_device. But the first thing that
> bus_find_device does is:
> 
> 	if (!bus || !bus->p)
> 		return NULL;
> 
> But bus->p=0 so it returns immediately.
> 
> 
> Of course changing the code over to:
>         devm_kzalloc -> devm_kzalloc
> devm_ioremap_nocache -> of_io_request_and_map
>     platform_get_irq -> irq_of_parse_and_map
>              dev_err -> pr_err
> 
> 
> Then things work, but I'm back to managing the rollback code manually.
> 
> 
> Any other ideas on how to get the corresponding platform_device for
> a DT node?

No :/

So up to you.
	- CLOCKSOURCE_OF_DECLARE consistent but need rollback
	or
	- platform_device but with another timer available at early time

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
