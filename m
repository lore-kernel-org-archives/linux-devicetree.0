Return-Path: <vkoul@kernel.org>
Date: Tue, 26 Jun 2018 20:55:25 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: power: reset: Add qcom pon binding
Message-ID: <20180626152525.GC22377@vkoul-mobl>
References: <20180625063840.30173-1-vkoul@kernel.org>
 <20180625063840.30173-2-vkoul@kernel.org>
 <20180625172707.GA24068@rob-hp-laptop>
 <20180626035110.GD2404@vkoul-mobl>
 <CAL_JsqLsUyWCE3sR0Xe+WkTz0JGXSX9pmCvvu8Vc7HACxJLU0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLsUyWCE3sR0Xe+WkTz0JGXSX9pmCvvu8Vc7HACxJLU0Q@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 26-06-18, 08:47, Rob Herring wrote:

> > > > +-prwrkey: Specifies the subnode pwrkey and should follow the
> > >
> > > typo
> >
> >
> > Hmmm which one?
> 
> s/prwrkey/pwrkey/

Ah good spot, will fix

> > > > +           resin {
> > > > +                   compatible = "qcom,pm8941-resin";
> > >
> > > Not documented.
> >
> > qcom,pm8xxx-pwrkey.txt documents this. Subnode documentation is not
> > provided here
> 
> Is it new because it is not in any tree I see.

Sorry wrong name, it is Documented in
Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt

and I missed adding qcom,pm8941-resin, will add to this series.

Thanks
-- 
~Vinod
