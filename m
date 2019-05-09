From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Date: Thu, 9 May 2019 23:19:23 +0530
Message-ID: <CAHLCerN8L4np0WAY4hTjTnPXFtTK6EH0BXWLXzB-NiRaAnvcDA@mail.gmail.com>
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
 <CAP245DXLHqU3tv5cii=Z1G4J5m=Emy7yiHP=zSTpY6GX02NKcg@mail.gmail.com> <20190508145600.GA26843@centauri>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508145600.GA26843@centauri>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, Lina Iyer <lina.iyer@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

(Adding Lorenzo and Sudeep)

On Wed, May 8, 2019 at 8:26 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> On Wed, May 08, 2019 at 02:48:19AM +0530, Amit Kucheria wrote:
> > On Tue, May 7, 2019 at 1:01 AM Niklas Cassel <niklas.cassel@linaro.org> wrote:
> > >
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
> > >                         reg = <0x100>;
> > >                         enable-method = "psci";
> > >                         next-level-cache = <&L2_0>;
> > > +                       cpu-idle-states = <&CPU_PC>;
> > >                 };
> > >
> > >                 CPU1: cpu@101 {
> > > @@ -39,6 +40,7 @@
> > >                         reg = <0x101>;
> > >                         enable-method = "psci";
> > >                         next-level-cache = <&L2_0>;
> > > +                       cpu-idle-states = <&CPU_PC>;
> > >                 };
> > >
> > >                 CPU2: cpu@102 {
> > > @@ -47,6 +49,7 @@
> > >                         reg = <0x102>;
> > >                         enable-method = "psci";
> > >                         next-level-cache = <&L2_0>;
> > > +                       cpu-idle-states = <&CPU_PC>;
> > >                 };
> > >
> > >                 CPU3: cpu@103 {
> > > @@ -55,12 +58,24 @@
> > >                         reg = <0x103>;
> > >                         enable-method = "psci";
> > >                         next-level-cache = <&L2_0>;
> > > +                       cpu-idle-states = <&CPU_PC>;
> > >                 };
> > >
> > >                 L2_0: l2-cache {
> > >                         compatible = "cache";
> > >                         cache-level = <2>;
> > >                 };
> > > +
> > > +               idle-states {
> >
> > entry-method="psci" property goes here. I have a patch fixing it for 410c ;-)
> >
> > I don't think the psci_cpuidle_ops will even get called without this.
>
> Hello Amit,
>
> I added debug prints in psci_cpu_suspend_enter() and arm_cpuidle_suspend()
> when verifying this patch, and psci_cpu_suspend_enter() is indeed called,
> with the correct psci suspend parameter.
>
> The output from:
> grep "" /sys/bus/cpu/devices/cpu0/cpuidle/state?/*
> also looks sane.
>
> However, if 'entry-method="psci"' is required according to the DT binding,
> perhaps you can send a 2/2 series that fixes both this patch and msm8916 ?

Last time I discussed this with Lorenzo and Sudeep (on IRC), I pointed
out that entry-method="psci" isn't checked for in code anywhere. Let's
get their view on this for posterity.

What does entry-method="psci" in the idle-states node achieve that
enable-method="psci" in the cpu node doesn't achieve? (Note: enable-
vs. entry-).

The enable-method property is the one that sets up the
psci_cpuidle_ops callbacks through the CPUIDLE_METHOD_OF_DECLARE
macro.

IOW, if we deprecated the entry-method property, everything would
still work, wouldn't it?
Do we expect to support PSCI platforms that might have a different
entry-method for idle states?
Should I whip up a patch removing entry-method? Since we don't check
for it today, it won't break the old DTs either.

Regards,
Amit


> > Did you see any changes in consumption with this patch? I was trying
> > to measure that before sending this out.
>
> I don't know of any way to measure the power consumption on this board,
> so no, I haven't been able to verify that the firmware actually does
> the right thing here.
>
>
> Kind regards,
> Niklas
>
> >
> > > +                       CPU_PC: pc {
> > > +                               compatible = "arm,idle-state";
> > > +                               arm,psci-suspend-param = <0x40000003>;
> > > +                               entry-latency-us = <125>;
> > > +                               exit-latency-us = <180>;
> > > +                               min-residency-us = <595>;
> > > +                               local-timer-stop;
> > > +                       };
> > > +               };
> > >         };
> > >
> > >         firmware {
> > > --
> > > 2.21.0
> > >
