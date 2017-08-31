From: Code Kipper <codekipper@gmail.com>
Subject: Re: [PATCH 3/3] dmaengine: sun6i: Add support for Allwinner A64
Date: Thu, 31 Aug 2017 13:44:05 +0200
Message-ID: <CAEKpxB=_CbbBem6EhA32P80esRhfCFoRPEv_rKKQauhzAdw_4Q@mail.gmail.com>
References: <20170830233609.13855-1-stefan.bruens@rwth-aachen.de> <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170830233609.13855-4-stefan.bruens@rwth-aachen.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Stefan_Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, devicetree <devicetree@vger.kernel.org>, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On 31 August 2017 at 01:36, Stefan Br=C3=BCns <stefan.bruens@rwth-aachen.de=
> wrote:
> The A64 SoC has the same dma engine as the H3 (sun8i), with a
> reduced amount of physical channels. Add the proper config data
> and compatible string to support it.
>
> Signed-off-by: Stefan Br=C3=BCns <stefan.bruens@rwth-aachen.de>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 4 ++++
>  drivers/dma/sun6i-dma.c                       | 7 +++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index f96287d3043a..b86019238b77 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -494,6 +494,8 @@
>                         interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
>                         clock-names =3D "ahb", "mod";
> +                       dmas =3D <&dma 23>, <&dma 23>;
> +                       dma-names =3D "rx", "tx";
Hi Stefan,
the dtsi parts should be in a separate patch

>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi0_pins>;
>                         resets =3D <&ccu RST_BUS_SPI0>;
> @@ -509,6 +511,8 @@
>                         interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
>                         clock-names =3D "ahb", "mod";
> +                       dmas =3D <&dma 24>, <&dma 24>;
> +                       dma-names =3D "rx", "tx";
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi1_pins>;
>                         resets =3D <&ccu RST_BUS_SPI1>;
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 5f4eee4513e5..6a17c5d63582 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -1068,6 +1068,12 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg =
=3D {
>         .nr_max_vchans   =3D 34,
>         .dmac_variant    =3D DMAC_VARIANT_H3,
>  };
> +
> +static struct sun6i_dma_config sun50i_a64_dma_cfg =3D {
> +       .nr_max_channels =3D 8,
> +       .nr_max_requests =3D 27,
> +       .nr_max_vchans   =3D 38,
> +       .dmac_variant    =3D DMAC_VARIANT_H3,
>  };
>
>  static const struct of_device_id sun6i_dma_match[] =3D {
> @@ -1075,6 +1081,7 @@ static const struct of_device_id sun6i_dma_match[] =
=3D {
>         { .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23=
_dma_cfg },
>         { .compatible =3D "allwinner,sun8i-a83t-dma", .data =3D &sun8i_a8=
3t_dma_cfg },
>         { .compatible =3D "allwinner,sun8i-h3-dma", .data =3D &sun8i_h3_d=
ma_cfg },
> +       { .compatible =3D "allwinner,sun50i-a64-dma", .data =3D &sun50i_a=
64_dma_cfg },
This all looks fine...it's similar to my patch here
https://github.com/codekipper/linux-sunxi/commit/8c54d9852dfad6ceb478c579a1=
213f38fb12fa80
which I've been too lazy to post. I think the binding documentation
should go with this patch and this should also be the 1st patch in the
series, followed by the dtsi changes.
BR,
CK
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_dma_match);
> --
> 2.14.1
>
