From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v4 03/10] irqchip/sunxi-nmi: add support for
 the NMI in A64 R_INTC
Date: Tue, 25 Apr 2017 00:11:44 +0800
Message-ID: <854c73045151f98498c848f692957f30@aosc.io>
References: <20170424160103.9447-1-icenowy@aosc.io>
 <20170424160103.9447-4-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBQ6H7DDQKGQEUBY7L3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170424160103.9447-4-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-04-25 00:00=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=EF=BC=
=9A
> Add support for the newly imported compatible for the A64 R_INTC in
> irq-sunxi-nmi driver
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
> New patch in v4, which is part of NMI refactor.
>=20
>  drivers/irqchip/irq-sunxi-nmi.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-sunxi-nmi.c=20
> b/drivers/irqchip/irq-sunxi-nmi.c
> index 668730c5cb66..5f7408b1cd4d 100644
> --- a/drivers/irqchip/irq-sunxi-nmi.c
> +++ b/drivers/irqchip/irq-sunxi-nmi.c
> @@ -56,6 +56,12 @@ static struct sunxi_sc_nmi_reg_offs sun9i_reg_offs =3D=
=20
> {
>  	.enable	=3D 0x04,
>  };
>=20
> +static struct sunxi_sc_nmi_reg_offs sun50i_reg_offs =3D {
> +	.ctrl	=3D 0x0c,
> +	.pend	=3D 0x10,
> +	.enable	=3D 0x40,
> +};
> +
>  static inline void sunxi_sc_nmi_write(struct irq_chip_generic *gc, u32=
=20
> off,
>  				      u32 val)
>  {
> @@ -220,3 +226,10 @@ static int __init sun9i_nmi_irq_init(struct
> device_node *node,
>  	return sunxi_sc_nmi_irq_init(node, &sun9i_reg_offs);
>  }
>  IRQCHIP_DECLARE(sun9i_nmi, "allwinner,sun9i-a80-nmi",=20
> sun9i_nmi_irq_init);
> +
> +static int __init sun50i_nmi_irq_init(struct device_node *node,
> +				     struct device_node *parent)
> +{
> +	return sunxi_sc_nmi_irq_init(node, &sun50i_reg_offs);
> +}
> +IRQCHIP_DECLARE(sun50i_nmi, "allwinner,sun50i-a80-nmi",=20
> sun50i_nmi_irq_init);

Should be:
+IRQCHIP_DECLARE(sun50i_nmi, "allwinner,sun50i-a64-r-intc",=20
sun50i_nmi_irq_init);

Sorry!

Thanks,
Icenowy

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
