Return-Path: <robherring2@gmail.com>
Date: Tue, 7 Aug 2018 11:39:13 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: Add binding for Qualcomm CCI
 I2C controller
Message-ID: <20180807173913.GA1567@rob-hp-laptop>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-2-vkoul@kernel.org>
 <20180806180337.GB21235@tuxbook-pro>
 <20180807041826.GE2395@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180807041826.GE2395@vkoul-mobl>
To: Vinod <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 07, 2018 at 09:48:26AM +0530, Vinod wrote:
> On 06-08-18, 11:03, Bjorn Andersson wrote:
> > On Mon 06 Aug 04:04 PDT 2018, Vinod Koul wrote:
> > 
> > > From: Todor Tomov <todor.tomov@linaro.org>
> > > 
> > > Add DT binding document for Qualcomm Camera Control Interface (CCI)
> > > I2C controller.
> > > 
> > > Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 55 ++++++++++++++++++++++
> > >  1 file changed, 55 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> > > new file mode 100644
> > > index 000000000000..977978dd4444
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> > > @@ -0,0 +1,55 @@
> > > +Qualcomm Camera Control Interface (CCI) I2C controller
> > > +
> > > +Required properties:
> > > + - compatible: Should be one of:
> > > +   - "qcom,cci-v1.0.8" for 8916;
> > > +   - "qcom,cci-v1.4.0" for 8996.
> > 
> > As pointed out by Rob previously we should either use version numbers or
> > platform numbers, not both.

Not really what I said...

> > 
> > So this should either be:
> > 
> > 	- "qcom,cci-v1.0.8"
> > 	- "qcom,cci-v1.4.0"
> 
> ok will use this one..
> 
> > 
> > or:
> > 
> > 	- "qcom,msm8916-cci"
> > 	- "qcom,msm8996-cci"

I strongly prefer this one as I've yet to be convinced there is a strong 
benefit of version numbers and every other binding follows this 
convention.

Rob
