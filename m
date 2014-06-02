From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Mon, 2 Jun 2014 12:03:32 +0200
Message-ID: <20140602100332.GH28090@lunn.ch>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
 <1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
 <20140602094715.GG28090@lunn.ch>
 <20140602100048.GA12162@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140602100048.GA12162@kwain>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, sebastian.hesselbarth@gmail.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 12:00:48PM +0200, Antoine T=E9nart wrote:
> Hi Andrew,
>=20
> On Mon, Jun 02, 2014 at 11:47:15AM +0200, Andrew Lunn wrote:
> > On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=E9nart wrote:
> > > +
> > > +static inline void berlin_reset_cpu(unsigned int cpu)
> > > +{
> > > +	u32 val;
> > > +
> > > +	val =3D readl(cpu_ctrl + CPU_RESET);
> > > +	val |=3D BIT(cpu_logical_map(cpu));
> > > +	writel(val, cpu_ctrl + CPU_RESET);
> > > +}
> >=20
> > Is this performing a reset on the CPU, or is it taking it out of re=
set?
> >=20
> > If you are going to implement CPU hotplug at some point, you are go=
ing
> > to want to be able to put the CPU into reset, i.e. power it off, an=
d
> > take it out of reset, i.e. power it on and getting it running. So i=
t
> > might help if we get these function names clear now.
>=20
> It is performing a reset on the CPU. berlin_perform_reset_cpu() then?

Yes, that would be better.

What happens if the CPU is powered off? Will a reset power it on?  Or
are you assuming the boot loader has powered it on?

    Andrew
