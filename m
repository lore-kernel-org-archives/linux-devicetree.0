From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8150 pinctrl
 binding
Date: Mon, 17 Jun 2019 11:51:58 +0530
Message-ID: <20190617062158.GG2962@vkoul-mobl>
References: <20190614053032.24208-1-vkoul@kernel.org>
 <20190617042032.GE750@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617042032.GE750@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Prasad Sodagudi <psodagud@codeaurora.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Isaac J . Manjarres" <isaacm@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 16-06-19, 21:20, Bjorn Andersson wrote:
> On Thu 13 Jun 22:30 PDT 2019, Vinod Koul wrote:

> > +- reg:
> > +	Usage: required
> > +	Value type: <prop-encoded-array>
> > +	Definition: the base address and size of the north, south , west
> 
> Extra space after south.

Thanks will fix that

> > +- #gpio-cells:
> > +	Usage: required
> > +	Value type: <u32>
> > +	Definition: must be 2. Specifying the pin number and flags, as defined
> > +		    in <dt-bindings/gpio/gpio.h>
> > +
> 
> Please also document gpio-ranges and gpio-reserved-ranges.

Will add

> > +Example:
> > +
> > +	tlmm: pinctrl@3000000 {
> > +		compatible = "qcom,sm8150-pinctrl";
> > +		reg = <0x03100000 0x300000>,
> > +		      <0x03500000 0x300000>,
> > +		      <0x03900000 0x300000>,
> > +		      <0x03D00000 0x300000>;
> > +		reg-names = "west", "east", "north", "south";
> > +		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> 
> You're missing the required gpio-ranges from the example, see e.g.
> msm8996 (and please send a patch to the binding you based this on).

I ported this from downstream but did look at existing upstream
examples so will do that

-- 
~Vinod
