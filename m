From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 5/8] ARM: mediatek: add smp bringup code for MT6580
Date: Thu, 6 Aug 2015 08:19:18 +0200
Message-ID: <20150806061918.GK18700@pengutronix.de>
References: <1438696464-59858-1-git-send-email-scott.shu@mediatek.com>
 <1438696464-59858-6-git-send-email-scott.shu@mediatek.com>
 <1801910.hz53dYUgta@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1801910.hz53dYUgta@ubix>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 05, 2015 at 06:47:03PM +0200, Matthias Brugger wrote:
> On Tuesday, August 04, 2015 09:54:21 PM Scott Shu wrote:
> > Add support for cpu enable-method "mediatek,mt6580-smp" for booting
> > secondary CPUs on MT6580.
> > 
> > Signed-off-by: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/mach-mediatek/platsmp.c |  137
> > ++++++++++++++++++++++++++++++++++++++ 1 file changed, 137 insertions(+)
> > +
> > +static void __init mt6580_smp_prepare_cpus(unsigned int max_cpus)
> > +{
> > +	static void __iomem *infracfg_ao_base;
> > +
> > +	infracfg_ao_base = ioremap(MT6580_INFRACFG_AO, 0x1000);
> > +	if (!infracfg_ao_base) {
> > +		pr_err("%s: Unable to map I/O memory\n", __func__);
> > +		return;
> > +	}
> > +
> > +	/* Enable bootrom power down mode */
> > +	writel_relaxed(readl(infracfg_ao_base + 0x804) | SW_ROM_PD,
> > +		       infracfg_ao_base + 0x804);
> 
> Please use a define for the offset.
> I prefer to not cascade reads and writes but to use a temporary variable. But 
> if this is fine with the kernel coding style (I doubt, but I'm not sure) then 
> this is fine.

For what it's worth I also prefer

	val = readl(infracfg_ao_base + 0x804);
	val |= SW_ROM_PD:
	writel_relaxed(val, infracfg_ao_base + 0x804);

I find this better readable. I don't think though that there's common
agreement that this style is better.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
