Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181129155134.19141-4-k.konieczny@partner.samsung.com>
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
 <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
 <20181129155134.19141-4-k.konieczny@partner.samsung.com>
Message-ID: <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
Date: Thu, 29 Nov 2018 15:42:05 -0800
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Kamil Konieczny (2018-11-29 07:51:32)
> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.
> =

> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---

Fix the subject of this patch please. It's not arm64: or dts:

>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt=
 b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> index 50d5897c9849..4e4352bf5a0b 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are li=
sted below.
>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
>         };
>  =

> +       cmu_imem: clock-controller@11060000 {
> +               compatible =3D "samsung,exynos5433-cmu-imem";
> +               reg =3D <0x11060000 0x1000>;
> +               #clock-cells =3D <1>;
> +
> +               clock-names =3D "oscclk",

How about just osc? clk seems redundant.

> +                       "aclk_imem_sssx_266",
> +                       "aclk_imem_266",
> +                       "aclk_imem_200";

And what is 'aclk'? Also redundant?

> +               clocks =3D <&xxti>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> +                       <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +       };
> +
>         cmu_g2d: clock-controller@12460000 {
>                 compatible =3D "samsung,exynos5433-cmu-g2d";
>                 reg =3D <0x12460000 0x0b08>;
> -- =

> 2.19.1
>=20
