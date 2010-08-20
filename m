From: "Lorenzo Pieralisi" <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: RE: [RFC PATCH 11/14] ARM: PMU: add device tree probing
Date: Fri, 20 Aug 2010 11:56:32 +0100
Message-ID: <7735.97662705487$1282301819@news.gmane.org>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<AANLkTinz2CWrzPk3BtM6tWxu1udeAS1LFzjACB9spq-y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTinz2CWrzPk3BtM6tWxu1udeAS1LFzjACB9spq-y-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-gb
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: 'Grant Likely' <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe Robin <Philippe.Robin-5wv7dgnIgG8@public.gmane.org>, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gra=
nt
> Likely
> Sent: 18 August 2010 22:37
> To: Lorenzo Pieralisi
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; Philippe Robin; nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org;
> linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; Catalin Marinas; jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
> Subject: Re: [RFC PATCH 11/14] ARM: PMU: add device tree probing
> =

> On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
> <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> > When OF is enabled, platform drivers are required to define a
> > match table in order to allow the kernel to find drivers suitable
> > for a given device. The device tree allows to retrieve resources
> > from device tree nodes dynamically.
> >
> > This patch adds device tree support to the ARM PMU driver. This
> > includes a match table and code to initialize the driver id from
> > the respective device tree node compatible property.
> >
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > ---
> > =A0arch/arm/include/asm/pmu.h | =A0 =A06 ++++++
> > =A0arch/arm/kernel/Makefile =A0 | =A0 =A03 ++-
> > =A0arch/arm/kernel/pmu-of.c =A0 | =A0 30 ++++++++++++++++++++++++++++++
> > =A0arch/arm/kernel/pmu.c =A0 =A0 =A0| =A0 18 ++++++++++++------
> > =A04 files changed, 50 insertions(+), 7 deletions(-)
> > =A0create mode 100644 arch/arm/kernel/pmu-of.c
> >
> > diff --git a/arch/arm/include/asm/pmu.h b/arch/arm/include/asm/pmu.h
> > index 8ccea01..d317b64 100644
> > --- a/arch/arm/include/asm/pmu.h
> > +++ b/arch/arm/include/asm/pmu.h
> > @@ -17,6 +17,12 @@ enum arm_pmu_type {
> > =A0 =A0 =A0 =A0ARM_NUM_PMU_DEVICES,
> > =A0};
> >
> > +#ifndef CONFIG_OF
> > +static inline int pmu_probe_dt(struct platform_device *pdev) { return -
> ENODEV; }
> > +#else
> > +extern int __devinit pmu_probe_dt(struct platform_device *pdev);
> > +#endif
> > +
> > =A0#ifdef CONFIG_CPU_HAS_PMU
> >
> > =A0/**
> > diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> > index 0ace897..b7d846f 100644
> > --- a/arch/arm/kernel/Makefile
> > +++ b/arch/arm/kernel/Makefile
> > @@ -48,7 +48,8 @@ obj-$(CONFIG_CPU_XSCALE) =A0 =A0 =A0+=3D xscale-cp0.o
> > =A0obj-$(CONFIG_CPU_XSC3) =A0 =A0 =A0 =A0 +=3D xscale-cp0.o
> > =A0obj-$(CONFIG_CPU_MOHAWK) =A0 =A0 =A0 +=3D xscale-cp0.o
> > =A0obj-$(CONFIG_IWMMXT) =A0 =A0 =A0 =A0 =A0 +=3D iwmmxt.o
> > -obj-$(CONFIG_CPU_HAS_PMU) =A0 =A0 =A0+=3D pmu.o
> > +pmu_of-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0:=3D pmu-of.o
> > +obj-$(CONFIG_CPU_HAS_PMU) =A0 =A0 =A0+=3D pmu.o $(pmu_of-y)
> > =A0obj-$(CONFIG_HW_PERF_EVENTS) =A0 +=3D perf_event.o
> > =A0AFLAGS_iwmmxt.o =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D =
-Wa,-mcpu=3Diwmmxt
> >
> > diff --git a/arch/arm/kernel/pmu-of.c b/arch/arm/kernel/pmu-of.c
> > new file mode 100644
> > index 0000000..5c5ee94
> > --- /dev/null
> > +++ b/arch/arm/kernel/pmu-of.c
> > @@ -0,0 +1,30 @@
> > +/*
> > + * =A0linux/arch/arm/kernel/pmu-of.c -- =A0PMU DT probe function
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <asm/pmu.h>
> > +
> > +int __devinit pmu_probe_dt(struct platform_device *pdev)
> > +{
> > + =A0 =A0 =A0 int ret =3D -ENODEV;
> > + =A0 =A0 =A0 struct device_node *node =3D pdev->dev.of_node;
> > +
> > + =A0 =A0 =A0 if (of_device_is_compatible(node, "arm,arm-pmu")) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->id =3D ARM_PMU_DEVICE_CPU;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;
> > + =A0 =A0 =A0 } else {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("Probing device not recognized=
 "
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "device %=
s\n", node->full_name);
> =

> Do you really want the warning on an OF-enabled kernel when booting on
> an non-OF board?
>

Good point. I would answer no. Valid in other contexts as well.
I will take that into account.
 =

> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 return ret;
> > +}
> =

> How about:
> {
>         if (!of_match_node(arm_pmu_matches, node))
>                 return -ENODEV;
> =

>         pdev->id =3D ARM_PMU_DEVICE_CPU;
>         return 0;
> }
> =

> Clearer and more concise, no?
> =


Definitely.

> Also, (as you've brought up before) the pdev->id issue needs to be
> solved.  I don't believe it is allowed to change the id field after
> the platform_device is registered.  I'd rather see the id dynamically
> assigned, which generally works in the OF use-case because
> interconnections between devices are described in the tree and
> specific ids aren't really needed.  However, it could be that the best
> thing to do is retrieve the system-wide unique id from the aliases
> node.
> =

> ... and ditto on my comment that this will be simpler if it lives
> directly in pmu.c.  :-)

When you say "retrieve the system-wide id from the aliases node" you mean
at platform_device register time  in the OF layer (ie of_device_register), =

right ? =


> =

> > diff --git a/arch/arm/kernel/pmu.c b/arch/arm/kernel/pmu.c
> > index b8af96e..f070b3d 100644
> > --- a/arch/arm/kernel/pmu.c
> > +++ b/arch/arm/kernel/pmu.c
> > @@ -27,12 +27,12 @@ static struct platform_device
> *pmu_devices[ARM_NUM_PMU_DEVICES];
> >
> > =A0static int __devinit pmu_device_probe(struct platform_device *pdev)
> > =A0{
> > -
> > - =A0 =A0 =A0 if (pdev->id < 0 || pdev->id >=3D ARM_NUM_PMU_DEVICES) {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("received registration request=
 for unknown "
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "device %=
d\n", pdev->id);
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> > - =A0 =A0 =A0 }
> > + =A0 =A0 =A0 if (pmu_probe_dt(pdev) =3D=3D -ENODEV)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pdev->id < 0 || pdev->id >=3D ARM_NUM=
_PMU_DEVICES) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("received regi=
stration request for
> unknown "
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 "device %d\n", pdev->id);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> >
> > =A0 =A0 =A0 =A0if (pmu_devices[pdev->id])
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("registering new PMU device t=
ype %d overwrites
> "
> > @@ -45,6 +45,11 @@ static int __devinit pmu_device_probe(struct
> platform_device *pdev)
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> >
> > +static struct of_device_id arm_pmu_matches[] =3D {
> > + =A0 =A0 =A0 { .compatible =3D "arm,arm-pmu"},
> > + =A0 =A0 =A0 {},
> > +};
> > +
> > =A0static struct platform_driver pmu_driver =3D {
> > =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "arm-pmu",
> > @@ -54,6 +59,7 @@ static struct platform_driver pmu_driver =3D {
> >
> > =A0static int __init register_pmu_driver(void)
> > =A0{
> > + =A0 =A0 =A0 platform_init_match(&pmu_driver, arm_pmu_matches);
> > =A0 =A0 =A0 =A0return platform_driver_register(&pmu_driver);
> > =A0}
> > =A0device_initcall(register_pmu_driver);
> > --
> > 1.6.3.3
> >
> >
> =

> =

> =

> --
> Grant Likely, B.Sc., P.Eng.
> Secret Lab Technologies Ltd.
