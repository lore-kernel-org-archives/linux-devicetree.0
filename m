From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2] dts: arm64: add CoreSight trace support for hi3660
Date: Mon, 4 Mar 2019 10:18:40 -0700
Message-ID: <CANLsYkzakXjuMR+=ncVpcohE8n-uF60Qa6EAN+Xh=FKBoJtrgg@mail.gmail.com>
References: <6496F4728C09F6479CFF21A8E67D33D568F32660@dggema525-mbx.china.huawei.com>
 <20190302125955.GA11385@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302125955.GA11385@leoy-ThinkPad-X240s>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Shiwanglai <shiwanglai@hisilicon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "xuwei (O)" <xuwei5@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, "Suzuki K. Poulose" <Suzuki.Poulose@arm.com>
List-Id: devicetree@vger.kernel.org

On Sat, 2 Mar 2019 at 06:00, Leo Yan <leo.yan@linaro.org> wrote:
>
> On Sat, Mar 02, 2019 at 09:45:22AM +0000, Shiwanglai wrote:
>
> [...]
>
> > > +           /* Top internals */
> > > +           funnel@ec031000 {
> > > +                   compatible = "arm,coresight-funnel", "arm,primecell";
> > > +                   reg = <0 0xec031000 0 0x1000>;
> > > +                   clocks = <&crg_ctrl HI3660_PCLK>;
> > > +                   clock-names = "apb_pclk";
> > > +
> > > +                   out-ports {
> > > +                           port {
> > > +                                   top_funnel_out: endpoint {
> > > +                                           remote-endpoint =
> > > +                                                   <&top_etf_in>;
> > > +                                   };
> > > +                           };
> > > +                   };
> > > +
> > > +                   in-ports {
> > > +                           #address-cells = <1>;
> > > +                           #size-cells = <0>;
> > > +
> > > +                           port@0 {
> > > +                                   reg = <0>;
> > > +                                   top_funnel_in0: endpoint {
> > > +                                           remote-endpoint =
> > > +                                                   <&cluster0_etf_out>;
> > > +                                   };
> > > +                           };
> > > +
> > > +                           port@1 {
> > > +                                   reg = <0>;
> >
> > Here should s/<0>/<1>; otherwise DTC will complain warning for mismatching between 'port@1' and 'reg = <0>'.
>
> > -- if reg set to 1, then there's no data output from cluster 1 to top.
>
> Thanks for the info, Wanglai.  Now I see why write as it is.
>
> I can confirm if directly use your patch with perf with mainline
> kernel I can capture CoreSight trace data successfully on Hikey960
> board.
>
> But since this DT binding will introduce DTC warning, I personally
> think we can improve for this with below method:
>
> We can create a funnel node named "funnel_combo", and we don't need to
> specify register address range for it; and cluster 0 and cluster 1 will
> output to "funnel_combo" and "funnel_combo" will output to the top
> funnel.  Thus the DT binding will write as below.
>
> To support for a funnel without any register address range (we have
> support replicator like this mode), we also need to extend the driver
> drivers/hwtracing/coresight/coresight-funnel.c.
>
> Mathieu, Mike, Suzuki, could you help confirm this is the right
> direction we should move forward to?

Leo, thanks for testing this out.  Shiwanglai, please add Suzuki and
myself to future revision of this set - this will help you getting a
timely response for your work.

As Leo pointed out we already have support for replicators that don't
have a register map and the same thing should be done in this case.
But contrary to what was done for replicators, I think we should keep
the drivers in the same file as Russell did here[1].  That way we can
keep all things funnel at the same place and reduce the amount of
kernel configuration options.

Regards,
Mathieu

[1]. https://elixir.bootlin.com/linux/latest/source/drivers/tty/serial/amba-pl011.c#L2819

>
> ---8<---
>         /* An invisible combo funnel between clusters and top funnel */
>         funnel_combo {
>                 compatible = "arm,coresight-funnel";
>                 clocks = <&crg_ctrl HI3660_PCLK>;
>                 clock-names = "apb_pclk";
>
>                 out-ports {
>                         port {
>                                 combo_funnel_out: endpoint {
>                                         remote-endpoint =
>                                                 <&top_funnel_in>;
>                                 };
>                         };
>                 };
>
>                 in-ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         port@0 {
>                                 reg = <0>;
>                                 combo_funnel_in0: endpoint {
>                                         remote-endpoint =
>                                                 <&cluster0_etf_out>;
>                                 };
>                         };
>
>                         port@1 {
>                                 reg = <1>;
>                                 combo_funnel_in1: endpoint {
>                                         remote-endpoint =
>                                                 <&cluster1_etf_out>;
>                                 };
>                         };
>                 };
>         };
>
>         /* Top internals */
>         funnel@ec031000 {
>                 compatible = "arm,coresight-funnel", "arm,primecell";
>                 reg = <0 0xec031000 0 0x1000>;
>                 clocks = <&crg_ctrl HI3660_PCLK>;
>                 clock-names = "apb_pclk";
>
>                 out-ports {
>                         port {
>                                 top_funnel_out: endpoint {
>                                         remote-endpoint =
>                                                 <&top_etf_in>;
>                                 };
>                         };
>                 };
>
>                 in-ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         port@0 {
>                                 reg = <0>;
>                                 top_funnel_in: endpoint {
>                                         remote-endpoint =
>                                                 <&combo_funnel_out>;
>                                 };
>                         };
>                 };
>         };
>
> --->8---
>
> [...]
>
> Thanks,
> Leo Yan
