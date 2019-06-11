From: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: ls1028a: Fix CPU idle fail.
Date: Tue, 11 Jun 2019 12:40:42 -0500
Message-ID: <CADRPPNRa11z98Rw5cgApn-2ZFMSTGj-h73wZThmgp9w8dQD4iw@mail.gmail.com>
References: <20190517045753.3709-1-ran.wang_1@nxp.com> <20190523085104.GP9261@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190523085104.GP9261@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Ran Wang <ran.wang_1@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 3:52 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Fri, May 17, 2019 at 12:57:53PM +0800, Ran Wang wrote:
> > PSCI spec define 1st parameter's bit 16 of function CPU_SUSPEND to
> > indicate CPU State Type: 0 for standby, 1 for power down. In this
> > case, we want to select standby for CPU idle feature. But current
> > setting wrongly select power down and cause CPU SUSPEND fail every
> > time. Need this fix.
> >
> > Fixes: 8897f3255c9c ("arm64: dts: Add support for NXP LS1028A SoC")
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
>
> Leo, Bhaskar,
>
> Do you guys agree with it?

Sorry that I missed this email previously.  I agree with this change.
CPU idle should use a low power state that could be waked up by
interrupts and that should be PW20. And Ran is right that both PW20
and PH20 are actually not power down state.

- Leo

>
> Shawn
>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   18 +++++++++---------
> >  1 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index b045812..bf7f845 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -28,7 +28,7 @@
> >                       enable-method = "psci";
> >                       clocks = <&clockgen 1 0>;
> >                       next-level-cache = <&l2>;
> > -                     cpu-idle-states = <&CPU_PH20>;
> > +                     cpu-idle-states = <&CPU_PW20>;
> >               };
> >
> >               cpu1: cpu@1 {
> > @@ -38,7 +38,7 @@
> >                       enable-method = "psci";
> >                       clocks = <&clockgen 1 0>;
> >                       next-level-cache = <&l2>;
> > -                     cpu-idle-states = <&CPU_PH20>;
> > +                     cpu-idle-states = <&CPU_PW20>;
> >               };
> >
> >               l2: l2-cache {
> > @@ -53,13 +53,13 @@
> >                */
> >               entry-method = "arm,psci";
> >
> > -             CPU_PH20: cpu-ph20 {
> > -                     compatible = "arm,idle-state";
> > -                     idle-state-name = "PH20";
> > -                     arm,psci-suspend-param = <0x00010000>;
> > -                     entry-latency-us = <1000>;
> > -                     exit-latency-us = <1000>;
> > -                     min-residency-us = <3000>;
> > +             CPU_PW20: cpu-pw20 {
> > +                       compatible = "arm,idle-state";
> > +                       idle-state-name = "PW20";
> > +                       arm,psci-suspend-param = <0x0>;
> > +                       entry-latency-us = <2000>;
> > +                       exit-latency-us = <2000>;
> > +                       min-residency-us = <6000>;
> >               };
> >       };
> >
> > --
> > 1.7.1
> >
