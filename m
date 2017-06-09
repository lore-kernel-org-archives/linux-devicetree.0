From: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v6 1/3] clk: imx7d: create clocks behind rawnand clock
 gate
Date: Fri, 9 Jun 2017 19:16:33 +0000
Message-ID: <a454ef9c-ab6a-631a-98b8-6d58f8065927@nxp.com>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
 <8b9edf13938e3166081e72ba8fa4ac822035079c.1496961128.git-series.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b9edf13938e3166081e72ba8fa4ac822035079c.1496961128.git-series.stefan@agner.ch>
Content-Language: en-US
Content-ID: <11D7CEBF8D29024DB390E98845020F00@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>
Cc: "A.S. Dong" <aisheng.dong@nxp.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>li
List-Id: devicetree@vger.kernel.org



On 06/08/2017 05:34 PM, Stefan Agner wrote:
> The rawnand clock gate gates two clocks, NAND_USDHC_BUS_CLK_ROOT
> and NAND_CLK_ROOT. However, the gate has been in the chain of the
> latter only. This does not allow to use the NAND_USDHC_BUS_CLK_ROOT
> only, e.g. as required by APBH-Bridge-DMA.
>
> Add new clocks which represent the clock after the gate, and use a
> shared clock gate to correctly model the hardware.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
Acked-by: Han Xu <han.xu@nxp.com>
> ---
>   drivers/clk/imx/clk-imx7d.c             | 6 ++++--
>   include/dt-bindings/clock/imx7d-clock.h | 4 +++-
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 93b0364..e364060 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -25,6 +25,7 @@
>   static u32 share_count_sai1;
>   static u32 share_count_sai2;
>   static u32 share_count_sai3;
> +static u32 share_count_nand;
>  =20
>   static struct clk_div_table test_div_table[] =3D {
>   	{ .val =3D 3, .div =3D 1, },
> @@ -748,7 +749,7 @@ static void __init imx7d_clocks_init(struct device_no=
de *ccm_node)
>   	clks[IMX7D_ENET2_TIME_ROOT_DIV] =3D imx_clk_divider2("enet2_time_post_=
div", "enet2_time_pre_div", base + 0xa880, 0, 6);
>   	clks[IMX7D_ENET_PHY_REF_ROOT_DIV] =3D imx_clk_divider2("enet_phy_ref_p=
ost_div", "enet_phy_ref_pre_div", base + 0xa900, 0, 6);
>   	clks[IMX7D_EIM_ROOT_DIV] =3D imx_clk_divider2("eim_post_div", "eim_pre=
_div", base + 0xa980, 0, 6);
> -	clks[IMX7D_NAND_ROOT_DIV] =3D imx_clk_divider2("nand_post_div", "nand_p=
re_div", base + 0xaa00, 0, 6);
> +	clks[IMX7D_NAND_ROOT_CLK] =3D imx_clk_divider2("nand_root_clk", "nand_p=
re_div", base + 0xaa00, 0, 6);
>   	clks[IMX7D_QSPI_ROOT_DIV] =3D imx_clk_divider2("qspi_post_div", "qspi_=
pre_div", base + 0xaa80, 0, 6);
>   	clks[IMX7D_USDHC1_ROOT_DIV] =3D imx_clk_divider2("usdhc1_post_div", "u=
sdhc1_pre_div", base + 0xab00, 0, 6);
>   	clks[IMX7D_USDHC2_ROOT_DIV] =3D imx_clk_divider2("usdhc2_post_div", "u=
sdhc2_pre_div", base + 0xab80, 0, 6);
> @@ -825,7 +826,8 @@ static void __init imx7d_clocks_init(struct device_no=
de *ccm_node)
>   	clks[IMX7D_ENET2_TIME_ROOT_CLK] =3D imx_clk_gate4("enet2_time_root_clk=
", "enet2_time_post_div", base + 0x4510, 0);
>   	clks[IMX7D_ENET_PHY_REF_ROOT_CLK] =3D imx_clk_gate4("enet_phy_ref_root=
_clk", "enet_phy_ref_post_div", base + 0x4520, 0);
>   	clks[IMX7D_EIM_ROOT_CLK] =3D imx_clk_gate4("eim_root_clk", "eim_post_d=
iv", base + 0x4160, 0);
> -	clks[IMX7D_NAND_ROOT_CLK] =3D imx_clk_gate4("nand_root_clk", "nand_post=
_div", base + 0x4140, 0);
> +	clks[IMX7D_NAND_RAWNAND_CLK] =3D imx_clk_gate2_shared2("nand_rawnand_cl=
k", "nand_root_clk", base + 0x4140, 0, &share_count_nand);
> +	clks[IMX7D_NAND_USDHC_BUS_RAWNAND_CLK] =3D imx_clk_gate2_shared2("nand_=
usdhc_rawnand_clk", "nand_usdhc_root_clk", base + 0x4140, 0, &share_count_n=
and);
>   	clks[IMX7D_QSPI_ROOT_CLK] =3D imx_clk_gate4("qspi_root_clk", "qspi_pos=
t_div", base + 0x4150, 0);
>   	clks[IMX7D_USDHC1_ROOT_CLK] =3D imx_clk_gate4("usdhc1_root_clk", "usdh=
c1_post_div", base + 0x46c0, 0);
>   	clks[IMX7D_USDHC2_ROOT_CLK] =3D imx_clk_gate4("usdhc2_root_clk", "usdh=
c2_post_div", base + 0x46d0, 0);
> diff --git a/include/dt-bindings/clock/imx7d-clock.h b/include/dt-binding=
s/clock/imx7d-clock.h
> index a7a1a50..de62a83 100644
> --- a/include/dt-bindings/clock/imx7d-clock.h
> +++ b/include/dt-bindings/clock/imx7d-clock.h
> @@ -450,5 +450,7 @@
>   #define IMX7D_CLK_ARM			437
>   #define IMX7D_CKIL			438
>   #define IMX7D_OCOTP_CLK			439
> -#define IMX7D_CLK_END			440
> +#define IMX7D_NAND_RAWNAND_CLK		440
> +#define IMX7D_NAND_USDHC_BUS_RAWNAND_CLK 441
> +#define IMX7D_CLK_END			442
>   #endif /* __DT_BINDINGS_CLOCK_IMX7D_H */
