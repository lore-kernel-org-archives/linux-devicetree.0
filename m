Return-Path: <vkoul@kernel.org>
Date: Mon, 30 Jul 2018 19:25:25 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v5 3/6] dt-bindings: Input: Add additional property to
 qcom pwrkey
Message-ID: <20180730135525.GA16775@vkoul-mobl>
References: <20180628150850.15358-1-vkoul@kernel.org>
 <20180628150850.15358-4-vkoul@kernel.org>
 <20180707051544.GX22377@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180707051544.GX22377@vkoul-mobl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07-07-18, 10:45, Vinod wrote:
> Hi Dmitry,
> 
> On 28-06-18, 20:38, Vinod Koul wrote:
> > Pwrkey and reset have similar properties so add additional
> > property for linux,code to use the code for sending events.
> 
> Can you please review the input patches.

Gentle reminder...

> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > index 07bf55f6e0b9..bf719396eadd 100644
> > --- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > +++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
> > @@ -32,6 +32,14 @@ PROPERTIES
> >  	Definition: presence of this property indicates that the KPDPWR_N pin
> >  		    should be configured for pull up.
> >  
> > +- linux,code:
> > +	Usage: optional
> > +	Value type: <u32>
> > +	Definition: The input key-code associated with the power key.
> > +		    Use the linux event codes defined in
> > +		    include/dt-bindings/input/linux-event-codes.h
> > +		    When property is omitted KEY_POWER is assumed.
> > +
> >  EXAMPLE
> >  
> >  	pwrkey@800 {
> > @@ -40,4 +48,5 @@ EXAMPLE
> >  		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
> >  		debounce = <15625>;
> >  		bias-pull-up;
> > +		linux,code = <KEY_POWER>;
> >  	};
> > -- 
> > 2.14.4
> 
> -- 
> ~Vinod
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
