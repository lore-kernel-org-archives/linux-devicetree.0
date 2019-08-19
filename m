From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 18/22] arm64: dts: qcom: sm8150: Add reserved-memory
 regions
Date: Mon, 19 Aug 2019 23:06:35 +0530
Message-ID: <20190819173635.GL12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-19-vkoul@kernel.org>
 <20190814171320.2F7162063F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814171320.2F7162063F@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:13, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:50:08)
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 5258b79676f6..7111e1f092f4 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -153,6 +153,117 @@
> >                 method = "smc";
> >         };
> >  
> > +       reserved_memory: reserved-memory {
> 
> Does this need a label?

will remove

> 
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               hyp_mem: memory@85700000 {
> > +                       reg = <0x0 0x85700000 0x0 0x600000>;
> > +                       no-map;

-- 
~Vinod
