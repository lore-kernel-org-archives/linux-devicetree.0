From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 07/22] arm64: dts: qcom: pm8150: Add pon and rtc nodes
Date: Mon, 19 Aug 2019 23:02:37 +0530
Message-ID: <20190819173237.GJ12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-8-vkoul@kernel.org>
 <20190814170349.7E4462173E@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814170349.7E4462173E@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:03, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:49:57)
> > PM8150 PMIC contains pon and rtc devices so add nodes for these.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Squash this with the other patch?

OK

> 
> > @@ -12,6 +13,25 @@
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> >  
> > +               pon: pon@800 {
> > +                       compatible = "qcom,pm8916-pon";
> > +                       reg = <0x0800>;
> > +                       pwrkey {
> > +                               compatible = "qcom,pm8941-pwrkey";
> > +                               interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> > +                               debounce = <15625>;
> > +                               bias-pull-up;
> > +                               linux,code = <KEY_POWER>;
> 
> status = "disabled"?

will do

> 
> > +                       };
> > +               };
> > +
> > +               rtc@6000 {
> > +                       compatible = "qcom,pm8941-rtc";
> > +                       reg = <0x6000>;
> > +                       reg-names = "rtc", "alarm";
> > +                       interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> 
> status = "disabled"?

will do

-- 
~Vinod
