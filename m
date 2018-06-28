Return-Path: <vkoul@kernel.org>
Date: Thu, 28 Jun 2018 20:33:50 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v4 2/6] power: reset: qcom-pon: Add Qcom PON driver
Message-ID: <20180628150350.GW22377@vkoul-mobl>
References: <20180627115301.21330-1-vkoul@kernel.org>
 <20180627115301.21330-3-vkoul@kernel.org>
 <20180628115905.mbmjxxtl2i4ldf3w@earth.universe>
 <20180628125958.GU22377@vkoul-mobl>
 <20180628131612.a64bo773h62wld47@earth.universe>
 <20180628132754.GV22377@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628132754.GV22377@vkoul-mobl>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 28-06-18, 18:57, Vinod wrote:
> Hi Sebastian,
> 
> On 28-06-18, 15:16, Sebastian Reichel wrote:
> > On Thu, Jun 28, 2018 at 06:29:58PM +0530, Vinod wrote:
> > > > >  
> > > > > +config POWER_RESET_QCOM_PON
> > > > > +	bool "Qualcomm power-on driver"
> > > > 
> > > > tristate?
> > > 
> > > Hmmm I dont think there is a reason for this not being a module, though
> > > looking at reset driver, bunch of them seem to be inbuilt only.
> > > 
> > > Bjorn, do you think we can be module or only inbuilt?
> > 
> > Note: If the result is inbuilt only, then you should update the
> > code accordingly (drop MODULE_*, use builtin_platform_driver instead
> > of module_platform_driver, ...
> 
> Agreed, either way I will send an update shortly.

Okay discussed with Bjorn and made it tristate. Will send updated
shortly

-- 
~Vinod
