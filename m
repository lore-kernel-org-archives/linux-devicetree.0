From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] ARM: msm: Fix gic irqdomain support
Date: Mon, 23 Apr 2012 16:55:11 -0600
Message-ID: <CACxGe6sPkW8WviMX=oJEj+-G7XMeaWaQYfe_hg2quB-Sh2gEDA@mail.gmail.com>
References: <1335221222-30879-1-git-send-email-davidb@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1335221222-30879-1-git-send-email-davidb@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Brown <davidb@codeaurora.org>
Cc: Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2012 at 4:47 PM, David Brown <davidb@codeaurora.org> wr=
ote:
> As of
>
> =A0 =A0commit 75294957be1dee7d22dd7d90bd31334ba410e836
> =A0 =A0Author: Grant Likely <grant.likely@secretlab.ca>
> =A0 =A0Date: =A0 Tue Feb 14 14:06:57 2012 -0700
>
> =A0 =A0 =A0 =A0irq_domain: Remove 'new' irq_domain in favour of the p=
pc one
>
> the ARM gic controller uses proper irq domains. =A0Fix the MSM gic
> initialization and DT so that it works again.
>
> Signed-off-by: David Brown <davidb@codeaurora.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

This should go via the arm-soc tree I think

g.

> ---
> =A0arch/arm/boot/dts/msm8660-surf.dts | =A0 =A04 ++--
> =A0arch/arm/mach-msm/board-msm8x60.c =A0| =A0 25 +++++++++++++++-----=
-----
> =A02 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/boot/dts/msm8660-surf.dts b/arch/arm/boot/dts/m=
sm8660-surf.dts
> index 15ded0d..45bc4bb 100644
> --- a/arch/arm/boot/dts/msm8660-surf.dts
> +++ b/arch/arm/boot/dts/msm8660-surf.dts
> @@ -10,7 +10,7 @@
> =A0 =A0 =A0 =A0intc: interrupt-controller@02080000 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "qcom,msm-8660-qgic";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupt-controller;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <3>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D < 0x02080000 0x1000 >,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0< 0x02081000 0x1000 >;
> =A0 =A0 =A0 =A0};
> @@ -19,6 +19,6 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "qcom,msm-hsuart", "qco=
m,msm-uart";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x19c40000 0x1000>,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<0x19c00000 0x1000>;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <195>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <0 195 0x0>;
> =A0 =A0 =A0 =A0};
> =A0};
> diff --git a/arch/arm/mach-msm/board-msm8x60.c b/arch/arm/mach-msm/bo=
ard-msm8x60.c
> index 962e711..fb3496a 100644
> --- a/arch/arm/mach-msm/board-msm8x60.c
> +++ b/arch/arm/mach-msm/board-msm8x60.c
> @@ -17,6 +17,7 @@
> =A0#include <linux/irqdomain.h>
> =A0#include <linux/of.h>
> =A0#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> =A0#include <linux/of_platform.h>
> =A0#include <linux/memblock.h>
>
> @@ -49,10 +50,22 @@ static void __init msm8x60_map_io(void)
> =A0 =A0 =A0 =A0msm_map_msm8x60_io();
> =A0}
>
> +#ifdef CONFIG_OF
> +static struct of_device_id msm_dt_gic_match[] __initdata =3D {
> + =A0 =A0 =A0 { .compatible =3D "qcom,msm-8660-qgic", .data =3D gic_o=
f_init },
> + =A0 =A0 =A0 {}
> +};
> +#endif
> +
> =A0static void __init msm8x60_init_irq(void)
> =A0{
> - =A0 =A0 =A0 gic_init(0, GIC_PPI_START, MSM_QGIC_DIST_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void *)MSM_QGIC_CPU_BASE);
> + =A0 =A0 =A0 if (!of_have_populated_dt())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gic_init(0, GIC_PPI_START, MSM_QGIC_DIS=
T_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(void *)MSM_QGIC_CPU=
_BASE);
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_irq_init(msm_dt_gic_match);
> +#endif
>
> =A0 =A0 =A0 =A0/* Edge trigger PPIs except AVS_SVICINT and AVS_SVICIN=
TSWDONE */
> =A0 =A0 =A0 =A0writel(0xFFFFD7FF, MSM_QGIC_DIST_BASE + GIC_DIST_CONFI=
G + 4);
> @@ -73,16 +86,8 @@ static struct of_dev_auxdata msm_auxdata_lookup[] =
__initdata =3D {
> =A0 =A0 =A0 =A0{}
> =A0};
>
> -static struct of_device_id msm_dt_gic_match[] __initdata =3D {
> - =A0 =A0 =A0 { .compatible =3D "qcom,msm-8660-qgic", },
> - =A0 =A0 =A0 {}
> -};
> -
> =A0static void __init msm8x60_dt_init(void)
> =A0{
> - =A0 =A0 =A0 irq_domain_generate_simple(msm_dt_gic_match, MSM8X60_QG=
IC_DIST_PHYS,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GIC_SPI=
_START);
> -
> =A0 =A0 =A0 =A0if (of_machine_is_compatible("qcom,msm8660-surf")) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_INFO "Init surf UART regis=
ters\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0msm8x60_init_uart12dm();
> --
> Sent by an employee of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora F=
orum.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
