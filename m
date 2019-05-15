From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCHv1 4/8] arm64: dts: qcom: msm8916: Use more generic idle
 state names
Date: Wed, 15 May 2019 15:43:19 +0530
Message-ID: <CAP245DWgfQakjXSTU2AfhkLOjAue83A-X6Qb40DC1QQj01GogQ@mail.gmail.com>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <2a0626da4d8d5a1018c351b24b63e5e0d7a45a10.1557486950.git.amit.kucheria@linaro.org>
 <20190514161220.GC1824@centauri.ideon.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190514161220.GC1824@centauri.ideon.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 14, 2019 at 9:42 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> On Fri, May 10, 2019 at 04:59:42PM +0530, Amit Kucheria wrote:
> > Instead of using Qualcomm-specific terminology, use generic node names
> > for the idle states that are easier to understand. Move the description
> > into the "idle-state-name" property.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index ded1052e5693..400b609bb3fd 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -110,7 +110,7 @@
> >                       reg = <0x0>;
> >                       next-level-cache = <&L2_0>;
> >                       enable-method = "psci";
> > -                     cpu-idle-states = <&CPU_SPC>;
> > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> >                       clocks = <&apcs>;
> >                       operating-points-v2 = <&cpu_opp_table>;
> >                       #cooling-cells = <2>;
> > @@ -122,7 +122,7 @@
> >                       reg = <0x1>;
> >                       next-level-cache = <&L2_0>;
> >                       enable-method = "psci";
> > -                     cpu-idle-states = <&CPU_SPC>;
> > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> >                       clocks = <&apcs>;
> >                       operating-points-v2 = <&cpu_opp_table>;
> >                       #cooling-cells = <2>;
> > @@ -134,7 +134,7 @@
> >                       reg = <0x2>;
> >                       next-level-cache = <&L2_0>;
> >                       enable-method = "psci";
> > -                     cpu-idle-states = <&CPU_SPC>;
> > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> >                       clocks = <&apcs>;
> >                       operating-points-v2 = <&cpu_opp_table>;
> >                       #cooling-cells = <2>;
> > @@ -146,7 +146,7 @@
> >                       reg = <0x3>;
> >                       next-level-cache = <&L2_0>;
> >                       enable-method = "psci";
> > -                     cpu-idle-states = <&CPU_SPC>;
> > +                     cpu-idle-states = <&CPU_SLEEP_0>;
> >                       clocks = <&apcs>;
> >                       operating-points-v2 = <&cpu_opp_table>;
> >                       #cooling-cells = <2>;
> > @@ -160,8 +160,9 @@
> >               idle-states {
> >                       entry-method="psci";
>
> Please add a space before and after "=".
>
> >
> > -                     CPU_SPC: spc {
> > +                     CPU_SLEEP_0: cpu-sleep-0 {
>
> While I like your idea of using power state names from
> Server Base System Architecture document (SBSA) where applicable,
> does each qcom power state have a matching state in SBSA?
>
> These are the qcom power states:
> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/Documentation/devicetree/bindings/arm/msm/lpm-levels.txt?h=msm-4.4#n53
>
> Note that qcom defines:
> "wfi", "retention", "gdhs", "pc", "fpc"
> while SBSA simply defines "idle_standby" (aka wfi), "idle_retention", "sleep".
>
> Unless you know the equivalent name for each qcom power state
> (perhaps several qcom power states are really the same SBSA state?),
> I think that you should omit the renaming from this patch series.

That is what SLEEP_0, SLEEP_1, SLEEP_2 could be used for.

IOW, all these qcom definitions are nicely represented in the
state-name and we could simply stick to SLEEP_0, SLEEP_1 for the node
names. There is wide variability in the the names of the qcom idle
states across SoC families downstream, so I'd argue against using
those for the node names.

Just for cpu states (non-wfi) I see the use of the following names
downstream across families. The C<num> seems to come from x86
world[1]:

 - C4,   standalone power collapse (spc)
 - C4,   power collapse (fpc)
 - C2D, retention
 - C3,   power collapse (pc)
 - C4,   rail power collapse (rail-pc)

[1] https://www.hardwaresecrets.com/everything-you-need-to-know-about-the-cpu-c-states-power-saving-modes/

> >                               compatible = "arm,idle-state";
> > +                             idle-state-name = "standalone-power-collapse";
> >                               arm,psci-suspend-param = <0x40000002>;
> >                               entry-latency-us = <130>;
> >                               exit-latency-us = <150>;
> > --
> > 2.17.1
> >
