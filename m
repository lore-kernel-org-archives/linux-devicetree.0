From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: allwinner: h6: add r_watchog node
Date: Mon, 20 May 2019 17:19:17 +0200
Message-ID: <CAJiuCcdNmf3+xj+KE4yihZk67QV7Ds8UTjzQ6JsPp=2KLJgOZg@mail.gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-4-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190518152355.11134-4-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-watchdog@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Sat, 18 May 2019 at 17:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Allwinner H6 has a r_watchdog similar to A64.
>
> Declare it in the device-tree.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 60b47f23b2f5..27647e496269 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -632,6 +632,14 @@
>                         #reset-cells =3D <1>;
>                 };
>
> +               r_watchdog: watchdog@7020400 {
> +                       compatible =3D "allwinner,sun50i-h6-wdt",
> +                                    "allwinner,sun50i-a64-wdt",
> +                                    "allwinner,sun6i-a31-wdt";
> +                       reg =3D <0x07020400 0x20>;
> +                       interrupts =3D <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

Just want to point out that i have used the same bindings for WDT and R_WDT=
.
I think it would be better to also introduce a bindings like
"allwinner,sun50i-h6-r-wdt", "allwinner,sun6i-a31-wdt";

We don't have access to the datasheet of this IP but we can strongly
suppose that wdt and r-wdt are the same.

What do you think?

Regards,
Clement


> +               };
> +
>                 r_intc: interrupt-controller@7021000 {
>                         compatible =3D "allwinner,sun50i-h6-r-intc",
>                                      "allwinner,sun6i-a31-r-intc";
> --
> 2.17.1
>
