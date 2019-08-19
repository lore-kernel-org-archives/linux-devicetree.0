From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 03/22] arm64: dts: qcom: sm8150: add tlmm node
Date: Mon, 19 Aug 2019 22:39:15 +0530
Message-ID: <20190819170915.GH12733@vkoul-mobl.Dlink>
References: <20190814125012.8700-1-vkoul@kernel.org>
 <20190814125012.8700-4-vkoul@kernel.org>
 <20190814170105.027C42063F@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814170105.027C42063F@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 14-08-19, 10:01, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-14 05:49:53)
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Add some commit text? Or just squash with the first patch? Not sure why
> it's a different commit.
> 
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index cd9fcadaeacb..5f2f21270e2d 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -189,6 +189,21 @@
> >                         };
> >                 };
> >  
> > +               tlmm: pinctrl@3100000 {
> > +                       compatible = "qcom,sm8150-pinctrl";
> > +                       reg = <0x03100000 0x300000>,
> > +                             <0x03500000 0x300000>,
> > +                             <0x03900000 0x300000>,
> > +                             <0x03D00000 0x300000>;
> 
> Please don't use capitalized hex characters.

Sure, this seems to be only instance where this crept in. Fixed now

-- 
~Vinod
