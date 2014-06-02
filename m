From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Mon, 2 Jun 2014 11:35:03 +0200
Message-ID: <20140602093503.GA24919@kwain>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
 <20140602092913.GA933@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140602092913.GA933-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 10:29:13AM +0100, Russell King - ARM Linux wrot=
e:
> On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=E9nart wrote:
> > diff --git a/arch/arm/mach-berlin/Kconfig b/arch/arm/mach-berlin/Kc=
onfig
> > index d3c5f14dc142..e3733692f67a 100644
> > --- a/arch/arm/mach-berlin/Kconfig
> > +++ b/arch/arm/mach-berlin/Kconfig
> > @@ -4,6 +4,7 @@ config ARCH_BERLIN
> >  	select GENERIC_IRQ_CHIP
> >  	select DW_APB_ICTL
> >  	select DW_APB_TIMER_OF
> > +	select SMP
>=20
> Please don't add selects of symbols which aren't absolutely necessary=
=2E
>=20
> Since this has been merged without SMP support and presumably works w=
ithout
> SMP support, it would appear that SMP support is not mandatory for th=
e
> platform to work.

It can work without SMP, I'll remove this.

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
