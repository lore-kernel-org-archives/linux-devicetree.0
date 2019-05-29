From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: [PATCH] arm64: dts: allwinner: Add GPU operating points for H6
Date: Wed, 29 May 2019 17:42:12 +0200
Message-ID: <CAAObsKCWJmx-TKyiHFvUaDtGOpz8SXNOBFK3AbmUWW7KprD2Rw@mail.gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com> <20190529153255.40038-1-tomeu.vizoso@collabora.com>
 <CAJiuCccFG1SATp7QuSOi11MmbjmgX0ZHsTv=4zuXqXMG+=-7Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiuCccFG1SATp7QuSOi11MmbjmgX0ZHsTv=4zuXqXMG+=-7Dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 May 2019 at 17:37, Clément Péron <peron.clem@gmail.com> wrote:
>
> Hi Tomeu,
>
> On Wed, 29 May 2019 at 17:33, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> >
> > The GPU driver needs them to change the clock frequency and regulator
> > voltage depending on the load.
>
> As requested by Maxime, I have dropped these OPP table as It's taken
> from vendor and untested with Panfrost.
>
> https://lore.kernel.org/patchwork/patch/1060374/

Ok, guess this series should wait then until we can run Panfrost on it
and check how DVFS is working.

Thanks,

Tomeu

> Regards,
> Clément
>
> >
> > Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > Cc: Clément Péron <peron.clem@gmail.com>
> >
> > ---
> >
> > Feel free to pick up this patch if you are going to keep pushing this
> > series forward.
> >
> > Thanks,
> >
> > Tomeu
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 66 ++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > index 6aad06095c40..decf7b56e2df 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -157,6 +157,71 @@
> >                         allwinner,sram = <&ve_sram 1>;
> >                 };
> >
> > +               gpu_opp_table: opp-table2 {
> > +                       compatible = "operating-points-v2";
> > +
> > +                       opp00 {
> > +                               opp-hz = /bits/ 64 <756000000>;
> > +                               opp-microvolt = <1040000>;
> > +                       };
> > +                       opp01 {
> > +                               opp-hz = /bits/ 64 <624000000>;
> > +                               opp-microvolt = <950000>;
> > +                       };
> > +                       opp02 {
> > +                               opp-hz = /bits/ 64 <576000000>;
> > +                               opp-microvolt = <930000>;
> > +                       };
> > +                       opp03 {
> > +                               opp-hz = /bits/ 64 <540000000>;
> > +                               opp-microvolt = <910000>;
> > +                       };
> > +                       opp04 {
> > +                               opp-hz = /bits/ 64 <504000000>;
> > +                               opp-microvolt = <890000>;
> > +                       };
> > +                       opp05 {
> > +                               opp-hz = /bits/ 64 <456000000>;
> > +                               opp-microvolt = <870000>;
> > +                       };
> > +                       opp06 {
> > +                               opp-hz = /bits/ 64 <432000000>;
> > +                               opp-microvolt = <860000>;
> > +                       };
> > +                       opp07 {
> > +                               opp-hz = /bits/ 64 <420000000>;
> > +                               opp-microvolt = <850000>;
> > +                       };
> > +                       opp08 {
> > +                               opp-hz = /bits/ 64 <408000000>;
> > +                               opp-microvolt = <840000>;
> > +                       };
> > +                       opp09 {
> > +                               opp-hz = /bits/ 64 <384000000>;
> > +                               opp-microvolt = <830000>;
> > +                       };
> > +                       opp10 {
> > +                               opp-hz = /bits/ 64 <360000000>;
> > +                               opp-microvolt = <820000>;
> > +                       };
> > +                       opp11 {
> > +                               opp-hz = /bits/ 64 <336000000>;
> > +                               opp-microvolt = <810000>;
> > +                       };
> > +                       opp12 {
> > +                               opp-hz = /bits/ 64 <312000000>;
> > +                               opp-microvolt = <810000>;
> > +                       };
> > +                       opp13 {
> > +                               opp-hz = /bits/ 64 <264000000>;
> > +                               opp-microvolt = <810000>;
> > +                       };
> > +                       opp14 {
> > +                               opp-hz = /bits/ 64 <216000000>;
> > +                               opp-microvolt = <810000>;
> > +                       };
> > +               };
> > +
> >                 gpu: gpu@1800000 {
> >                         compatible = "allwinner,sun50i-h6-mali",
> >                                      "arm,mali-t720";
> > @@ -168,6 +233,7 @@
> >                         clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
> >                         clock-names = "core", "bus";
> >                         resets = <&ccu RST_BUS_GPU>;
> > +                       operating-points-v2 = <&gpu_opp_table>;
> >                         status = "disabled";
> >                 };
> >
> > --
> > 2.20.1
> >
