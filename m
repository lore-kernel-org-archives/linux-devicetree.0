From: "M.H. Lian" <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2,9/9] irqchip/ls-scfg-msi: add MSI affinity support
Date: Fri, 6 Jan 2017 08:23:51 +0000
Message-ID: <VI1PR04MB1615683AF0EAE68CAB22154DE8630@VI1PR04MB1615.eurprd04.prod.outlook.com>
References: <1483603837-4629-1-git-send-email-Minghuan.Lian@nxp.com>
 <1483603837-4629-9-git-send-email-Minghuan.Lian@nxp.com>
 <7888f3a1-ae4a-f2b6-f41b-fc414f7ca968@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7888f3a1-ae4a-f2b6-f41b-fc414f7ca968-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

Thanks for your review.
Please see my comments inline.

Thanks,
Minghuan

> -----Original Message-----
> From: Marc Zyngier [mailto:marc.zyngier-5wv7dgnIgG8@public.gmane.org]
> Sent: Thursday, January 05, 2017 11:33 PM
> To: M.H. Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Jason Cooper
> <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>; Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>; Mingkai Hu
> <mingkai.hu-3arQi8VN3Tc@public.gmane.org>; Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>; Leo Li
> <leoyang.li-3arQi8VN3Tc@public.gmane.org>; Scott Wood <scott.wood-3arQi8VN3Tc@public.gmane.org>
> Subject: Re: [PATCH v2,9/9] irqchip/ls-scfg-msi: add MSI affinity support
>=20
> On 05/01/17 08:10, Minghuan Lian wrote:
> > For LS1046a and LS1043a v1.1, the MSI controller has 4 MSIRs and 4
> > CPUs. A GIC SPI interrupt of MSIR can be associated with a CPU.
> > When changing MSI interrupt affinity, this MSI will be moved to the
> > corresponding MSIR and MSI message data will be changed according to
> > MSIR. when requesting a MSI, the bits of all 4 MSIR will be reserved.
> > The parameter 'msi_affinity_flag' is provide to change this mode.
> > "lsmsi=3Dno-affinity" will disable affinity, all MSI can only be
> > associated with CPU 0.
> >
> > Signed-off-by: Minghuan Lian <Minghuan.Lian-3arQi8VN3Tc@public.gmane.org>
> > ---
> > v2-v1:
> > - None
> >
> >  drivers/irqchip/irq-ls-scfg-msi.c | 75
> > ++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 70 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-ls-scfg-msi.c
> > b/drivers/irqchip/irq-ls-scfg-msi.c
> > index dc19569..753fe39 100644
> > --- a/drivers/irqchip/irq-ls-scfg-msi.c
> > +++ b/drivers/irqchip/irq-ls-scfg-msi.c
> > @@ -40,6 +40,7 @@ struct ls_scfg_msir {
> >  	unsigned int gic_irq;
> >  	unsigned int bit_start;
> >  	unsigned int bit_end;
> > +	unsigned int srs; /* Shared interrupt register select */
> >  	void __iomem *reg;
> >  };
> >
> > @@ -70,6 +71,19 @@ struct ls_scfg_msi {
> >  	.chip	=3D &ls_scfg_msi_irq_chip,
> >  };
> >
> > +static int msi_affinity_flag =3D 1;
> > +
> > +static int __init early_parse_ls_scfg_msi(char *p) {
> > +	if (p && strncmp(p, "no-affinity", 11) =3D=3D 0)
> > +		msi_affinity_flag =3D 0;
> > +	else
> > +		msi_affinity_flag =3D 1;
> > +
> > +	return 0;
> > +}
> > +early_param("lsmsi", early_parse_ls_scfg_msi);
>=20
> What is the point of this option? If feels like an unnecessary complexity=
.
[Minghuan Lian] For LS1043a rev1.1, there are only 8 MSI interrupts for eac=
h MSI controller when enable affinity.
(32 MSI interrupts are evenly distributed to 4 cores).  3 MSI controllers c=
an only provide 32 MSI interrupts.
When disable affinity, the MSI interrupts number of 3 controllers can up to=
 32*3=3D 96.
32 MSI interrupts may be not enough.
For example: an Ethernet card with 4 ports, each port needs 4 RX, 4TX and 1=
 error interrupts, totally need 4*(4+4+1)
36 MSI interrupts.
With the parameter "lsmsi=3Dno-affinity" this Ethernet card can work well, =
although the performance is poor.
 =20
>=20
> > +
> >  static void ls_scfg_msi_compose_msg(struct irq_data *data, struct
> > msi_msg *msg)  {
> >  	struct ls_scfg_msi *msi_data =3D irq_data_get_irq_chip_data(data);
> @@
> > -77,12 +91,43 @@ static void ls_scfg_msi_compose_msg(struct irq_data
> *data, struct msi_msg *msg)
> >  	msg->address_hi =3D upper_32_bits(msi_data->msiir_addr);
> >  	msg->address_lo =3D lower_32_bits(msi_data->msiir_addr);
> >  	msg->data =3D data->hwirq;
> > +
> > +	if (msi_affinity_flag) {
> > +		u32 msir_index;
> > +
> > +		msir_index =3D cpumask_first(data->common->affinity);
> > +		if (msir_index >=3D msi_data->msir_num)
> > +			msir_index =3D 0;
>=20
> How can this happen?
[Minghuan Lian]  This will never happen. I will remove this "if" sentence.=
=20

>=20
> > +
> > +		msg->data |=3D msir_index;
>=20
> How do you guarantee that the low bits were clear? Please document the
> way you encode your MSI payload.
[Minghuan Lian] the available message data is a bytes.
   7    6  5  4  3   2    1    0
| - |       ibs           |   srs |

SRS  bit 0-1  is used to select MSIR register/CPU.  A MSIR is associated wi=
th a CPU.
IBS bit2-6 of ls1046,  bit2-4 for ls1043 is used to select bit of the MSIR.=
=20
When enable affinity,  only bits of MSIR0(srs =3D 0 cpu0) is be freed for r=
equesting MSI.
all bits of the MSIR1-3(cpu1-3) are reserved to be sure this MSI can be suc=
cessfully associated with cpu 1-3.
So, When requesting a MSI interrupt, srs always is 0.=20
The hwirq always equals bits number of the MSIR0(SRS =3D 0).
First, MSI message data payload equals hwirq, and then plus the real SRS ac=
cording to smp_affinity.
This MSI interrupt will be routed to the corresponding the MSIR/CPU.



>=20
> > +	}
> >  }
> >
> >  static int ls_scfg_msi_set_affinity(struct irq_data *irq_data,
> >  				    const struct cpumask *mask, bool force)  {
> > -	return -EINVAL;
> > +	struct ls_scfg_msi *msi_data =3D irq_data_get_irq_chip_data(irq_data)=
;
> > +	u32 cpu;
> > +
> > +	if (!msi_affinity_flag)
> > +		return -EINVAL;
> > +
> > +	if (!force)
> > +		cpu =3D cpumask_any_and(mask, cpu_online_mask);
> > +	else
> > +		cpu =3D cpumask_first(mask);
> > +
> > +	if (cpu >=3D msi_data->msir_num)
> > +		return -EINVAL;
> > +
> > +	if (msi_data->msir[cpu].gic_irq <=3D 0) {
> > +		pr_warn("cannot bind the irq to cpu%d\n", cpu);
>=20
> Please don't. Returning an error is enough. If you really want to have
> something, turn it into a proper debug message.
[Minghuan Lian] ok, I will change it.
>=20
> > +		return -EINVAL;
> > +	}
> > +
> > +	cpumask_copy(irq_data->common->affinity, mask);
> > +
> > +	return IRQ_SET_MASK_OK;
> >  }
> >
> >  static struct irq_chip ls_scfg_msi_parent_chip =3D { @@ -158,7 +203,7
> > @@ static void ls_scfg_msi_irq_handler(struct irq_desc *desc)
> >
> >  	for_each_set_bit_from(pos, &val, size) {
> >  		hwirq =3D ((msir->bit_end - pos) << msi_data->cfg->ibs_shift) |
> > -			msir->index;
> > +			msir->srs;
> >  		virq =3D irq_find_mapping(msi_data->parent, hwirq);
> >  		if (virq)
> >  			generic_handle_irq(virq);
> > @@ -221,10 +266,19 @@ static int ls_scfg_msi_setup_hwirq(struct
> ls_scfg_msi *msi_data, int index)
> >  					 ls_scfg_msi_irq_handler,
> >  					 msir);
> >
> > +	if (msi_affinity_flag) {
> > +		/* Associate MSIR interrupt to the cpu */
> > +		irq_set_affinity(msir->gic_irq, get_cpu_mask(index));
> > +		msir->srs =3D 0; /* This value is determined by the CPU */
> > +	} else
> > +		msir->srs =3D index;
> > +
> >  	/* Release the hwirqs corresponding to this MSIR */
> > -	for (i =3D 0; i < msi_data->cfg->msir_irqs; i++) {
> > -		hwirq =3D i << msi_data->cfg->ibs_shift | msir->index;
> > -		bitmap_clear(msi_data->used, hwirq, 1);
> > +	if (!msi_affinity_flag || msir->index =3D=3D 0) {
> > +		for (i =3D 0; i < msi_data->cfg->msir_irqs; i++) {
> > +			hwirq =3D i << msi_data->cfg->ibs_shift | msir->index;
> > +			bitmap_clear(msi_data->used, hwirq, 1);
> > +		}
> >  	}
> >
> >  	return 0;
> > @@ -316,6 +370,17 @@ static int ls_scfg_msi_probe(struct
> platform_device *pdev)
> >  	bitmap_set(msi_data->used, 0, msi_data->irqs_num);
> >
> >  	msi_data->msir_num =3D of_irq_count(pdev->dev.of_node);
> > +
> > +	if (msi_affinity_flag) {
> > +		u32 cpu_num;
> > +
> > +		cpu_num =3D num_possible_cpus();
> > +		if (msi_data->msir_num >=3D cpu_num)
> > +			msi_data->msir_num =3D cpu_num;
> > +		else
> > +			msi_affinity_flag =3D 0;
> > +	}
> > +
> >  	msi_data->msir =3D devm_kcalloc(&pdev->dev, msi_data->msir_num,
> >  				      sizeof(*msi_data->msir),
> >  				      GFP_KERNEL);
> >
>=20
> This is a very confusing patch. Please get rid of this useless option and
> document how you encode the routing in the hwirq.
[Minghuan Lian]  Both LS1021a and LS1043av1.0 have only a MSIR, a gic inter=
rupt.
MSI controllers cannot support affinity.
Then LS1046a/LS1043av1.1 extends MSIR number to 4 same to cpu number. So ea=
ch MSIR with a GIC interrupt can be associated with a cpu.
To keep simple, the first patch for ls1046 and ls1043av1.1 keep the same wa=
y with ls1021 and ls1043av1.0 that does not support affinity and
all interrupts of MSIR0-3 are different and can be used for requesting MSI =
interrupts.
This patch is to enable affinity, that means, for ls1046a and ls1043av1.1, =
the same bit of MSIR0-3 will be looked as one interrupt using the same hwir=
q. And MSIRN  only is used when the MSI interrupt is associated with the co=
rresponding cpu.

>=20
> Thanks,
>=20
> 	M.
> --
> Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
