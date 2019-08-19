From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 06/22] arm64: dts: qcom: pm8150: Add Base DTS file
Date: Mon, 19 Aug 2019 22:58:59 +0530
Message-ID: <20190819172859.GI12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-7-vkoul@kernel.org>
 <20190814170309.0EF3D21721@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814170309.0EF3D21721@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:03, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:49:56)
> > Add base DTS file for pm8150 along with GPIOs
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8150.dtsi | 41 ++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> > new file mode 100644
> > index 000000000000..b533e254a203
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> > @@ -0,0 +1,41 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +// Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > +// Copyright (c) 2019, Linaro Limited
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> > +&spmi_bus {
> > +       pm8150_0: pm8150@0 {
> 
> I think node name should be 'pmic'

Yes will fix.
> 
> > +               compatible = "qcom,spmi-pmic";
> 
> This should also have the model number? "qcom,pm8150"?

Added now

> > +               reg = <0x0 SPMI_USID>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               pm8150_gpios: gpio@c000 {
> > +                       compatible = "qcom,pm8150-gpio";
> > +                       reg = <0xc000>;
> > +                       gpio-controller;
> > +                       #gpio-cells = <2>;
> > +                       interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc1 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc2 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc3 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc4 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc5 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc6 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc7 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc8 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xc9 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xca 0 IRQ_TYPE_NONE>,
> > +                                    <0 0xcb 0 IRQ_TYPE_NONE>;
> > +               };
> > +       };
> > +
> > +       qcom,pm8150@1 {
> 
> Same comment, pmic@1.

right, here and everywhere else

-- 
~Vinod
