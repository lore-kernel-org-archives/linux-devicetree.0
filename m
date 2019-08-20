From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/8] arm64: dts: qcom: sm8150: add base dts file
Date: Tue, 20 Aug 2019 22:07:32 +0530
Message-ID: <20190820163732.GF12733@vkoul-mobl.Dlink>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-2-vkoul@kernel.org>
 <CAHLCerOBbaOuPf+WfsG8gKzAxs+9kTMbW7k4MAkmciwyWyeQww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHLCerOBbaOuPf+WfsG8gKzAxs+9kTMbW7k4MAkmciwyWyeQww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@verdurent.com>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 20-08-19, 19:03, Amit Kucheria wrote:
> On Tue, Aug 20, 2019 at 12:14 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > This add base DTS file with cpu, psci, firmware, clock, tlmm and
> > spmi nodes which enables boot to console
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 305 +++++++++++++++++++++++++++
> >  1 file changed, 305 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > new file mode 100644
> > index 000000000000..d9dc95f851b7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> 
> This is fine.
> 
> > +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2019, Linaro Limited
> 
> These two lines should be in /* */

Yeah I made it same as previous, lets do right style.

> > +       timer {
> > +               compatible = "arm,armv8-timer";
> > +               interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
> > +                            <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
> > +                            <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
> > +                            <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
> 
> Any particular reason why these are defined in this order - 1, 2, 3, 0?

Copied from downstream :)

-- 
~Vinod
