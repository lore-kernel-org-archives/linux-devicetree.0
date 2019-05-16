From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Date: Thu, 16 May 2019 14:22:08 +0100
Message-ID: <20190516132208.GA22096@e107155-lin>
References: <20190114184255.258318-1-mka@chromium.org>
 <CAHLCerP+F9AP97+qVCMqwu-OMJXRhwZrXd33Wk-vj5eyyw-KyA@mail.gmail.com>
 <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 05:24:12PM +0530, Amit Kucheria wrote:
> On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> >
> > On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > > ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > > that describes this topology.
> >
> > This is partly true. There are two groups of gold and silver cores,
> > but AFAICT they are in a single cluster, not two separate ones. SDM845
> > is one of the early examples of ARM's Dynamiq architecture.
> >
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >
> > I noticed that this patch sneaked through for this merge window but
> > perhaps we can whip up a quick fix for -rc2?
> >
> 
> And please find attached a patch to fix this up. Andy, since this
> hasn't landed yet (can we still squash this into the original patch?),
> I couldn't add a Fixes tag.
> 
> Regards,
> Amit
> 
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 38 ++++++++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > index c27cbd3bcb0a6..f6c0d87e663f3 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > @@ -192,6 +192,44 @@
> > >                                 next-level-cache = <&L3_0>;
> > >                         };
> > >                 };
> > > +
> > > +               cpu-map {
> > > +                       cluster0 {
> > > +                               core0 {
> > > +                                       cpu = <&CPU0>;
> > > +                               };
> > > +
> > > +                               core1 {
> > > +                                       cpu = <&CPU1>;
> > > +                               };
> > > +
> > > +                               core2 {
> > > +                                       cpu = <&CPU2>;
> > > +                               };
> > > +
> > > +                               core3 {
> > > +                                       cpu = <&CPU3>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       cluster1 {
> >
> > This shouldn't exist.
> >
> > > +                               core0 {
> >
> > Rename to core4, 5, etc...
> >
> > > +                                       cpu = <&CPU4>;
> > > +                               };
> > > +
> > > +                               core1 {
> > > +                                       cpu = <&CPU5>;
> > > +                               };
> > > +
> > > +                               core2 {
> > > +                                       cpu = <&CPU6>;
> > > +                               };
> > > +
> > > +                               core3 {
> > > +                                       cpu = <&CPU7>;
> > > +                               };
> > > +                       };
> > > +               };
> > >         };
> > >
> > >         pmu {
> > > --
> > > 2.20.1.97.g81188d93c3-goog
> > >

> From 9e7d60bcabad7594a1da43982bbc9fda04669717 Mon Sep 17 00:00:00 2001
> Message-Id: <9e7d60bcabad7594a1da43982bbc9fda04669717.1557748437.git.amit.kucheria@linaro.org>
> From: Amit Kucheria <amit.kucheria@linaro.org>
> Date: Mon, 13 May 2019 17:08:33 +0530
> Subject: [PATCH] arm64: dts: sdm845: Fix up CPU topology
> 
> SDM845 implements ARM's Dynamiq architecture that allows the big and
> LITTLE cores to exist in a single cluster sharing the L3 cache.
> 
> Fix the cpu-map to put all cpus into a single cluster.
>

Thanks for noticing and fixing this. I always mentioned this should
never land in mainline when Arm suggested this as hack/workaround
but it has unfortunately.

FWIW,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep
