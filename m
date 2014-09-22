From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: ls1021a: add gating clocks to IP blocks.
Date: Mon, 22 Sep 2014 09:00:37 +0200
Message-ID: <20140922070037.GR3755@pengutronix.de>
References: <1411366160-42685-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411366160-42685-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, Sep 22, 2014 at 02:09:20PM +0800, Xiubo Li wrote:
> A given application may not use all the peripherals on the device.
> In this case, it may be desirable to disable unused peripherals.
> DCFG provides a mechanism for gating clocks to IP blocks that are
> not used when running an application.
>=20
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>=20
> Change in v2:
> - Add binding support.
>=20
>=20
>  .../devicetree/bindings/clock/ls1021a-clock.txt    |  27 +++++
>  arch/arm/mach-imx/Makefile                         |   2 +
>  arch/arm/mach-imx/clk-ls1021a.c                    | 124 +++++++++++=
++++++++++
>  arch/arm/mach-imx/clk.h                            |  21 ++++
>  include/dt-bindings/clock/ls1021a-clock.h          |  54 +++++++++
>  5 files changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ls1021a-c=
lock.txt
>  create mode 100644 arch/arm/mach-imx/clk-ls1021a.c
>  create mode 100644 include/dt-bindings/clock/ls1021a-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ls1021a-clock.tx=
t b/Documentation/devicetree/bindings/clock/ls1021a-clock.txt
> new file mode 100644
> index 0000000..e53d976
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ls1021a-clock.txt
> @@ -0,0 +1,27 @@
> +Gating clock bindings for Freescale LS1021A SOC
> +
> +Required properties:
> +- compatible:		Should be "fsl,ls1021a-gate"
> +- reg:			Address and length of the register set
> +- #clock-cells:		Should be <1>
> +
> +The clock consumers should specify the desired clock by having one c=
lock
> +ID in its "clocks" phandle cell.
> +Please see include/dt-bindings/clock/ls1021a-clock.h for the full li=
st of
> +LS1021A clock IDs.
> +
> +Example:
> +
> +gate: gate@1ee0000 {
> +	compatible =3D "fsl,ls1021a-gate";
> +	reg =3D <0x0 0x1ee0000 0x0 0x10000>;
> +	#clock-cells =3D <1>;
> +};
> +
> +wdog0: wdog@2ad0000 {
> +	compatible =3D "fsl,ls1021a-wdt", "fsl,imx21-wdt";
> +	reg =3D <0x0 0x2ad0000 0x0 0x10000>;
> +	interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks =3D <&gate LS1021A_CLK_WDOG12_EN>;
> +	clock-names =3D "wdog12_en";
> +};
> diff --git a/arch/arm/mach-imx/Makefile b/arch/arm/mach-imx/Makefile
> index 6e4fcd8..f6a1544 100644
> --- a/arch/arm/mach-imx/Makefile
> +++ b/arch/arm/mach-imx/Makefile
> @@ -110,4 +110,6 @@ obj-$(CONFIG_SOC_IMX53) +=3D mach-imx53.o
> =20
>  obj-$(CONFIG_SOC_VF610) +=3D clk-vf610.o mach-vf610.o
> =20
> +obj-$(CONFIG_SOC_LS1021A) +=3D clk-ls1021a.o
> +
>  obj-y +=3D devices/
> diff --git a/arch/arm/mach-imx/clk-ls1021a.c b/arch/arm/mach-imx/clk-=
ls1021a.c
> new file mode 100644
> index 0000000..680b616
> --- /dev/null
> +++ b/arch/arm/mach-imx/clk-ls1021a.c
> @@ -0,0 +1,124 @@
> +/*
> + * Copyright 2014 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
This empty line can be removed.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_address.h>
> +#include <dt-bindings/clock/ls1021a-clock.h>
> +
> +#include "clk.h"
> +
> +static struct clk *clk[LS1021A_CLK_END];
> +static struct clk_onecell_data clk_data;
> +
> +static void __init ls1021a_clocks_init(struct device_node *np)
> +{
> +	void __iomem *dcfg_base;
> +
> +#define DCFG_CCSR_DEVDISR1	(dcfg_base + 0x70)
> +#define DCFG_CCSR_DEVDISR2	(dcfg_base + 0x74)
> +#define DCFG_CCSR_DEVDISR3	(dcfg_base + 0x78)
> +#define DCFG_CCSR_DEVDISR4	(dcfg_base + 0x7c)
> +#define DCFG_CCSR_DEVDISR5	(dcfg_base + 0x80)
> +
> +	dcfg_base =3D of_iomap(np, 0);
> +
> +	BUG_ON(!dcfg_base);
Is this worth a BUG? Or is it enough to do

	if (!dcfg_base) {
		pr_warn("failed to map fsl,ls1021a-gate device\n");
		return
	}

> +
> +	clk[LS1021A_CLK_PBL_EN] =3D ls1021a_clk_gate("pbl_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 0, true);
If the machine's device tree contains two (or more) nodes that are
compatible to "fsl,ls1021a-gate", you overwrite your static clk array. =
Is
it worth to add another check here?:

	if (clk[LS1021A_CLK_PBL_EN]) {
		pr_warn("only a single instance of fsl,ls1021a-gate supported\n");
		return;
	}

(Is it a valid case that ls1021a_clk_gate returns NULL? In this case th=
e
condition above is wrong.)

> +	clk[LS1021A_CLK_ESDHC_EN] =3D ls1021a_clk_gate("esdhc_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 2, true);
> +	clk[LS1021A_CLK_DMA1_EN] =3D ls1021a_clk_gate("dma1_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 8, true);
> +	clk[LS1021A_CLK_DMA2_EN] =3D ls1021a_clk_gate("dma2_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 9, true);
> +	clk[LS1021A_CLK_USB3_PHY_EN] =3D ls1021a_clk_gate("usb3_phy_en", "d=
ummy",
> +						DCFG_CCSR_DEVDISR1, 12, true);
> +	clk[LS1021A_CLK_USB2_EN] =3D ls1021a_clk_gate("usb2_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 13, true);
> +	clk[LS1021A_CLK_SATA_EN] =3D ls1021a_clk_gate("sata_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 16, true);
> +	clk[LS1021A_CLK_USB3_EN] =3D ls1021a_clk_gate("usb3_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 17, true);
> +	clk[LS1021A_CLK_SEC_EN] =3D ls1021a_clk_gate("sec_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 22, true);
> +	clk[LS1021A_CLK_2D_ACE_EN] =3D ls1021a_clk_gate("2d_ace_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR1, 30, true);
> +	clk[LS1021A_CLK_QE_EN] =3D ls1021a_clk_gate("qe_en", "dummy",
> +						DCFG_CCSR_DEVDISR1, 31, true);
> +
> +	clk[LS1021A_CLK_ETSEC1_EN] =3D ls1021a_clk_gate("etsec1_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR2, 0, true);
> +	clk[LS1021A_CLK_ETSEC2_EN] =3D ls1021a_clk_gate("etsec2_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR2, 1, true);
> +	clk[LS1021A_CLK_ETSEC3_EN] =3D ls1021a_clk_gate("etsec3_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR2, 2, true);
> +
> +	clk[LS1021A_CLK_PEX1_EN] =3D ls1021a_clk_gate("pex1_en", "dummy",
> +						DCFG_CCSR_DEVDISR3, 0, true);
> +	clk[LS1021A_CLK_PEX2_EN] =3D ls1021a_clk_gate("pex2_en", "dummy",
> +						DCFG_CCSR_DEVDISR3, 1, true);
> +
> +	clk[LS1021A_CLK_DUART1_EN] =3D ls1021a_clk_gate("duart1_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR4, 2, true);
> +	clk[LS1021A_CLK_DUART2_EN] =3D ls1021a_clk_gate("duart2_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR4, 3, true);
> +	clk[LS1021A_CLK_QSPI_EN] =3D ls1021a_clk_gate("qspi_en", "dummy",
> +						DCFG_CCSR_DEVDISR4, 4, true);
> +
> +	clk[LS1021A_CLK_DDR_EN] =3D ls1021a_clk_gate("ddr_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 0, true);
> +	clk[LS1021A_CLK_OCRAM1_EN] =3D ls1021a_clk_gate("ocram1_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR5, 4, true);
> +	clk[LS1021A_CLK_IFC_EN] =3D ls1021a_clk_gate("ifc_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 8, true);
> +	clk[LS1021A_CLK_GPIO_EN] =3D ls1021a_clk_gate("gpio_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 9, true);
> +	clk[LS1021A_CLK_DBG_EN] =3D ls1021a_clk_gate("dbg_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 10, true);
> +	clk[LS1021A_CLK_FLEXCAN1_EN] =3D ls1021a_clk_gate("flexcan1_en", "d=
ummy",
> +						DCFG_CCSR_DEVDISR5, 12, true);
> +	clk[LS1021A_CLK_FLEXCAN234_EN] =3D ls1021a_clk_gate("flexcan234_en"=
,
> +					"dummy", DCFG_CCSR_DEVDISR5, 13, true);
> +	/* For flextiemr 2/3/4/5/6/7/8 */
s/tiemr/timer/

> +	clk[LS1021A_CLK_FLEXTIMER_EN] =3D ls1021a_clk_gate("flextimer_en",
> +					"dummy", DCFG_CCSR_DEVDISR5, 14, true);
> +	clk[LS1021A_CLK_SECMON_EN] =3D ls1021a_clk_gate("secmon_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR5, 17, true);
> +	clk[LS1021A_CLK_WDOG12_EN] =3D ls1021a_clk_gate("wdog12_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR5, 21, true);
> +	clk[LS1021A_CLK_I2C23_EN] =3D ls1021a_clk_gate("i2c23_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 22, true);
> +	/* For SAI 1/2/3/4 */
> +	clk[LS1021A_CLK_SAI_EN] =3D ls1021a_clk_gate("sai_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 23, true);
> +	/* For lpuart 2/3/4/5/6  */
> +	clk[LS1021A_CLK_LPUART_EN] =3D ls1021a_clk_gate("lpuart_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR5, 24, true);
> +	clk[LS1021A_CLK_DSPI12_EN] =3D ls1021a_clk_gate("dspi12_en", "dummy=
",
> +						DCFG_CCSR_DEVDISR5, 25, true);
> +	clk[LS1021A_CLK_ASRC_EN] =3D ls1021a_clk_gate("asrc_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 26, true);
> +	clk[LS1021A_CLK_SPDIF_EN] =3D ls1021a_clk_gate("spdif_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 27, true);
> +	clk[LS1021A_CLK_I2C1_EN] =3D ls1021a_clk_gate("i2c1_en", "dummy",
> +						DCFG_CCSR_DEVDISR5, 29, true);
> +	clk[LS1021A_CLK_LPUART1_EN] =3D ls1021a_clk_gate("lpuart1_en", "dum=
my",
> +						DCFG_CCSR_DEVDISR5, 30, true);
> +	clk[LS1021A_CLK_FLEXTIMER1_EN] =3D ls1021a_clk_gate("flextimer1_en"=
,
> +					"dummy", DCFG_CCSR_DEVDISR5, 31, true);
> +
> +	/* Add the clocks to provider list */
> +	clk_data.clks =3D clk;
> +	clk_data.clk_num =3D ARRAY_SIZE(clk);
These two could be initialised statically.

> +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +}
> +CLK_OF_DECLARE(ls1021a, "fsl,ls1021a-gate", ls1021a_clocks_init);
> diff --git a/arch/arm/mach-imx/clk.h b/arch/arm/mach-imx/clk.h
> index 4cdf8b6..dd9e369 100644
> --- a/arch/arm/mach-imx/clk.h
> +++ b/arch/arm/mach-imx/clk.h
> @@ -107,6 +107,27 @@ static inline struct clk *imx_clk_gate_dis(const=
 char *name, const char *parent,
>  			shift, CLK_GATE_SET_TO_DISABLE, &imx_ccm_lock);
>  }
> =20
> +/* The DCFG registers are in big endian mode on LS1021A SoC */
> +static inline u8 ls1021a_clk_calculate_shift(u8 shift)
> +{
> +	int m, n;
> +
> +	m =3D shift / 8;
> +	n =3D shift % 8;
> +
> +	return (3 - m) * 8 + n;
> +}
> +
> +static inline struct clk *ls1021a_clk_gate(const char *name, const c=
har *parent,
> +		void __iomem *reg, u8 shift, bool big_endian)
> +{
> +	if (big_endian)
This is always true up to now. Does this change in the future? If not I
suggest to drop the parameter. Even if this might change, I would
prefer:

	clk[LS1021A_CLK_FLEXTIMER1_EN] =3D
			ls1021a_clk_gate("flextimer1_en",
					 "dummy", DCFG_CCSR_DEVDISR5,
					 ls1021a_clk_shift_be(31));

which is moreover more likely to be optimizable by the compiler.
But maybe that's only me.

> +		shift =3D ls1021a_clk_calculate_shift(shift);
> +
> +	return clk_register_gate(NULL, name, parent, CLK_SET_RATE_PARENT, r=
eg,
> +			shift, CLK_GATE_SET_TO_DISABLE, &imx_ccm_lock);
> +}
> +
>  static inline struct clk *imx_clk_mux(const char *name, void __iomem=
 *reg,
>  		u8 shift, u8 width, const char **parents, int num_parents)
>  {

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
