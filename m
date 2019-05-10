From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Date: Fri, 10 May 2019 17:01:12 +0530
Message-ID: <CAHLCerMnXdPvDNpdoJNix9JMzztB+bNnENW064=qGEwhqnicFQ@mail.gmail.com>
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
 <20190507053547.GE16052@vkoul-mobl> <20190507065555.GB2085@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507065555.GB2085@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Lina Iyer <lina.iyer@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 12:25 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 06 May 22:35 PDT 2019, Vinod Koul wrote:
>
> > On 06-05-19, 21:31, Niklas Cassel wrote:
> > > Add device bindings for CPUs to suspend using PSCI as the enable-method.
> > >
> > > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > index ffedf9640af7..f9db9f3ee10c 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > > @@ -31,6 +31,7 @@
> > >                     reg = <0x100>;
> > >                     enable-method = "psci";
> > >                     next-level-cache = <&L2_0>;
> > > +                   cpu-idle-states = <&CPU_PC>;
> > >             };
> > >
> > >             CPU1: cpu@101 {
> > > @@ -39,6 +40,7 @@
> > >                     reg = <0x101>;
> > >                     enable-method = "psci";
> > >                     next-level-cache = <&L2_0>;
> > > +                   cpu-idle-states = <&CPU_PC>;
> > >             };
> > >
> > >             CPU2: cpu@102 {
> > > @@ -47,6 +49,7 @@
> > >                     reg = <0x102>;
> > >                     enable-method = "psci";
> > >                     next-level-cache = <&L2_0>;
> > > +                   cpu-idle-states = <&CPU_PC>;
> > >             };
> > >
> > >             CPU3: cpu@103 {
> > > @@ -55,12 +58,24 @@
> > >                     reg = <0x103>;
> > >                     enable-method = "psci";
> > >                     next-level-cache = <&L2_0>;
> > > +                   cpu-idle-states = <&CPU_PC>;
> > >             };
> > >
> > >             L2_0: l2-cache {
> > >                     compatible = "cache";
> > >                     cache-level = <2>;
> > >             };
> > > +
> > > +           idle-states {
> >
> > Since we are trying to sort the file per address and
> > alphabetically, it would be great if this can be moved before l2-cache
> > :)
> >
>
> Picked up, with the order adjusted.
>
> > Other than that this lgtm
> >
>
> I presume that lgtm == Reviewed-by...
>
> Thanks,
> Bjorn

Hi Bjorn,

Please drop this patch and check the one I've sent as part of the qcom
cpuidle series?

Regards,
Amit

> > > +                   CPU_PC: pc {
> > > +                           compatible = "arm,idle-state";
> > > +                           arm,psci-suspend-param = <0x40000003>;
> > > +                           entry-latency-us = <125>;
> > > +                           exit-latency-us = <180>;
> > > +                           min-residency-us = <595>;
> > > +                           local-timer-stop;
> > > +                   };
> > > +           };
> > >     };
> > >
> > >     firmware {
> > > --
> > > 2.21.0
> >
> > --
> > ~Vinod
