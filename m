From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v5] powerpc/rcpm: add RCPM driver
Date: Mon, 3 Aug 2015 15:23:43 -0500
Message-ID: <1438633423.2097.33.camel@freescale.com>
References: <1435304656-34505-1-git-send-email-Yuantian.Tang@freescale.com>
	 <1438389906.19345.101.camel@freescale.com>
	 <1438600486.7515.1@remotesmtp.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438600486.7515.1-2YSKY4EJvOYVsECt/c03T2VHu4YV8NEM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-08-03 at 19:14 +0800, Chenhui Zhao wrote:
> On Sat, Aug 1, 2015 at 8:45 AM, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> 
> wrote:
> > On Fri, 2015-06-26 at 15:44 +0800,  Yuantian.Tang-KZfg59tc24xbyU9ht3tbJc3S4LfKanw8@public.gmane.org:
> > >  +static void rcpm_v1_set_ip_power(bool enable, u32 *mask)
> > >  +{
> > >  +     if (enable)
> > >  +             setbits32(&rcpm_v1_regs->ippdexpcr, *mask);
> > >  +     else
> > >  +             clrbits32(&rcpm_v1_regs->ippdexpcr, *mask);
> > >  +}
> > >  +
> > >  +static void rcpm_v2_set_ip_power(bool enable, u32 *mask)
> > >  +{
> > >  +     if (enable)
> > >  +             setbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
> > >  +     else
> > >  +             clrbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
> > >  +}
> > 
> > Why do these take "u32 *mask" instead of "u32 mask"?
> > 
> > -Scott
> 
> I think it can be used in the case where there are several mask values.

When would that be?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
