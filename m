From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH 1/2] ARCv2: IDU-intc: Add support for edge-triggered
 interrupts
Date: Wed, 24 Jul 2019 10:47:31 +0000
Message-ID: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190723102606.309089-1-mischa.jonker@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723102606.309089-1-mischa.jonker@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mischa Jonker <Mischa.Jonker@synopsys.com>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mischa,

> -----Original Message-----
> From: Mischa Jonker <mischa.jonker@synopsys.com>
> Sent: Tuesday, July 23, 2019 1:26 PM
> To: Vineet Gupta <vgupta@synopsys.com>; Alexey Brodkin <abrodkin@synopsys=
.com>;
> kstewart@linuxfoundation.org; tglx@linutronix.de; robh+dt@kernel.org; lin=
ux-snps-
> arc@lists.infradead.org; linux-kernel@vger.kernel.org; devicetree@vger.ke=
rnel.org
> Cc: Mischa Jonker <mischa.jonker@synopsys.com>
> Subject: [PATCH 1/2] ARCv2: IDU-intc: Add support for edge-triggered inte=
rrupts
>=20
> This adds support for an optional extra interrupt cell to specify edge
> vs level triggered. It is backward compatible with dts files with only
> one cell, and will default to level-triggered in such a case.

In general LGTM. Still a couple of comments.

It might be useful to explain changes
made to idu_irq_set_affinity() as it's not immediately clear what affinity
has to do with IRQ modes (in theory it should be orthogonal).

But what happens we're actually fixing previously implemented short-cut
when instead of a separately set IRQ mode we were doing it together with
setup of distribution since it's done with the same one command
(anyways we relied on the one and only IRQ type being supported).

And now we have a proper implementation with separated setup of IRQ mode an=
d
affinity.

>  static int
>  idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumas=
k,
>  		     bool force)
> @@ -263,13 +285,32 @@ idu_irq_set_affinity(struct irq_data *data, const s=
truct cpumask *cpumask,
>  	else
>  		distribution_mode =3D IDU_M_DISTRI_RR;
>=20
> -	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, distribution_mode);
> +	idu_set_mode(data->hwirq, false, 0, true, distribution_mode);
>=20
>  	raw_spin_unlock_irqrestore(&mcip_lock, flags);
>=20
>  	return IRQ_SET_MASK_OK;
>  }
>=20
> +static int idu_irq_set_type(struct irq_data *data, u32 type)
> +{
> +	unsigned long flags;
> +
> +	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_LEVEL_HIGH))
> +		return -EINVAL;

Maybe add an explanation why only these types are supported?

-Alexey
