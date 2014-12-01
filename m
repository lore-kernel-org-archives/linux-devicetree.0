From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] irqchip: gic: Allow interrupt level to be set for PPIs.
Date: Mon, 1 Dec 2014 11:44:32 +0000
Message-ID: <20141201114432.GP828@e106497-lin.cambridge.arm.com>
References: <1417197340-27298-1-git-send-email-Liviu.Dudau@arm.com>
 <20141201104145.GY3836@n2100.arm.linux.org.uk>
 <20141201104612.GM828@e106497-lin.cambridge.arm.com>
 <20141201110358.GA3836@n2100.arm.linux.org.uk>
 <547C4ECD.20802@arm.com>
 <20141201112302.GC3836@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141201112302.GC3836-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 01, 2014 at 11:23:02AM +0000, Russell King - ARM Linux wrot=
e:
> On Mon, Dec 01, 2014 at 11:19:41AM +0000, Marc Zyngier wrote:
> > Hi Russell,
> >=20
> > On 01/12/14 11:03, Russell King - ARM Linux wrote:
> > > If all you want to do is to bypass the following check, what's wr=
ong
> > > with actually doing that:
> > >=20
> > > -	if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_EDGE_RI=
SING)
> > > +	if (gicirq >=3D 32 && type !=3D IRQ_TYPE_LEVEL_HIGH &&
> > > +	    type !=3D IRQ_TYPE_EDGE_RISING)
> > > 		return -EINVAL;
> > >=20
> >=20
> > I think that will require some additional changes to gic_configure_=
irq
> > (in irq-gic-common.c).
>=20
> I don't think so - gic_configure_irq() will treat it as a no-op as fa=
r
> as trying to configure the IRQ settings.

Doesn't that assume then that reset value is correct for the type that
we are trying to program the PPIs?

This is all very academic, as I don't have any real example of a GIC do=
ing
this, but ...

 - if the PPI is set at reset value to be level triggered
 - and we want to set PPIx to be level LOW triggered

with your proposed patch the change will not happen, right?

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
