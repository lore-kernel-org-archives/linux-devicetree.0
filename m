From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCHv3 1/4] ARM: dts: r8a7790: Reference both DMA controllers
Date: Wed, 11 May 2016 15:45:17 +0200
Message-ID: <CAMuHMdWoPThi0w6siA5LJ60oEH6JMv4x80b_Spg5aF-uHq3WqQ@mail.gmail.com>
References: <1462972438-20797-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
	<1462972438-20797-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1462972438-20797-2-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Wed, May 11, 2016 at 3:13 PM, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> R-Car Gen2 have two DMA controllers, which are equivalent. Add
> references to both dmac0 and dmac1 so the driver can choose which one=
 to
> use.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> ---
>  arch/arm/boot/dts/r8a7790.dtsi | 131 ++++++++++++++++++++++++-------=
----------
>  1 file changed, 78 insertions(+), 53 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a77=
90.dtsi
> index 83cf23c..14fcd19 100644
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi

> @@ -755,9 +773,9 @@
>                 clocks =3D <&mstp3_clks R8A7790_CLK_SCIF2>, <&zs_clk>=
,
>                          <&scif_clk>;
>                 clock-names =3D "fck", "brg_int", "scif_clk";
> -               dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>;
> -               dma-names =3D "tx", "rx";
> -               power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;

Please keep the above line.

> +               dmas =3D <&dmac0 0x2b>, <&dmac0 0x2c>,
> +                      <&dmac1 0x2b>, <&dmac1 0x2c>;
> +               dma-names =3D "tx", "rx", "tx", "rx";
>                 status =3D "disabled";
>         };

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
