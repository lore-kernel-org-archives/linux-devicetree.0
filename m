Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190823100315.2148-1-ada@thorsis.com>
References: <20190823100315.2148-1-ada@thorsis.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
Date: Wed, 11 Sep 2019 09:06:47 -0700
Message-Id: <20190911160648.6F88D2075C@mail.kernel.org>
To: Alexander Dahl <ada@thorsis.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: u.kleine-koenig@pengutronix.de, kernel@pengutronix.de, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Alexander Dahl (2019-08-23 03:03:15)
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

You need to Cc Rob and devicetree list on binding changes.

>=20
> Notes:
>     v2:
>         Add additional explaining text to following paragraph and strip m=
ail
>         headers from commit message.
>=20
>  .../devicetree/bindings/clock/clock-bindings.txt     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b=
/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index b646bbcf7f92..1d4942380918 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed b=
y any non-zero entry.
>          compatible =3D "fsl,imx-uart";
>          reg =3D <0xa000 0x1000>;
>          ...
> -        clocks =3D <&osc 0>, <&pll 1>;
> -        clock-names =3D "baud", "register";
> +        clocks =3D ...
> +        clock-names =3D ...

I don't see the need for this change.

> =20
>          assigned-clocks =3D <&clkcon 0>, <&pll 2>;
> -        assigned-clock-parents =3D <&pll 2>;
> +        assigned-clock-parents =3D <&pll 1>;
>          assigned-clock-rates =3D <0>, <460800>;
>      };
> =20
> -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0>=
 and
> -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> +In this example the <&pll 1> clock is set as parent of clock <&clkcon 0>=
 and
> +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
> +setting for <&pll 2> is omitted (end of list) and rate setting for <&clk=
con 0>
> +is skipped because set to <0>.

Maybe you can comment that the "clocks" and "clock-names" properties
don't matter for assigned clk rates and parents.
