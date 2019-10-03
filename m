From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date: Thu, 3 Oct 2019 10:16:46 +0300
Message-ID: <20191003071646.GZ896@valkosipuli.retiisi.org.uk>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
 <20191002103715.GR896@valkosipuli.retiisi.org.uk>
 <20191003053338.GA7868@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191003053338.GA7868@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Thu, Oct 03, 2019 at 11:03:38AM +0530, Manivannan Sadhasivam wrote:
....
> > > > > +static int imx290_set_gain(struct imx290 *imx290, u32 value)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	u32 adjusted_value = (value * 10) / 3;
> > > > 
> > > > What's the purpose of this? Why not to use the value directly?
> > > > 
> > > 
> > > The gain register accepts the value 10/3 of the actual gain required. Hence,
> > > we need to manually do the calculation before updating the value. I can
> > > add a comment here to clarify.
> > 
> > It's better to use the register value directly. Otherwise the granularity
> > won't be available to the user space.
> > 
> 
> The sensor datasheet clearly defines that the 10/3'rd of the expected gain
> should be set to this register. So, IMO we should be setting the value as

The unit of that gain is decibels, but the controls do not have a unit.
Register value is really preferred here.

> mentioned in the datasheet. I agree that we are missing the userspace
> granularity here but sticking to the device limitation shouldn't be a problem.
> As I said, I'll add a comment here to clarify.

The comment isn't visible in the uAPI.

> 
> > > 
> > > > > +
> > > > > +	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, adjusted_value);
> > > > > +	if (ret)
> > > > > +		dev_err(imx290->dev, "Unable to write gain\n");
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int imx290_set_power_on(struct imx290 *imx290)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = clk_prepare_enable(imx290->xclk);
> > > > 
> > > > Please move the code from this function to the runtime PM runtime suspend
> > > > callback. The same for imx290_set_power_off().
> > > > 
> > > 
> > > May I know why? I think since this is being used only once, you're suggesting
> > > to move to the callback function itself but please see the comment below. I
> > > will reuse this function to power on the device during probe.
> > 
> > Yes, you can call the same function from probe, even if it's used as a
> > runtime PM callback.
> > 
> > There's no need to have a function that acts as a wrapper for calling it
> > with a different type of an argument.
> > 
> 
> You mean directly calling imx290_runtime_resume() from probe is fine?

Yes. Feel free to call it e.g. imx290_power_on or something.

-- 
Regards,

Sakari Ailus
