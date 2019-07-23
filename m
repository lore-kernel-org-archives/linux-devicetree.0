From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
Date: Mon, 22 Jul 2019 22:41:36 -0700
Message-ID: <20190723054136.GK7234@tuxbook-pro>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-6-vkoul@kernel.org>
 <CAHLCerPC0thO9gsaDAxc+XaexinrzG6JGJ8BhB4bFFuQ-P9Jxg@mail.gmail.com>
 <20190723051426.GZ12733@vkoul-mobl.Dlink>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723051426.GZ12733@vkoul-mobl.Dlink>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Amit Kucheria <amit.kucheria@verdurent.com>, Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon 22 Jul 22:14 PDT 2019, Vinod Koul wrote:

> On 23-07-19, 10:38, Amit Kucheria wrote:
> > On Mon, Jul 22, 2019 at 6:06 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > Unit name is supposed to be a number, using a macro with hex value is
> > 
> > /s/name/address?
> 
> Right, will fix.
> 
> > > not recommended, so add the value in unit name.
> > >
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > index 1ebbd568dfd7..9b27b8346ba1 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > @@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
> > >  };
> > >
> > >  &pm8998_adc {
> > > -       adc-chan@ADC5_AMUX_THM1_100K_PU {
> > > +       adc-chan@4d {
> > >                 reg = <ADC5_AMUX_THM1_100K_PU>;

When I read this define I instantly know which channel we're referring
to. The 4d above is simply there for syntactical purposes and needs only
to be cared about if the reg is ever changed.

So I like this form.

> > 
> > I'm a little conflicted about this change. If we're replacing the
> > address with actual values, perhaps we should do that same for the reg
> > property to keep them in sync? Admittedly though, it is a bit easier
> > to read the macro name and figure out its meaning.
> 
> Well this was how Bjorn suggested, am okay if we do in any
> other way. This fixes warning but keeps it bit readable too
> 
> Other way would be to make defines decimal values instead of hex
> 

While the ePAPRR states that the unit address must match the first reg,
dtc enforces that the unit address string matches "%x" of the reg.

Regards,
Bjorn

> Any better suggestions :)
> 
> -- 
> ~Vinod
