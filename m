From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 10/10] arm64: dts: allwinner: h5: Add CPU
 Operating Performance Points table
Date: Thu, 31 Jan 2019 11:28:20 +0800
Message-ID: <CAGb2v670VszWfTNK9vtoBFWAuHVVHXmwrA84YfBFLLM5XX_6xg@mail.gmail.com>
References: <20190130084203.25053-1-wens@csie.org> <20190130084203.25053-11-wens@csie.org>
 <20190130092927.x65ihy3je5n6324w@flea> <CAGb2v64ZFZty-jeeKmPU8Ecg+rAE6zEm65tedb_ZZTTSXMEPOA@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZGWZHRAKGQEU7YWNKQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v64ZFZty-jeeKmPU8Ecg+rAE6zEm65tedb_ZZTTSXMEPOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Emmanuel Vadot <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 5:41 PM Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>
> On Wed, Jan 30, 2019 at 5:29 PM Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > On Wed, Jan 30, 2019 at 04:42:03PM +0800, Chen-Yu Tsai wrote:
> > >                       enable-method = "psci";
> > >                       clocks = <&ccu CLK_CPUX>;
> > >                       clock-latency-ns = <244144>; /* 8 32k periods */
> > > +                     operating-points-v2 = <&cpu_opp_table>;
> > > +                     #cooling-cells = <2>;
> > > +             };
> > > +     };
> > > +
> > > +     cpu_opp_table: opp_table {
> > > +             compatible = "operating-points-v2";
> > > +             opp-shared;
> > > +
> > > +             opp@408000000 {
> > > +                     opp-hz = /bits/ 64 <408000000>;
> > > +                     opp-microvolt = <1000000 1000000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@648000000 {
> > > +                     opp-hz = /bits/ 64 <648000000>;
> > > +                     opp-microvolt = <1040000 1040000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@816000000 {
> > > +                     opp-hz = /bits/ 64 <816000000>;
> > > +                     opp-microvolt = <1080000 1080000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@912000000 {
> > > +                     opp-hz = /bits/ 64 <912000000>;
> > > +                     opp-microvolt = <1120000 1120000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@960000000 {
> > > +                     opp-hz = /bits/ 64 <960000000>;
> > > +                     opp-microvolt = <1160000 1160000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@1008000000 {
> > > +                     opp-hz = /bits/ 64 <1008000000>;
> > > +                     opp-microvolt = <1200000 1200000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@1056000000 {
> > > +                     opp-hz = /bits/ 64 <1056000000>;
> > > +                     opp-microvolt = <1240000 1240000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@1104000000 {
> > > +                     opp-hz = /bits/ 64 <1104000000>;
> > > +                     opp-microvolt = <1260000 1260000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> > > +             };
> > > +
> > > +             opp@1152000000 {
> > > +                     opp-hz = /bits/ 64 <1152000000>;
> > > +                     opp-microvolt = <1300000 1300000 1310000>;
> > > +                     clock-latency-ns = <244144>; /* 8 32k periods */
> >
> > What is the frequency and voltage that U-Boot sets up?
>
> 1008 MHz, and whatever voltage the board design defaults to (typically
> the higher setting).

FYI I got this wrong. U-boot's default is 816 MHz. However it seems even
this is misleading, as cpufreq in Linux reports:

    cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 792000 KHz
    cpufreq: cpufreq_online: CPU0: Unlisted initial frequency changed
to: 816000 KHz

So there seems tp be an off-by-1 error in some multiplier calculation.

>
> > We've had the issue with the A33 that it's started at 1008MHz, with
> > the matching voltage, and ramping up the frequency to 1.2GHz on boards
> > without PMIC support would increase the frequency but not the voltage,
> > resulting in a brownout.
>
> Which is why I added the regulator to all boards before this patch. At
> least for Linux, once the regulator supply is described in the device
> tree, if the driver is missing, regulator_get_* and thus cpufreq should
> fail with -EPROBE_DEFER.

I believe despite the above, this still stands. So we should be OK.
