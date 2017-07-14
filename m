From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1 2/3] pinctrl: qcom: spmi-gpio: Add dtest route for
 digital input
Date: Fri, 14 Jul 2017 11:19:51 -0700
Message-ID: <20170714181951.GQ20973@minitux>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-3-fenglinw@codeaurora.org>
 <20170712212454.GK1618@tuxbook>
 <7a958ced-910f-3304-8128-911412df6dfd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7a958ced-910f-3304-8128-911412df6dfd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Fenglin Wu <fenglinw@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org

On Wed 12 Jul 22:27 PDT 2017, Fenglin Wu wrote:

> On 7/13/2017 5:24 AM, Bjorn Andersson wrote:
> > On Mon 12 Jun 23:16 PDT 2017, fenglinw@codeaurora.org wrote:
> > 
> > > From: Fenglin Wu <fenglinw@codeaurora.org>
> > > 
> > > Add property "qcom,dtest-buffer" to specify which dtest rail to feed
> > > when the pin is configured as a digital input.
> > > 
> > > Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> > > ---
> > >   .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 15 ++++++++
> > >   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           | 45 ++++++++++++++++++++++
> > >   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  6 +++
> > >   3 files changed, 66 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > index 1493c0a..521c783 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > > @@ -195,6 +195,21 @@ to specify in a pin configuration subnode:
> > >   		    Valid values are 0-3 corresponding to PMIC_GPIO_AOUT_ATESTx
> > >   		    defined in <dt-bindings/pinctrl/qcom,pmic-gpio.h>.
> > > +- qcom,dtest-buffer:
> > > +	Usage: optional
> > > +	Value type: <u32>
> > > +	Definition: Selects DTEST rail to route to GPIO when it's configured
> > > +		    as a digital input.
> > > +		    For LV/MV GPIO subtypes, the valid values are 0-3
> > > +		    corresponding to PMIC_GPIO_DIN_DTESTx defined in
> > > +		    <dt-bindings/pinctrl/qcom,pmic-gpio.h>. Only one
> > > +		    DTEST rail can be selected at a time.
> > 
> > As with the analog lines, this is a natural number and I think we should
> > encode it as such in the DeviceTree.
> > 
> > > +		    For 4CH/8CH GPIO subtypes, supported values are 1-15.
> > > +		    4 DTEST rails are supported in total and more than 1 DTEST
> > > +		    rail can be selected simultaneously. Each bit of the
> > > +		    4 LSBs represent one DTEST rail, such as [3:0] = 0101
> > > +		    means both DTEST1 and DTEST3 are selected.
> > 
> > I'm not too keen on encoding this as a bitmask. I would much rather
> > encode it as multiple values - although that complicates the
> > implementation.
> > 
> > Or can we just ignore it? (Is the lack of support in the newer chips a
> > result of no-one using this?)
> 
> I am not quite sure if any real cases would route multiple DTEST line to
> single GPIO, but the register mapping uses the bit mask for 4CH/8CH
> subtypes and I think we should support it accordingly. Even if I drop
> the support, we still have the difference of the register mapping on the
> dtest selection between MV/LV subtypes and legacy 4CH/8CH subtypes,
> which means we need a place to unify the dtest definition. I put the
> complication here in dtsi which the end user would choose the right
> value according to the hardware. I am also fine with putting the
> complication in C code, but that would drop the supporting of multiple
> DTEST lines selection for 4CH/8CH subtype.
> 

I do like when the format of DT properties is obvious, so I think the
appropriate format for multiple dtest lines would be: "qcom,dtest-buffer
= <1, 2>;"

So let's punt on the multiple dtest lines for now and just support one.
If we in the future add support for arrays of lines that would still be
backwards compatible with the single case.

Regards,
Bjorn
