Return-Path: <SRS0=Cfze=OJ=googlemail.com=martin.blumenstingl@kernel.org>
MIME-Version: 1.0
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
 <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com> <7hr2f25t4b.fsf@baylibre.com>
 <7h4lby5nky.fsf@baylibre.com>
In-Reply-To: <7h4lby5nky.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 30 Nov 2018 23:45:51 +0100
Message-ID: <CAFBinCCH2AOV0nJBzEdE9=rfb7d=L-Uni2gZkfdLAbLg+GkiPw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
Content-Type: text/plain; charset="UTF-8"
To: khilman@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, linux-clk@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Kevin,

On Fri, Nov 30, 2018 at 9:15 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Kevin Hilman <khilman@baylibre.com> writes:
>
> > Neil Armstrong <narmstrong@baylibre.com> writes:
> >
> >> On 28/10/2018 13:08, Martin Blumenstingl wrote:
> >>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> >>> register region called "HHI". This register area contains more
> >>> functionality than just a clock controller:
> >>> - the clock controller
> >>> - some reset controller bits
> >>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> >>> - HDMI controller
> >>>
> >>> Allow access to this HHI register area as "system controller". Also
> >>> migrate the Meson8 and Meson8b clock controllers to this new node.
> >>>
> >>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> ---
> >>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
> >>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
> >>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
> >>>  3 files changed, 23 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> >>> index 0d9faf1a51ea..ad903d1a2cb6 100644
> >>> --- a/arch/arm/boot/dts/meson.dtsi
> >>> +++ b/arch/arm/boot/dts/meson.dtsi
> >>
> >> [...]
> >>
> >>>
> >>> +&hhi {
> >>> +   clkc: clock-controller {
> >>> +           compatible = "amlogic,meson8-clkc";
> >>> +           #clock-cells = <1>;
> >>> +           #reset-cells = <1>;
> >>> +   };
> >>> +};
> >>> +
> >>>  &hwrng {
> >>>     compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
> >>>     clocks = <&clkc CLKID_RNG0>;
> >>>
> >>
> >> Kevin,
> >>
> >> I didn't apply this one, but it can wait another cycle I think.
> >
> > OK, I'll take that one through my dt branch.
> >
> > I don't see any obvious dependency on the clock patches,
>
> ... and a quick boot test shows I was wrong, and should've (re)read
> Martin's cover letter a couple more times. :)
yes, there's a hard dependency on the clock patches

> I think it's best to leave this one until the next cycle when all the
> deps are merged.
I have this on my "resend this for the next development cycle" list


Regards
Martin
