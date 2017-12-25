From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: Hi3660: Fix up psci state id
Date: Mon, 25 Dec 2017 10:22:02 +0800
Message-ID: <20171225022202.GB600@leoy-linaro>
References: <1513069954-22827-1-git-send-email-leo.yan@linaro.org>
 <CAKfTPtANDTS7PJrQcTqT0JFpbqBGbB_kz8i0f2g1akgbtBW7Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtANDTS7PJrQcTqT0JFpbqBGbB_kz8i0f2g1akgbtBW7Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

[ + John, Kevin Wang ]

On Fri, Dec 22, 2017 at 03:22:51PM +0100, Vincent Guittot wrote:
> Hi Leo,
> 
> Sorry for jumping late in the discussion but should  we also remove
> the NAP state from the property cpu-idle-states of the CPUs because
> this state not supported by the platform at least for now and may be
> not in a near future ?

Thanks for bringing up this.

I don't want to hide anything for patch discussion :) this patch is to
resolve the PSCI parameter mismatching issue between kernel and ARM-TF
and it's not used to resolve the bug for CPU_NAP, so I didn't mention
the CPU_NAP malfunction issue to avoid complex discussion context.

I want to keep CPU_NAP state and track bug for CPU_NAP fixing; if we
remove this state, I suspect we might have no chance to enable it
anymore. Finally this is up to Hisilicon colleague decision and if they
have time to fix this.

I will offline to check with Daniel and Kevin for this; and if we
finally decide to remove it we can commit extra patch for this later,
how about you think?

> Then, I have another question regarding the update of the
> psci-suspend-parameter. These changes implies an update of the psci
> firmawre which means that we will now have 2 different firmware
> version compatible with 2 different dt.
> 
> Is there any way to check that the ATF on the board is the one that
> compatible with the parameter with something like a version ? I
> currently use the previous firmware which works fine with current
> kernel and dt binding once the NAP state is removed from the table.
> When moving on recent kernel, I will have to take care of updating the
> firmware and if i need to go back on a previous kernel, i will have to
> make sure that i have the right ATF version. This make a lot of chance
> of having the wrong configuration

AFAIK, we cannot distinguish the PSCI parameter by PSCI version or
ARM-TF version number; alternatively one simple way for checking ARM-TF
is we can get commit ID (e.g. 83df7ce) from the ARM-TF log; so any
ARM-TF commit ID is newer than the patch fdae60b6ba27: "Hikey960:
Change to use recommended power state id format" should apply this
kernel patch.

NOTICE:  BL1: Booting BL31
NOTICE:  BL31: v1.4(debug):v1.4-441-g83df7ce-dirty
NOTICE:  BL31: Built : 17:31:35, Dec 22 2017

BTW, I hope we can upgrade Linux kernel and ARM-TF to latest code base
to avoid compatible issue; for Android offical releasing it uses the
old PSCI parameters with Hisilicon legacy booting images, so they can
work well, but if someone uses ARM-TF mainline code + Android kernel
4.4/4.9, there must have compatible issue.

I am monitoring the integration ARM-TF/UEFI into Android on Hikey960,
we need backport this patch onto Android kernel 4.4/4.9 ASAP after
integration ARM-TF/UEFI.

Thanks,
Leo Yan

> Regards,
> Vincent
> 
> On 12 December 2017 at 10:12, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Thanks a lot for Vincent Guittot careful work to find bug for 'CPU_NAP'
> > idle state.  From ftrace log we can observe CA73 CPUs can be easily
> > waken up from 'CPU_NAP' state but the 'waken up' CPUs doesn't handle
> > anything and sleep again; so there have tons of trace events for CA73
> > CPUs entering and exiting idle state.
> >
> > On Hi3660 CA73 has retention state 'CPU_NAP' for CPU idle, this state we
> > set its psci parameter as '0x0000001' and from this parameter it can
> > calculate state id is 1.  Unfortunately ARM trusted firmware (ARM-TF)
> > takes 1 as a invalid value for state id, so the CPU cannot enter idle
> > state and directly bail out to kernel.
> >
> > We want to create good practice for psci parameters platform definition,
> > so review the psci specification. The spec "ARM Power State Coordination
> > Interface - Platform Design Document (ARM DEN 0022D)" recommends state
> > ID in chapter "6.5 Recommended StateID Encoding".  The recommended power
> > state IDs can be presented by below listed values; and it divides into
> > three fields, every field can use 4 bits to present power states
> > corresponding to core level, cluster level and system level:
> >   0: Run
> >   1: Standby
> >   2: Retention
> >   3: Powerdown
> >
> > This commit changes psci parameter to compliance with the suggested
> > state ID in the doc.  Except we change 'CPU_NAP' state psci parameter
> > to '0x0000002', this commit also changes 'CPU_SLEEP' and 'CLUSTER_SLEEP'
> > state parameters to '0x0010003' and '0x1010033' respectively.
> >
> > Credits to Daniel, Sudeep and Soby for suggestion and consolidation.
> >
> > Cc: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> > Cc: Soby Mathew <Soby.Mathew-5wv7dgnIgG8@public.gmane.org>
> > Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > index ab0b95b..99d5a46 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > @@ -147,7 +147,7 @@
> >
> >                         CPU_NAP: cpu-nap {
> >                                 compatible = "arm,idle-state";
> > -                               arm,psci-suspend-param = <0x0000001>;
> > +                               arm,psci-suspend-param = <0x0000002>;
> >                                 entry-latency-us = <7>;
> >                                 exit-latency-us = <2>;
> >                                 min-residency-us = <15>;
> > @@ -156,7 +156,7 @@
> >                         CPU_SLEEP: cpu-sleep {
> >                                 compatible = "arm,idle-state";
> >                                 local-timer-stop;
> > -                               arm,psci-suspend-param = <0x0010000>;
> > +                               arm,psci-suspend-param = <0x0010003>;
> >                                 entry-latency-us = <40>;
> >                                 exit-latency-us = <70>;
> >                                 min-residency-us = <3000>;
> > @@ -165,7 +165,7 @@
> >                         CLUSTER_SLEEP_0: cluster-sleep-0 {
> >                                 compatible = "arm,idle-state";
> >                                 local-timer-stop;
> > -                               arm,psci-suspend-param = <0x1010000>;
> > +                               arm,psci-suspend-param = <0x1010033>;
> >                                 entry-latency-us = <500>;
> >                                 exit-latency-us = <5000>;
> >                                 min-residency-us = <20000>;
> > @@ -174,7 +174,7 @@
> >                         CLUSTER_SLEEP_1: cluster-sleep-1 {
> >                                 compatible = "arm,idle-state";
> >                                 local-timer-stop;
> > -                               arm,psci-suspend-param = <0x1010000>;
> > +                               arm,psci-suspend-param = <0x1010033>;
> >                                 entry-latency-us = <1000>;
> >                                 exit-latency-us = <5000>;
> >                                 min-residency-us = <20000>;
> > --
> > 2.7.4
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
