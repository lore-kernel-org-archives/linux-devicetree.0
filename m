From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2 v2] irqchip: mmp: add dt support for wakeup
Date: Fri, 15 Nov 2013 12:50:04 +0000
Message-ID: <20131115125004.GI1709@e106331-lin.cambridge.arm.com>
References: <1381479838-7794-1-git-send-email-zhangwm@marvell.com>
 <1381479838-7794-3-git-send-email-zhangwm@marvell.com>
 <CAN1soZwPVCNO5V33mP4yn-n=fye2LX-3XCYYG+Z1zw0Q6VVm4g@mail.gmail.com>
 <20131114122733.GJ16396@e106331-lin.cambridge.arm.com>
 <175CCF5F49938B4D99B2E3EF7F558EBE49FD2839AB@SC-VEXCH4.marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <175CCF5F49938B4D99B2E3EF7F558EBE49FD2839AB-r8ILAu4/owuq90oVIqnETxL4W9x8LtSr@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 11:49:20AM +0000, Neil Zhang wrote:
>=20
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland-5wv7dgnIgG8@public.gmane.org]
> > Sent: 2013=E5=B9=B411=E6=9C=8814=E6=97=A5 20:28
> > To: Haojian Zhuang
> > Cc: Neil Zhang; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TZNg+MwTxZMZA@public.gmane.org=
l.org;
> > Thomas Gleixner
> > Subject: Re: [PATCH 2/2 v2] irqchip: mmp: add dt support for wakeup
> >=20
> > On Thu, Nov 14, 2013 at 10:28:53AM +0000, Haojian Zhuang wrote:
> > > On Fri, Oct 11, 2013 at 4:23 PM, Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>=
 wrote:
> > > > Some of the Marvell SoCs use GIC as its interrupt controller,an=
d ICU
> > > > only used as wakeup logic. When AP subsystem is powered off, GI=
C
> > > > will lose its context, the PMU will need ICU to wakeup the AP s=
ubsystem.
> > > > So add wakeup entry for such kind of usage.
> > > >
> > > > Signed-off-by: Neil Zhang <zhangwm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> > > > ---
> > > >  .../devicetree/bindings/arm/mrvl/intc.txt          |   14 ++-
> > > >  drivers/irqchip/irq-mmp.c                          |  124
> > ++++++++++++++++++++
> > > >  include/linux/irqchip/mmp.h                        |   13 ++
> > > >  3 files changed, 150 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/mrvl/intc.tx=
t
> > > > b/Documentation/devicetree/bindings/arm/mrvl/intc.txt
> > > > index 8b53273..4180928 100644
> > > > --- a/Documentation/devicetree/bindings/arm/mrvl/intc.txt
> > > > +++ b/Documentation/devicetree/bindings/arm/mrvl/intc.txt
> > > > @@ -2,7 +2,7 @@
> > > >
> > > >  Required properties:
> > > >  - compatible : Should be "mrvl,mmp-intc", "mrvl,mmp2-intc" or
> > > > -  "mrvl,mmp2-mux-intc"
> > > > +  "mrvl,mmp2-mux-intc", "mrvl,mmp-intc-wakeupgen"
> >=20
> > Why do we need a new compatible string?
>=20
> As the patch comments said, we don't use the ICU as an interrupt cont=
roller in some Marvell Socs,
> Just use them to wakeup CPU when GIC is powered off.

Hmm. Is it possible to use the ICU as an interrupt controller in those
SoCs?

>=20
> >=20
> > > >  - reg : Address and length of the register set of the interrup=
t controller.
> > > >    If the interrupt controller is intc, address and length mean=
s the range
> > > >    of the whold interrupt controller. If the interrupt controll=
er is
> > > > mux-intc, @@ -15,6 +15,9 @@ Required properties:
> > > >  - interrupt-controller : Identifies the node as an interrupt c=
ontroller.
> > > >  - #interrupt-cells : Specifies the number of cells needed to e=
ncode an
> > > >    interrupt source.
> > > > +- mrvl,intc-gbl-mask : Specifies the address and value for glo=
bal
> > > > +mask in the
> > > > +  interrupt controller.
> > >
> > > As my understanding, we should avoid to write register settings i=
n DTS file.
> >=20
> > In general, yes. We should describe the hardware and let Linux choo=
se how to
> > configure it as far as possible.
> >=20
> > What is this global mask? What is it used for? Why do there seem to=
 be multiple
> > global masks (judging by the example)?
> >=20
>=20
> Global mask will prevent distributing interrupt from ICU to GIC.
> Since we will use GIC as the interrupt controller, so we need to mask=
 the ICU global mask.
> ICU has connection to every core in the system, so we need to mask al=
l global mask registers for each core.

Why can the driver not figure out these masks for itself?

>=20
> > >
> > > Loop devicetree guys.
> > >
> > > > +- mrvl,intc-for-cp : Specifies the irqs that will be routed to=
 cp
> >=20
> > cp?
> >=20
> > _why_ do we need this, and what exactly does routing the irqs to th=
e cp imply?
>=20
> Communication processor.
> Kernel should avoid to handle the irq lines that has been routed to c=
ommunication processor.

Ok. Does this just tell the kernel the set of IRQs to ignore, or does
this imply that the kernel must configure something in the hardware
based on this? If so, what specifically?

>=20
> >=20
> > > >  - mrvl,intc-nr-irqs : Specifies the number of interrupts in th=
e interrupt
> > > >    controller.
> > > >  - mrvl,clr-mfp-irq : Specifies the interrupt that needs to cle=
ar
> > > > MFP edge @@ -39,6 +42,15 @@ Example:
> > > >                 mrvl,intc-nr-irqs =3D <2>;
> > > >         };
> > > >
> > > > +     intc: wakeupgen@d4282000 {
> > > > +               compatible =3D "mrvl,mmp-intc-wakeupgen";
> > > > +               reg =3D <0xd4282000 0x1000>;
> > > > +               mrvl,intc-nr-irqs =3D <64>;
> > > > +               mrvl,intc-gbl-mask =3D <0x114 0x3
> > > > +                                     0x144 0x3>;
> >=20
> > Are these multiple entries? The binding text implied there was only=
 one entry.
> > What is this?
>=20
> This specify the register offset and value to mask for each core.

Why can the driver not have these offsets hard-coded? How variable are
they?

[...]

> > > > +       size /=3D sizeof(*wakeup_reg);
> > > > +       while (i < size) {
> > > > +               unsigned offset, val;
> > > > +
> > > > +               offset =3D be32_to_cpup(wakeup_reg + i++);
> > > > +               val =3D be32_to_cpup(wakeup_reg + i++);
> >=20
> > Use of_property_read_u32_index. You don't need to deal with the raw=
 dtb.
>=20
> It's offset / value pair, it there convenient way to get such kind of=
 key / value pair?
> Thanks.

Unfortunately there's no of_property_read_u32_array_index, but it's
perfectly possible to do something similar to what you have here,
without relying on the raw binary DTB:

for (;;) {
	u32 offset, val;
	if (of_property_read_u32_index(node, PROP_NAME, i++, &offset) !=3D 0)
		break;
	if (of_property_read_u32_index(node, PROP_NAME, i++, &val) !=3D 0)
		break;
=09
	do_something(offset, val);
}

>=20
> >=20
> > > > +               writel_relaxed(val, mmp_icu_base + offset);
> > > > +       }
> > > > +
> > > > +       /* Get the irq lines and ignore irqs */
> > > > +       cp_irq_reg =3D of_get_property(node, "mrvl,intc-for-cp"=
, &size);
> > > > +       if (!cp_irq_reg)
> > > > +               return;
> > > > +
> > > > +       irq_for_cp_nr =3D size / sizeof(*cp_irq_reg);
> > > > +       for (i =3D 0; i < irq_for_cp_nr; i++) {
> > > > +               irq_for_cp[i] =3D be32_to_cpup(cp_irq_reg + i);
> >=20
> > Use of_property_read_u32_index.
>=20
> Yes, it should be OK, thanks very much.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
