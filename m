From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] irqchip: gic: Allow interrupt level to be set for
 PPIs.
Date: Mon, 12 Jan 2015 11:15:09 +0000
Message-ID: <20150112111509.GC823@e106497-lin.cambridge.arm.com>
References: <1417437909-20923-1-git-send-email-Liviu.Dudau@arm.com>
 <54AA53C2.9040903@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AA53C2.9040903-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 05, 2015 at 09:05:06AM +0000, Marc Zyngier wrote:
> Hi Liviu,

Hi Marc,

>=20
> On 01/12/14 12:45, Liviu Dudau wrote:
> > During a recent cleanup of the arm64 DTs it has become clear that
> > the handling of PPIs in xxxx_set_type() is incorrect. The ARM TRMs
> > for GICv2 and later allow for "implementation defined" support for
> > setting the edge or level type of the PPI interrupts and don't rest=
rict
> > the activation level of the signal. Current ARM implementations
> > do restrict the PPI level type to IRQ_TYPE_LEVEL_LOW, but licensees
> > of the IP can decide to shoot themselves in the foot at any time.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > ---
> >=20
> > Made a stupid mistake in v2 and got my bit test confused with logic=
al test.
> >=20
> >  Documentation/devicetree/bindings/arm/gic.txt |  8 ++++++--
> >  drivers/irqchip/irq-gic-common.c              | 21 +++++++++++++--=
------
> >  drivers/irqchip/irq-gic-common.h              |  2 +-
> >  drivers/irqchip/irq-gic-v3.c                  |  8 ++++----
> >  drivers/irqchip/irq-gic.c                     |  9 ++++++---
> >  drivers/irqchip/irq-hip04.c                   |  9 ++++++---
> >  6 files changed, 36 insertions(+), 21 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/gic.txt b/Docume=
ntation/devicetree/bindings/arm/gic.txt
> > index 8112d0c..c97484b 100644
> > --- a/Documentation/devicetree/bindings/arm/gic.txt
> > +++ b/Documentation/devicetree/bindings/arm/gic.txt
> > @@ -32,12 +32,16 @@ Main node required properties:
> >    The 3rd cell is the flags, encoded as follows:
> >  	bits[3:0] trigger type and level flags.
> >  		1 =3D low-to-high edge triggered
> > -		2 =3D high-to-low edge triggered
> > +		2 =3D high-to-low edge triggered (invalid for SPIs)
> >  		4 =3D active high level-sensitive
> > -		8 =3D active low level-sensitive
> > +		8 =3D active low level-sensitive (invalid for SPIs).
> >  	bits[15:8] PPI interrupt cpu mask.  Each bit corresponds to each =
of
> >  	the 8 possible cpus attached to the GIC.  A bit set to '1' indica=
ted
> >  	the interrupt is wired to that CPU.  Only valid for PPI interrupt=
s.
> > +	Also note that the configurability of PPI interrupts is IMPLEMENT=
ATION
> > +	DEFINED and as such not guaranteed to be present (most SoC availa=
ble
> > +	in 2014 seem to ignore the setting of this flag and use the hardw=
are
> > +	default value).
> > =20
> >  - reg : Specifies base physical address(s) and size of the GIC reg=
isters. The
> >    first region is the GIC distributor register base and size. The =
2nd region is
> > diff --git a/drivers/irqchip/irq-gic-common.c b/drivers/irqchip/irq=
-gic-common.c
> > index 61541ff..ffee521 100644
> > --- a/drivers/irqchip/irq-gic-common.c
> > +++ b/drivers/irqchip/irq-gic-common.c
> > @@ -21,7 +21,7 @@
> > =20
> >  #include "irq-gic-common.h"
> > =20
> > -void gic_configure_irq(unsigned int irq, unsigned int type,
> > +int gic_configure_irq(unsigned int irq, unsigned int type,
> >  		       void __iomem *base, void (*sync_access)(void))
> >  {
> >  	u32 enablemask =3D 1 << (irq % 32);
> > @@ -29,16 +29,17 @@ void gic_configure_irq(unsigned int irq, unsign=
ed int type,
> >  	u32 confmask =3D 0x2 << ((irq % 16) * 2);
> >  	u32 confoff =3D (irq / 16) * 4;
> >  	bool enabled =3D false;
> > -	u32 val;
> > +	u32 val, oldval;
> > +	int ret =3D 0;
> > =20
> >  	/*
> >  	 * Read current configuration register, and insert the config
> >  	 * for "irq", depending on "type".
> >  	 */
> > -	val =3D readl_relaxed(base + GIC_DIST_CONFIG + confoff);
> > -	if (type =3D=3D IRQ_TYPE_LEVEL_HIGH)
> > +	val =3D oldval =3D readl_relaxed(base + GIC_DIST_CONFIG + confoff=
);
> > +	if (type & IRQ_TYPE_LEVEL_MASK)
> >  		val &=3D ~confmask;
> > -	else if (type =3D=3D IRQ_TYPE_EDGE_RISING)
> > +	else if (type & IRQ_TYPE_EDGE_BOTH)
> >  		val |=3D confmask;
> > =20
> >  	/*
> > @@ -54,15 +55,19 @@ void gic_configure_irq(unsigned int irq, unsign=
ed int type,
> > =20
> >  	/*
> >  	 * Write back the new configuration, and possibly re-enable
> > -	 * the interrupt.
> > +	 * the interrupt. If we tried to write a new configuration and fa=
iled,
> > +	 * return an error.
> >  	 */
> >  	writel_relaxed(val, base + GIC_DIST_CONFIG + confoff);
> > -
> > -	if (enabled)
> > +	if (readl_relaxed(base + GIC_DIST_CONFIG + confoff) !=3D val && v=
al !=3D oldval)
> > +		ret =3D -EINVAL;
> > +	else if (enabled)
> >  		writel_relaxed(enablemask, base + GIC_DIST_ENABLE_SET + enableof=
f);
>=20
> So if you change the configuration of an enabled interrupt and fail t=
o
> do so, you end-up with the interrupt disabled. This is a change in
> behaviour, and is likely to introduce regressions.

Is it? Beforehand we were silently ignoring the fact that the new value=
s haven't been
set, now we return an error. Should we continue to ignore the fact that=
 there is now
a difference between what the kernel believes the setup is and what the=
 hardware is
configured to do?

(Sorry for delay in responding, just returned from my extended holiday.=
)

Best regards,
Liviu

>=20
> > =20
> >  	if (sync_access)
> >  		sync_access();
> > +
> > +	return ret;
> >  }
> > =20
> >  void __init gic_dist_config(void __iomem *base, int gic_irqs,
> > diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq=
-gic-common.h
> > index b41f024..35a9884 100644
> > --- a/drivers/irqchip/irq-gic-common.h
> > +++ b/drivers/irqchip/irq-gic-common.h
> > @@ -20,7 +20,7 @@
> >  #include <linux/of.h>
> >  #include <linux/irqdomain.h>
> > =20
> > -void gic_configure_irq(unsigned int irq, unsigned int type,
> > +int gic_configure_irq(unsigned int irq, unsigned int type,
> >                         void __iomem *base, void (*sync_access)(voi=
d));
> >  void gic_dist_config(void __iomem *base, int gic_irqs,
> >  		     void (*sync_access)(void));
> > diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic=
-v3.c
> > index 1a146cc..6e50803 100644
> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -238,7 +238,9 @@ static int gic_set_type(struct irq_data *d, uns=
igned int type)
> >  	if (irq < 16)
> >  		return -EINVAL;
> > =20
> > -	if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_EDGE_RISI=
NG)
> > +	/* SPIs have restrictions on the supported types */
> > +	if (irq >=3D 32 && type !=3D IRQ_TYPE_LEVEL_HIGH &&
> > +			 type !=3D IRQ_TYPE_EDGE_RISING)
> >  		return -EINVAL;
> > =20
> >  	if (gic_irq_in_rdist(d)) {
> > @@ -249,9 +251,7 @@ static int gic_set_type(struct irq_data *d, uns=
igned int type)
> >  		rwp_wait =3D gic_dist_wait_for_rwp;
> >  	}
> > =20
> > -	gic_configure_irq(irq, type, base, rwp_wait);
> > -
> > -	return 0;
> > +	return gic_configure_irq(irq, type, base, rwp_wait);
> >  }
> > =20
> >  static u64 gic_mpidr_to_affinity(u64 mpidr)
> > diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> > index d617ee5..4634cf7 100644
> > --- a/drivers/irqchip/irq-gic.c
> > +++ b/drivers/irqchip/irq-gic.c
> > @@ -188,12 +188,15 @@ static int gic_set_type(struct irq_data *d, u=
nsigned int type)
> >  {
> >  	void __iomem *base =3D gic_dist_base(d);
> >  	unsigned int gicirq =3D gic_irq(d);
> > +	int ret;
> > =20
> >  	/* Interrupt configuration for SGIs can't be changed */
> >  	if (gicirq < 16)
> >  		return -EINVAL;
> > =20
> > -	if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_EDGE_RISI=
NG)
> > +	/* SPIs have restrictions on the supported types */
> > +	if (gicirq >=3D 32 && type !=3D IRQ_TYPE_LEVEL_HIGH &&
> > +			    type !=3D IRQ_TYPE_EDGE_RISING)
> >  		return -EINVAL;
> > =20
> >  	raw_spin_lock(&irq_controller_lock);
> > @@ -201,11 +204,11 @@ static int gic_set_type(struct irq_data *d, u=
nsigned int type)
> >  	if (gic_arch_extn.irq_set_type)
> >  		gic_arch_extn.irq_set_type(d, type);
> > =20
> > -	gic_configure_irq(gicirq, type, base, NULL);
> > +	ret =3D gic_configure_irq(gicirq, type, base, NULL);
> > =20
> >  	raw_spin_unlock(&irq_controller_lock);
> > =20
> > -	return 0;
> > +	return ret;
> >  }
> > =20
> >  static int gic_retrigger(struct irq_data *d)
> > diff --git a/drivers/irqchip/irq-hip04.c b/drivers/irqchip/irq-hip0=
4.c
> > index 29b8f21..d059e66 100644
> > --- a/drivers/irqchip/irq-hip04.c
> > +++ b/drivers/irqchip/irq-hip04.c
> > @@ -120,21 +120,24 @@ static int hip04_irq_set_type(struct irq_data=
 *d, unsigned int type)
> >  {
> >  	void __iomem *base =3D hip04_dist_base(d);
> >  	unsigned int irq =3D hip04_irq(d);
> > +	int ret;
> > =20
> >  	/* Interrupt configuration for SGIs can't be changed */
> >  	if (irq < 16)
> >  		return -EINVAL;
> > =20
> > -	if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_EDGE_RISI=
NG)
> > +	/* SPIs have restrictions on the supported types */
> > +	if (irq >=3D 32 && type !=3D IRQ_TYPE_LEVEL_HIGH &&
> > +			 type !=3D IRQ_TYPE_EDGE_RISING)
> >  		return -EINVAL;
> > =20
> >  	raw_spin_lock(&irq_controller_lock);
> > =20
> > -	gic_configure_irq(irq, type, base, NULL);
> > +	ret =3D gic_configure_irq(irq, type, base, NULL);
> > =20
> >  	raw_spin_unlock(&irq_controller_lock);
> > =20
> > -	return 0;
> > +	return ret;
> >  }
> > =20
> >  #ifdef CONFIG_SMP
> >=20
>=20
> I have exactly zero knowledge about the hip04 controller, and despite=
 it
> looking like a GIC, it is quite different from the real thing. I'd li=
ke
> to see confirmation from the HiSilicon guys that this is the right th=
ing
> to do, and possibly this to be moved to a separate patch if that
> requires extra changes.
>=20
> Thanks,
>=20
> 	M.
> --=20
> Jazz is not dead. It just smells funny...
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
