From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 1/5] ARM: berlin: add SMP support
Date: Tue, 3 Jun 2014 14:19:13 +0800
Message-ID: <20140603141913.710a1f7e@xhacker>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
	<1401700866-24804-2-git-send-email-antoine.tenart@free-electrons.com>
	<20140602094715.GG28090@lunn.ch>
	<20140602100048.GA12162@kwain>
	<20140602100332.GH28090@lunn.ch>
	<20140602102750.GB13681@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140602102750.GB13681@kwain>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, Jimmy Xu <zmxu@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexandre.belloni@free-electrons.com" <alexandre.belloni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew, Antoine,=20

On Mon, 2 Jun 2014 03:27:50 -0700
Antoine T=C3=A9nart <antoine.tenart@free-electrons.com> wrote:

> On Mon, Jun 02, 2014 at 12:03:32PM +0200, Andrew Lunn wrote:
> > On Mon, Jun 02, 2014 at 12:00:48PM +0200, Antoine T=C3=A9nart wrote=
:
> > > Hi Andrew,
> > >=20
> > > On Mon, Jun 02, 2014 at 11:47:15AM +0200, Andrew Lunn wrote:
> > > > On Mon, Jun 02, 2014 at 11:21:02AM +0200, Antoine T=C3=A9nart w=
rote:
> > > > > +
> > > > > +static inline void berlin_reset_cpu(unsigned int cpu)
> > > > > +{
> > > > > +	u32 val;
> > > > > +
> > > > > +	val =3D readl(cpu_ctrl + CPU_RESET);
> > > > > +	val |=3D BIT(cpu_logical_map(cpu));
> > > > > +	writel(val, cpu_ctrl + CPU_RESET);
> > > > > +}
> > > >=20
> > > > Is this performing a reset on the CPU, or is it taking it out o=
f
> > > > reset?
> > > >=20
> > > > If you are going to implement CPU hotplug at some point, you ar=
e going
> > > > to want to be able to put the CPU into reset, i.e. power it off=
, and
> > > > take it out of reset, i.e. power it on and getting it running. =
So it
> > > > might help if we get these function names clear now.
> > >=20
> > > It is performing a reset on the CPU. berlin_perform_reset_cpu() t=
hen?
> >=20
> > What happens if the CPU is powered off? Will a reset power it on?  =
Or
> > are you assuming the boot loader has powered it on?
>=20
> I actually don't have information about this. For now let's assume th=
e
> boot loader has powered on the CPUs.
>=20

We don't support independently power off cpu on BG2 and BG2Q in linux k=
ernel.
So we can assume that bootloader has powered on the CPUs
