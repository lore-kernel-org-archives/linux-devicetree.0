Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
 <CGME20181129155146eucas1p1518bbd1c009d340898227d3d72cbb5a1@eucas1p1.samsung.com>
 <20181129155134.19141-4-k.konieczny@partner.samsung.com>
 <154353492516.88331.1979737561234011163@swboyd.mtv.corp.google.com>
 <be16bd2d-6f71-b273-a708-3781cdd9179d@samsung.com>
Message-ID: <154403921340.88331.4342352109711551229@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: bindings: document imem clock
Date: Wed, 05 Dec 2018 11:46:53 -0800
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, k.konieczny@partner.samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Sylwester Nawrocki (2018-12-03 02:44:17)
> Hi,
> =

> On 11/30/18 00:42, Stephen Boyd wrote:
> > Quoting Kamil Konieczny (2018-11-29 07:51:32)
> >> Document imem clock bindings for SSS (Security SubSystem) and SlimSSS =
IPs.
> >>
> >> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> >> ---
> > =

> > Fix the subject of this patch please. It's not arm64: or dts:
> > =

> >>  .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.=
txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> index 50d5897c9849..4e4352bf5a0b 100644
> >> --- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
> >> @@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are=
 listed below.
> >>                        <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> >>         };
> >>  =

> >> +       cmu_imem: clock-controller@11060000 {
> >> +               compatible =3D "samsung,exynos5433-cmu-imem";
> >> +               reg =3D <0x11060000 0x1000>;
> >> +               #clock-cells =3D <1>;
> >> +
> >> +               clock-names =3D "oscclk",
> > =

> > How about just osc? clk seems redundant.
> =

> Can we keep this "oscclk" name? This patch just adds missing definition
> of one of multiple CMUs in the SoC and for the all other CMUs "oscclk"
> name has been adopted for the OSCCLK root oscillator clock. The name is =

> exactly as on the diagrams in the datasheet, just in lower case.
> To avoid confusion I would prefer to stay with same name as used for the
> other CMUs.

Ok.

> =

> >> +                       "aclk_imem_sssx_266",
> >> +                       "aclk_imem_266",
> >> +                       "aclk_imem_200";
> > =

> > And what is 'aclk'? Also redundant?
> =

> Again the names used here are exactly as in the SoC datasheet. I know we =

> could use shorted names for these consumer clocks however at this point =

> I would prefer to use same convention as for the other CMUs.
> =

> ACLK means AXI bus clock, the IMEM CMU is basically just gates that pass
> the clocks further to the SoC peripheral blocks.

Sure! Was just hoping to avoid 'clk' everywhere.
