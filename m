From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 10/10] arm64: dts: allwinner: h5: Add CPU Operating
 Performance Points table
Date: Wed, 30 Jan 2019 17:41:16 +0800
Message-ID: <CAGb2v64ZFZty-jeeKmPU8Ecg+rAE6zEm65tedb_ZZTTSXMEPOA@mail.gmail.com>
References: <20190130084203.25053-1-wens@csie.org> <20190130084203.25053-11-wens@csie.org>
 <20190130092927.x65ihy3je5n6324w@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190130092927.x65ihy3je5n6324w@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: linux-sunxi <linux-sunxi@googlegroups.com>, Icenowy Zheng <icenowy@aosc.io>, Andre Przywara <andre.przywara@arm.com>, Emmanuel Vadot <manu@freebsd.org>, Jagan Teki <jagan@amarulasolutions.com>, Sergey Matyukevich <geomatsi@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 5:29 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Wed, Jan 30, 2019 at 04:42:03PM +0800, Chen-Yu Tsai wrote:
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
> > +             opp@408000000 {
> > +                     opp-hz = /bits/ 64 <408000000>;
> > +                     opp-microvolt = <1000000 1000000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@648000000 {
> > +                     opp-hz = /bits/ 64 <648000000>;
> > +                     opp-microvolt = <1040000 1040000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@816000000 {
> > +                     opp-hz = /bits/ 64 <816000000>;
> > +                     opp-microvolt = <1080000 1080000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@912000000 {
> > +                     opp-hz = /bits/ 64 <912000000>;
> > +                     opp-microvolt = <1120000 1120000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@960000000 {
> > +                     opp-hz = /bits/ 64 <960000000>;
> > +                     opp-microvolt = <1160000 1160000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1008000000 {
> > +                     opp-hz = /bits/ 64 <1008000000>;
> > +                     opp-microvolt = <1200000 1200000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1056000000 {
> > +                     opp-hz = /bits/ 64 <1056000000>;
> > +                     opp-microvolt = <1240000 1240000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1104000000 {
> > +                     opp-hz = /bits/ 64 <1104000000>;
> > +                     opp-microvolt = <1260000 1260000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > +             };
> > +
> > +             opp@1152000000 {
> > +                     opp-hz = /bits/ 64 <1152000000>;
> > +                     opp-microvolt = <1300000 1300000 1310000>;
> > +                     clock-latency-ns = <244144>; /* 8 32k periods */
>
> What is the frequency and voltage that U-Boot sets up?

1008 MHz, and whatever voltage the board design defaults to (typically
the higher setting).

> We've had the issue with the A33 that it's started at 1008MHz, with
> the matching voltage, and ramping up the frequency to 1.2GHz on boards
> without PMIC support would increase the frequency but not the voltage,
> resulting in a brownout.

Which is why I added the regulator to all boards before this patch. At
least for Linux, once the regulator supply is described in the device
tree, if the driver is missing, regulator_get_* and thus cpufreq should
fail with -EPROBE_DEFER.

Or we could drop the extra OPPs.


ChenYu
