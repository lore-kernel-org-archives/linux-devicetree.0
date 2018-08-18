Return-Path: <vkoul@kernel.org>
Date: Sat, 18 Aug 2018 10:15:58 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: Add Qualcomm CCI I2C driver
Message-ID: <20180818044558.GH3687@vkoul-mobl>
References: <20180806110416.4288-1-vkoul@kernel.org>
 <20180806110416.4288-3-vkoul@kernel.org>
 <20180806184555.GC21235@tuxbook-pro>
 <20180807043017.GF2395@vkoul-mobl>
 <20180817124141.GF3687@vkoul-mobl>
 <20180817183301.GA2926@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180817183301.GA2926@tuxbook-pro>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 17-08-18, 11:33, Bjorn Andersson wrote:
> On Fri 17 Aug 05:41 PDT 2018, Vinod wrote:
> 
> > On 07-08-18, 10:00, Vinod wrote:
> > > On 06-08-18, 11:45, Bjorn Andersson wrote:
> > 
> > > > The dt binding mentions that a power domain is required for v1.4, but
> > > > there's no support for this in the driver.
> > > 
> > > I will check that, yes it is not handled in the driver we have
> > 
> > So I discussed this with Todor and found that __genpd_dev_pm_attach in
> > drivers/base/power/domain.c handles the "power-domain" binding.
> > 
> > I do not think driver needs to do anything here, this seems handled in
> > core and we need to provide binding, FWIW, the 8996 doesn't work without
> > this
> > 
> 
> Right, the power-domain will be picked up and afaict will be turned on
> as it's attached to the device during probe of the platform driver. So
> you don't need to do anything additionally to make it work.
> 
> But I suggest that you follow up with a patch adding runtime pm support
> so that the associated power domain will be disabled when the bus is not
> in use.

Agreed, have already started on that.

-- 
~Vinod
