From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] irqchip: gic: Allow interrupt level to be set for PPIs.
Date: Mon, 1 Dec 2014 12:36:56 +0000
Message-ID: <20141201123656.GQ828@e106497-lin.cambridge.arm.com>
References: <1417197340-27298-1-git-send-email-Liviu.Dudau@arm.com>
 <20141201104145.GY3836@n2100.arm.linux.org.uk>
 <20141201104612.GM828@e106497-lin.cambridge.arm.com>
 <20141201110358.GA3836@n2100.arm.linux.org.uk>
 <547C4ECD.20802@arm.com>
 <20141201112302.GC3836@n2100.arm.linux.org.uk>
 <547C5179.5020505@arm.com>
 <20141201115400.GD3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141201115400.GD3836@n2100.arm.linux.org.uk>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Haojian Zhuang <haojian.zhuang@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 11:54:00AM +0000, Russell King - ARM Linux wrot=
e:
> On Mon, Dec 01, 2014 at 11:31:05AM +0000, Marc Zyngier wrote:
> > On 01/12/14 11:23, Russell King - ARM Linux wrote:
> > > On Mon, Dec 01, 2014 at 11:19:41AM +0000, Marc Zyngier wrote:
> > >> Hi Russell,
> > >>
> > >> On 01/12/14 11:03, Russell King - ARM Linux wrote:
> > >>> If all you want to do is to bypass the following check, what's =
wrong
> > >>> with actually doing that:
> > >>>
> > >>> -	if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_EDGE_=
RISING)
> > >>> +	if (gicirq >=3D 32 && type !=3D IRQ_TYPE_LEVEL_HIGH &&
> > >>> +	    type !=3D IRQ_TYPE_EDGE_RISING)
> > >>> 		return -EINVAL;
> > >>>
> > >>
> > >> I think that will require some additional changes to gic_configu=
re_irq
> > >> (in irq-gic-common.c).
> > >=20
> > > I don't think so - gic_configure_irq() will treat it as a no-op a=
s far
> > > as trying to configure the IRQ settings.
> >=20
> > I agree. But that's following ARM's tradition of making PPIs
> > non-configurable. I seem to remember that there is at least one
> > occurrence of a GIC with configurable PPIs (Qualcomm, IIRC).
> >=20
> > With this use case in mind, Liviu's patch allows an active-low inte=
rrupt
> > to be correctly configured as level, for example.
>=20
> Liviu's patch is nothing more than a hack.  It changes (eg) the activ=
e
> low level to be an active high level with the explicitly stated reaso=
n to
> bypass a test, and then hopes that the remaining functions do the rig=
ht
> thing.

I was trying to make the smallest amount of changes possible. Given tha=
t
ARM's GICs don't distinguish between high/low or raising/falling all I =
wanted
was to get the level vs edge type being sticky.

>=20
> It would be better to explicitly bypass the test, and then explicitly
> handle other cases in gic_configure_irq().
>=20
> It would be even better to make the code reflect reality right the wa=
y
> through.  If PPIs are non-configurable, then we should return -EINVAL=
 if
> trying to set them to a setting which is not supported.  For example,
> pass through all states to gic_configure_irq(), and have gic_configur=
e_irq()
> return whether the state is valid.
>=20
> Then, gic_configure_irq() can read back the register after trying to =
set
> the appropriate value, and see whether it was taken.  If the bits rem=
ain
> unchanged, then it can decide that the requested mode is not supporte=
d,
> and return -EINVAL.
>=20
> In any case, let's not hack the code in the way that Liviu is trying =
to
> do.

OK, I will send a v2 patch, doing the right thing.

Best regards,
Liviu

>=20
> --=20
> FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
> according to speedtest.net.
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
