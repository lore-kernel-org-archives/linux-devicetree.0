Return-Path: <SRS0=H2FW=KW=linaro.org=bjorn.andersson@kernel.org>
Date: Mon, 6 Aug 2018 22:11:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20180807051125.GD21235@tuxbook-pro>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-3-vkoul@kernel.org>
 <20180806184555.GC21235@tuxbook-pro>
 <20180807043017.GF2395@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180807043017.GF2395@vkoul-mobl>
To: Vinod <vkoul@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Mon 06 Aug 21:30 PDT 2018, Vinod wrote:

> On 06-08-18, 11:45, Bjorn Andersson wrote:
> > On Mon 06 Aug 04:04 PDT 2018, Vinod Koul wrote:
> > [..]
> > > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> > [..]
[..]
> > > +struct cci {
> > > +	struct device *dev;
> > > +	void __iomem *base;
> > > +	u32 irq;
> > 
> > Use unsigned int rather than a type of specific size
> 
> Any specific reason for that preference?
> 

Just that unsigned int is the type used in the irq api.

[..]
> > 
> > > +
> > > +	ret = cci_clock_set_rate(cci->nclocks, cci->clock,
> > > +				 cci->clock_freq, dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clock);
> > 
> > It seems a little bit excessive to keep the clocks on while the driver
> > is probed, but this could be improved in a follow up patch...
> 
> okay but are they required for controller to be probed, I will check
> that part and update
> 

Right. So doing something similar to how we deal with clocks in i2c-qup
would probably make sense; we enable them during probe and then toggle
them using pm_runtime from there on.

Regards,
Bjorn
