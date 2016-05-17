From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: r8a7795: enable DMA for I2C
Date: Tue, 17 May 2016 10:52:08 +0200
Message-ID: <CAMuHMdUqkodEsmOwzwv_PNVgqxkxG3bmjGTDYY5pC7g6tLciFg@mail.gmail.com>
References: <1462365303-1664-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1462365303-1664-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Wed, May 4, 2016 at 2:35 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add DMA properties to the I2C nodes.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/bo=
ot/dts/renesas/r8a7795.dtsi
> index a7315eb..49896e4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -693,6 +693,8 @@
>                         interrupts =3D <GIC_SPI 287 IRQ_TYPE_LEVEL_HI=
GH>;
>                         clocks =3D <&cpg CPG_MOD 931>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x91>, <&dmac1 0x90>;
> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <110>;
>                         status =3D "disabled";
>                 };
> @@ -705,6 +707,8 @@
>                         interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HI=
GH>;
>                         clocks =3D <&cpg CPG_MOD 930>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x93>, <&dmac1 0x92>;
> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <6>;
>                         status =3D "disabled";
>                 };
> @@ -717,6 +721,8 @@
>                         interrupts =3D <GIC_SPI 286 IRQ_TYPE_LEVEL_HI=
GH>;
>                         clocks =3D <&cpg CPG_MOD 929>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x95>, <&dmac1 0x94>;
> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <6>;
>                         status =3D "disabled";
>                 };

The three above can be used with SYS-DMAC1 (channels 16-31) or with SYS=
-DMAC2
(channels 32-47).
It should be tested with the latter before adding the corresponding dma=
s, as
we had issue with SYS-DMAC2 before (they may have been fixed in firmwar=
e in the
mean time).

> @@ -729,6 +735,8 @@
>                         interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HI=
GH>;
>                         clocks =3D <&cpg CPG_MOD 928>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x97>, <&dmac1 0x96>;

The two phandles above should reference "dmac0", as this i2c module can=
 only be
used with SYS-DMAC0 (channels 0-15), according to the datasheet.

> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <110>;
>                         status =3D "disabled";
>                 };
> @@ -741,6 +749,8 @@
>                         interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIG=
H>;
>                         clocks =3D <&cpg CPG_MOD 927>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x99>, <&dmac1 0x98>;

dmac0

> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <110>;
>                         status =3D "disabled";
>                 };
> @@ -753,6 +763,8 @@
>                         interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIG=
H>;
>                         clocks =3D <&cpg CPG_MOD 919>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x9b>, <&dmac1 0x9a>;

dmac0

> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <110>;
>                         status =3D "disabled";
>                 };
> @@ -765,6 +777,8 @@
>                         interrupts =3D <GIC_SPI 21 IRQ_TYPE_LEVEL_HIG=
H>;
>                         clocks =3D <&cpg CPG_MOD 918>;
>                         power-domains =3D <&cpg>;
> +                       dmas =3D <&dmac1 0x9d>, <&dmac1 0x9c>;

dmac0

> +                       dma-names =3D "tx", "rx";
>                         i2c-scl-internal-delay-ns =3D <6>;
>                         status =3D "disabled";
>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
