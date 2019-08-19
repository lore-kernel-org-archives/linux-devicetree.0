From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 17/22] arm64: dts: qcom: sm8150: Add apss_shared and
 apps_rsc nodes
Date: Mon, 19 Aug 2019 23:05:14 +0530
Message-ID: <20190819173513.GK12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-18-vkoul@kernel.org>
 <20190814171235.6BE1721721@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814171235.6BE1721721@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:12, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:50:07)
> > Add apss_shared and apps_rsc node including the rpmhcc child node
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Can't this be squashed with the original dtsi file?

That makes it a huge blob, imo hard to review. I will still go ahead and
squash things in v2, but will still keep logical chunks.. (this can go
in original though)

> 
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 30 ++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 5c6b103b042b..5258b79676f6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -4,6 +4,7 @@
> >  
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> > +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> 
> But not the rpmh clk bindings?

Thats missing will add

> 
> > @@ -272,6 +279,29 @@
> >                         };
> >                 };
> >  
> > +               apps_rsc: rsc@18200000 {
> > +                       label = "apps_rsc";
> > +                       compatible = "qcom,rpmh-rsc";
> > +                       reg = <0x18200000 0x10000>,
> > +                             <0x18210000 0x10000>,
> > +                             <0x18220000 0x10000>;
> > +                       reg-names = "drv-0", "drv-1", "drv-2";
> > +                       interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +                       qcom,tcs-offset = <0xd00>;
> > +                       qcom,drv-id = <2>;
> > +                       qcom,tcs-config = <ACTIVE_TCS  2>,
> > +                                         <SLEEP_TCS   1>,
> > +                                         <WAKE_TCS    1>,
> > +                                         <CONTROL_TCS 0>;
> > +
> > +                       rpmhcc: clock-controller {
> > +                               compatible = "qcom,sm8150-rpmh-clk";
> > +                               #clock-cells = <1>;
> 
> Should take some sort of clocks property to get the board clock for XO?

Yes after conversion, I have updated this now

-- 
~Vinod
