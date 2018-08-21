Return-Path: <vkoul@kernel.org>
Date: Tue, 21 Aug 2018 14:58:03 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180821092803.GC2388@vkoul-mobl>
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-2-vkoul@kernel.org>
 <20180820181859.GA3439@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180820181859.GA3439@bogus>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 20-08-18, 13:18, Rob Herring wrote:
> On Mon, Aug 20, 2018 at 12:09:52PM +0530, Vinod Koul wrote:

> > +PROPERTIES:
> > +
> > +- compatible:
> > +	Usage: required
> > +	Value type: <string>
> > +	Definition: must be one of:
> > +		"qcom,msm-8916-cci"
> > +		"qcom,msm-8996-cci"
> 
> I think everywhere else is 'msm8916' and 'msm8996'.

Quick grep told me that is the case, so will update.

> > +SUBNODES:
> > +
> > +The CCI provides I2C masters for one or two i2c busses, described as
> > +subdevices named "i2c-bus0" and "i2c-bus1".
> 
> Use a unit-address and reg property with 0 and 1 here.

Am not sure I understood that properly, still learning DT nuisances,
care to elaborate a bit please.

> With those fixed,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Great, thanks for the review.

-- 
~Vinod
