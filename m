Return-Path: <vkoul@kernel.org>
Date: Mon, 23 Jul 2018 09:24:37 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add binding document for
 Qualcomm CCI
Message-ID: <20180723035436.GV3219@vkoul-mobl>
References: <20180717125729.23045-1-vkoul@kernel.org>
 <20180717125729.23045-2-vkoul@kernel.org>
 <20180720180318.GA14573@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180720180318.GA14573@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 20-07-18, 12:03, Rob Herring wrote:
> On Tue, Jul 17, 2018 at 06:27:28PM +0530, Vinod Koul wrote:
> > From: Todor Tomov <todor.tomov@linaro.org>

> > +Required properties:
> > + - compatible: Should be one of:
> > +   - "qcom,cci-v1.0.8" for 8916;
> > +   - "qcom,cci-v1.4.0" for 8996.
> 
> It's not very convincing to use version numbers instead of normal SoC 
> part# convention when there is a 1-1 mapping.

I was under the impression that we don't have 1-1 mapping. An IP version
is found in multiple SoCs

> > + - #address-cells: Should be <1>.
> > + - #size-cells: Should be <0>.
> > + - reg: Base address of the controller and length of memory mapped region.
> > + - interrupts: Specifier for CCI interrupt.
> > + - clocks: List of clock specifiers, one for each entry in clock-names.
> > + - clock-names: Should contain:
> > +   - "mmss_mmagic_ahb" - on 8996 only;
> > +   - "camss_top_ahb";
> > +   - "cci_ahb";
> > +   - "cci";
> > +   - "camss_ahb".
> > +
> > +Required properties on 8996:
> 
> Rather than '8996', use the compatible string.

Makes sense

> > + - power-domains: Power domain specifier.
> > +
> > +Optional:
> > + - clock-frequency: Desired I2C bus clock frequency in Hz, defaults to 100 kHz
> > +   if omitted.
> 
> This is the only place that says this block is or has a I2C controller. 
> Please make that more explicit (including what ever else this block 
> does). I'm guessing there's more given how many clocks and that it has a 
> power domain.

Yes this also goes GPIO which will be added after this.

-- 
~Vinod
