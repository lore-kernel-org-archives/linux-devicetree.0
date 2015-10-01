From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: mediatek: add smp bringup code
Date: Thu, 1 Oct 2015 21:45:49 +0800
Message-ID: <1443707149.22188.1.camel@mtksdaap41>
References: <1443109140-5406-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1443109140-5406-4-git-send-email-yingjoe.chen@mediatek.com>
	 <20150926093835.GA20255@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150926093835.GA20255-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2015-09-26 at 10:38 +0100, Russell King - ARM Linux wrote:
> On Thu, Sep 24, 2015 at 11:38:58PM +0800, Yingjoe Chen wrote:
> > +struct mtk_smp_boot_info {
> > +	unsigned long smp_base;
> ...
> > +static const struct mtk_smp_boot_info mtk_mt8135_tz_boot = {
> > +	0x80002000, 0x3fc,
> ...
> > +static const struct mtk_smp_boot_info mtk_mt6589_boot = {
> > +	0x10002000, 0x34,
> ...
> > +	if (trustzone) {
> > +		/* smp_base(trustzone-bootinfo) is reserved by device tree */
> > +		mtk_smp_base = phys_to_virt(mtk_smp_info->smp_base);
> 
> I can't say whether this is correct or not, as we've got rid of most of
> the information that would allow me to make that decision.
> 
> The address passed to phys_to_virt() _must_ be one which is mapped by
> the kernel as lowmem.  I've no idea if the above would fall into that
> category though.
> 

Currently only mt8127/mt8135 trustzone firmware use this reserve
location. The reserved memory is before kernel code, so it will
definitely in lowmem.

Joe.C


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
