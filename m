Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190905215532.8357-1-tony@atomide.com>
References: <20190905215532.8357-1-tony@atomide.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix hidden dependency to node name with reg-names
Date: Fri, 06 Sep 2019 20:55:18 -0700
Message-Id: <20190907035518.EB40C208C3@mail.kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Tony Lindgren (2019-09-05 14:55:32)
> We currently have a hidden dependency to the device tree node name for
> the clkctrl clocks. Instead of using standard node name like "clock", we
> must use "l4-per-clkctrl" naming so the clock driver can find the

The node name is "clk" though.

> associated clock domain. Further, if "clk" is specified for a clock node
> name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> logic with earlier naming for the clock node name.
>=20
> If the clock node naming dependency is not understood, the related
> clockdomain is not found, or a wrong one can get used if a clock manager
> instance has multiple domains.
>=20
> As each clkctrl instance represents a single clock domain with it's
> reg property describing the clocks available in that clock domain,
> we can simply use "reg-names" property for the clock domain.
>=20
> This simplifies things and removes the hidden dependency to the node
> name. And then later on, we should be able to drop the related code
> for parsing the node names.
>=20
> Let's also update the binding to use standard "clock" node naming
> instead of "clk".
>=20
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/clock/ti-clkctrl.txt |  6 +++++-
>  drivers/clk/ti/clkctrl.c                               | 10 ++++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt b/Doc=
umentation/devicetree/bindings/clock/ti-clkctrl.txt
> --- a/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> +++ b/Documentation/devicetree/bindings/clock/ti-clkctrl.txt
> @@ -20,15 +20,19 @@ Required properties :
>  - #clock-cells : shall contain 2 with the first entry being the instance
>                  offset from the clock domain base and the second being t=
he
>                  clock index
> +- reg : clock registers
> +- reg-names : clock register names for the clock, should be same as the
> +             domain name

Is this necessary? I'd rather see that the names of the clks don't
actually matter by means of connecting the clk tree through the "clocks"
property when the parent clks are provided by external nodes and through
direct pointers when they're within a controller. If that works then it
should be possible to ignore this name in general?

> =20
>  Example: Clock controller node on omap 4430:
> =20
>  &cm2 {
>         l4per: cm@1400 {
>                 cm_l4per@0 {
> -                       cm_l4per_clkctrl: clk@20 {
> +                       cm_l4per_clkctrl: clock@20 {
>                                 compatible =3D "ti,clkctrl";
>                                 reg =3D <0x20 0x1b0>;
> +                               reg-names =3D "l4_per";
>                                 #clock-cells =3D <2>;
>                         };
>                 };
