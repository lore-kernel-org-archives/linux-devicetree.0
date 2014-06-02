From: Antoine =?iso-8859-1?Q?T=E9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Mon, 2 Jun 2014 12:27:50 +0200
Message-ID: <20140602102750.GB13681@kwain>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
 <20140602094715.GG28090@lunn.ch>
 <20140602100048.GA12162@kwain>
 <20140602100332.GH28090@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140602100332.GH28090-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 12:03:32PM +0200, Andrew Lunn wrote:
> On Mon, Jun 02, 2014 at 12:00:48PM +0200, Antoine T=E9nart wrote:
> > Hi Andrew,
> >=20
> > On Mon, Jun 02, 2014 at 11:47:15AM +0200, Andrew Lunn wrote:
> > > On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=E9nart wrote:
> > > > +
> > > > +static inline void berlin_reset_cpu(unsigned int cpu)
> > > > +{
> > > > +	u32 val;
> > > > +
> > > > +	val =3D readl(cpu_ctrl + CPU_RESET);
> > > > +	val |=3D BIT(cpu_logical_map(cpu));
> > > > +	writel(val, cpu_ctrl + CPU_RESET);
> > > > +}
> > >=20
> > > Is this performing a reset on the CPU, or is it taking it out of =
reset?
> > >=20
> > > If you are going to implement CPU hotplug at some point, you are =
going
> > > to want to be able to put the CPU into reset, i.e. power it off, =
and
> > > take it out of reset, i.e. power it on and getting it running. So=
 it
> > > might help if we get these function names clear now.
> >=20
> > It is performing a reset on the CPU. berlin_perform_reset_cpu() the=
n?
>=20
> What happens if the CPU is powered off? Will a reset power it on?  Or
> are you assuming the boot loader has powered it on?

I actually don't have information about this. For now let's assume the
boot loader has powered on the CPUs.

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
