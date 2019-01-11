From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1 6/7] arm64: dts: sdm845: Increase alert trip point to
 95 degrees
Date: Fri, 11 Jan 2019 15:54:23 +0530
Message-ID: <CAHLCerPN3dxd=XBEkU2cMacFDkZjNhXEw7BDYNTEyfSUszSUzg@mail.gmail.com>
References: <cover.1547078153.git.amit.kucheria@linaro.org>
 <041258d65883df964890249a24d2a4788c419304.1547078153.git.amit.kucheria@linaro.org>
 <20190110011533.GV261387@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110011533.GV261387@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Andy Gross <andy.gross@linaro.org>, Taniya Das <tdas@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 6:45 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Amit,
>
> On Thu, Jan 10, 2019 at 05:30:55AM +0530, Amit Kucheria wrote:
> > 75 degrees is too aggressive for throttling the CPU. After speaking to
> > Qualcomm engineers, increase it to 95 degrees.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index c27cbd3bcb0a..29e823b0caf4 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -1692,7 +1692,7 @@
> >
> >                       trips {
> >                               cpu_alert0: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1713,7 +1713,7 @@
> >
> >                       trips {
> >                               cpu_alert1: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1734,7 +1734,7 @@
> >
> >                       trips {
> >                               cpu_alert2: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1755,7 +1755,7 @@
> >
> >                       trips {
> >                               cpu_alert3: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1776,7 +1776,7 @@
> >
> >                       trips {
> >                               cpu_alert4: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1797,7 +1797,7 @@
> >
> >                       trips {
> >                               cpu_alert5: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1818,7 +1818,7 @@
> >
> >                       trips {
> >                               cpu_alert6: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
> > @@ -1839,7 +1839,7 @@
> >
> >                       trips {
> >                               cpu_alert7: trip0 {
> > -                                     temperature = <75000>;
> > +                                     temperature = <95000>;
> >                                       hysteresis = <2000>;
> >                                       type = "passive";
> >                               };
>
> The change itself looks good to me, however I wonder if it would be
> worth to eliminate redundancy and merge the current 8 thermal zones
> into 2, one for the Silver and one for the Gold cluster (as done by
> http://crrev.com/c/1381752). There is a single cooling device for
> each cluster, so it's not clear to me if there is any gain from having
> a separate thermal zone for each CPU. If it is important to monitor
> the temperatures of the individual cores this can still be done by
> configuring the thermal zone of the cluster with multiple thermal
> sensors.

Reducing the number of thermal zones to 2 (by grouping 4 sensors per
zone) is not possible due a limitation of the thermal framework[1]. It
is something that we want to address. Previous attempts to fix this
were rejected for various reasons. Eduardo was going to share a way to
have more flexible mapping between sensors and zones after discussions
at LPC.

<nag> Eduardo, do you have anything we can review? </nag> :-)

Having said that, we'll need some aggregation functions when we add
multiple sensors to a zone (e.g. max, mean) to reflect the zone. This
will lose information about hotspots and prevent things like idle
injection on a particular CPU that is causing most of the heat in the
aggregated zone. So IMHO, it might be useful to have information about
the hotspots (i.e TZ per sensor) and aggregated values (ambient
temperature) that can be fed to the thermal policy.


[1] https://elixir.bootlin.com/linux/v5.0-rc1/source/drivers/thermal/of-thermal.c#L502
