From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/4 v4] irqchip: Ingenic: Add support for new Ingenic
 Socs.
Date: Mon, 29 Jul 2019 13:25:33 -0400
Message-ID: <1564421133.6633.1@crapouillou.net>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
        <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhou Yanjie <zhouyanjie@zoho.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de, mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org



Le dim. 28 juil. 2019 =E0 13:34, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Add support for probing the irq-ingenic driver on the JZ4760/JZ4760B
> and the X1000/X1000E and the X1500 Socs from Ingenic.
>=20
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  drivers/irqchip/irq-ingenic.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/irqchip/irq-ingenic.c=20
> b/drivers/irqchip/irq-ingenic.c
> index 8430f5a..b72430c 100644
> --- a/drivers/irqchip/irq-ingenic.c
> +++ b/drivers/irqchip/irq-ingenic.c
> @@ -173,6 +173,11 @@ static int __init intc_2chip_of_init(struct=20
> device_node *node,
>  {
>  	return ingenic_intc_of_init(node, 2);
>  }
> +IRQCHIP_DECLARE(jz4760_intc, "ingenic,jz4760-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc",=20
> intc_2chip_of_init);
>  IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc",=20
> intc_2chip_of_init);
> +IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc",=20
> intc_2chip_of_init);

All these compatible strings point to the exact same behaviour. It was
already a mistake to have the three "ingenic,jz47[70,75,80]-intc" here;
there should have been only one, e.g. "ingenic,jz4770-intc" and the=20
other
two SoCs using it as a fallback compatible.

I think you don't need to add these, and in your devicetree just use
"ingenic,jz4780-intc" as a fallback compatible.

Cheers,
-Paul

=
