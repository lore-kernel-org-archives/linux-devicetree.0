From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h6: Add CPU Operating
 Performance Points table
Date: Thu, 14 Feb 2019 22:52:16 +0800
Message-ID: <CAEExFWuxrVC1J0g93R3ifaDxOGy-20B4jftoHw932V7+wqhtxw@mail.gmail.com>
References: <20190214130910.9201-1-tiny.windzz@gmail.com> <20190214130910.9201-5-tiny.windzz@gmail.com>
 <20190214143842.nqsh6trwdjxq2ecd@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214143842.nqsh6trwdjxq2ecd@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, robh+dt@kernel.org, mark.rutland@arm.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 10:38 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Thu, Feb 14, 2019 at 08:09:10AM -0500, Yangtao Li wrote:
> > Add an OPP (Operating Performance Points) table for the CPU cores to
> > enable DVFS (Dynamic Voltage & Frequency Scaling) on the H6. This
> > information comes from github.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 61 ++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > index 57a1390ecdc2..46a4a69eb38f 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -28,6 +28,8 @@
> >                       enable-method = "psci";
> >                       clocks = <&ccu CLK_CPUX>;
> >                       clock-latency-ns = <244144>; /* 8 32k periods */
> > +                     operating-points-v2 = <&cpu_opp_table>;
> > +                     #cooling-cells = <2>;
> >               };
> >
> >               cpu1: cpu@1 {
> > @@ -37,6 +39,8 @@
> >                       enable-method = "psci";
> >                       clocks = <&ccu CLK_CPUX>;
> >                       clock-latency-ns = <244144>; /* 8 32k periods */
> > +                     operating-points-v2 = <&cpu_opp_table>;
> > +                     #cooling-cells = <2>;
> >               };
> >
> >               cpu2: cpu@2 {
> > @@ -46,6 +50,8 @@
> >                       enable-method = "psci";
> >                       clocks = <&ccu CLK_CPUX>;
> >                       clock-latency-ns = <244144>; /* 8 32k periods */
> > +                     operating-points-v2 = <&cpu_opp_table>;
> > +                     #cooling-cells = <2>;
> >               };
> >
> >               cpu3: cpu@3 {
> > @@ -55,6 +61,61 @@
> >                       enable-method = "psci";
> >                       clocks = <&ccu CLK_CPUX>;
> >                       clock-latency-ns = <244144>; /* 8 32k periods */
> > +                     operating-points-v2 = <&cpu_opp_table>;
> > +                     #cooling-cells = <2>;
> > +             };
> > +     };
> > +
> > +     cpu_opp_table: opp_table {
> > +             compatible = "operating-points-v2";
> > +             opp-shared;
> > +
> > +             opp@480000000 {
> > +                     opp-hz = /bits/ 64 <480000000>;
> > +                     opp-microvolt = <800000 800000 880000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@720000000 {
> > +                     opp-hz = /bits/ 64 <720000000>;
> > +                     opp-microvolt = <800000 800000 880000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@816000000 {
> > +                     opp-hz = /bits/ 64 <816000000>;
> > +                     opp-microvolt = <800000 800000 880000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@888000000 {
> > +                     opp-hz = /bits/ 64 <888000000>;
> > +                     opp-microvolt = <800000 800000 940000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1080000000 {
> > +                     opp-hz = /bits/ 64 <1080000000>;
> > +                     opp-microvolt = <840000 840000 1060000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1320000000 {
> > +                     opp-hz = /bits/ 64 <1320000000>;
> > +                     opp-microvolt = <900000 900000 1160000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1488000000 {
> > +                     opp-hz = /bits/ 64 <1488000000>;
> > +                     opp-microvolt = <960000 960000 1160000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1800000000 {
> > +                     opp-hz = /bits/ 64 <1800000000>;
> > +                     opp-microvolt = <1060000 1060000 1160000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
>
> So we definitely want to have that tested, especially since cpufreq
> can lead to all kind of hard to debug errors (brown-outs, CPU lockups,
> cache corruption, etc.). I good way to test that would be to use
> cpufreq-ljt-stress-test here:
> https://github.com/ssvb/cpuburn-arm/blob/master/cpufreq-ljt-stress-test
>
> I'm especially worried about the higher frequencies that will probably
> make the SoC heat too much
Indeed, in order to avoid this situation, it is best to have cpu cooling
support(But now it does not support thermal driver? ).


In this case, perhaps we should remove the frequency beyond a certain
range to avoid the CPU being too hot?

Yangtao
>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
