From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 5/8] ARM: mediatek: add smp bringup code for MT6580
Date: Fri, 7 Aug 2015 09:59:45 +0800
Message-ID: <1438912785.1900.33.camel@mtkswgap22>
References: <1438696464-59858-1-git-send-email-scott.shu@mediatek.com>
	 <1438696464-59858-6-git-send-email-scott.shu@mediatek.com>
	 <1801910.hz53dYUgta@ubix> <20150806061918.GK18700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150806061918.GK18700-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-08-06 at 08:19 +0200, Sascha Hauer wrote:
> On Wed, Aug 05, 2015 at 06:47:03PM +0200, Matthias Brugger wrote:
> > On Tuesday, August 04, 2015 09:54:21 PM Scott Shu wrote:
> > > Add support for cpu enable-method "mediatek,mt6580-smp" for booting
> > > secondary CPUs on MT6580.
> > > 
> > > Signed-off-by: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  arch/arm/mach-mediatek/platsmp.c |  137
> > > ++++++++++++++++++++++++++++++++++++++ 1 file changed, 137 insertions(+)
> > > +
> > > +static void __init mt6580_smp_prepare_cpus(unsigned int max_cpus)
> > > +{
> > > +	static void __iomem *infracfg_ao_base;
> > > +
> > > +	infracfg_ao_base = ioremap(MT6580_INFRACFG_AO, 0x1000);
> > > +	if (!infracfg_ao_base) {
> > > +		pr_err("%s: Unable to map I/O memory\n", __func__);
> > > +		return;
> > > +	}
> > > +
> > > +	/* Enable bootrom power down mode */
> > > +	writel_relaxed(readl(infracfg_ao_base + 0x804) | SW_ROM_PD,
> > > +		       infracfg_ao_base + 0x804);
> > 
> > Please use a define for the offset.
> > I prefer to not cascade reads and writes but to use a temporary variable. But 
> > if this is fine with the kernel coding style (I doubt, but I'm not sure) then 
> > this is fine.
> 
> For what it's worth I also prefer
> 
> 	val = readl(infracfg_ao_base + 0x804);
> 	val |= SW_ROM_PD:
> 	writel_relaxed(val, infracfg_ao_base + 0x804);
> 
> I find this better readable. I don't think though that there's common
> agreement that this style is better.
> 
> Sascha
> 
Fixed in next version. Thanks.

Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
