From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date: Thu, 29 Aug 2019 23:17:01 +0300
Message-ID: <20190829201701.GA3568@valkosipuli.retiisi.org.uk>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-3-manivannan.sadhasivam@linaro.org>
 <20190813105920.GH835@valkosipuli.retiisi.org.uk>
 <20190829170415.GA4427@mani>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190829170415.GA4427@mani>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On Thu, Aug 29, 2019 at 10:34:15PM +0530, Manivannan Sadhasivam wrote:

...

> > > +static int imx290_set_fmt(struct v4l2_subdev *sd,
> > > +			  struct v4l2_subdev_pad_config *cfg,
> > > +		      struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct imx290 *imx290 = to_imx290(sd);
> > > +	const struct imx290_mode *mode;
> > > +	struct v4l2_mbus_framefmt *format;
> > > +	int i, ret = 0;
> > 
> > Note that sub-device drivers need to serialise access through the uAPI to
> > their own data.
> > 
> 
> You mean guarding with mutex?

Yes, please.

...

> > > +static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
> > > +{
> > > +	unsigned int i;
> > > +
> > > +	for (i = 0; i < IMX290_NUM_SUPPLIES; i++)
> > > +		imx290->supplies[i].supply = imx290_supply_name[i];
> > > +
> > > +	return devm_regulator_bulk_get(dev, IMX290_NUM_SUPPLIES,
> > > +				       imx290->supplies);
> > > +}
> > > +

...

> > > +	ret = imx290_get_regulators(dev, imx290);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "Cannot get regulators\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
> > > +	if (IS_ERR(imx290->rst_gpio)) {
> > > +		dev_err(dev, "Cannot get reset gpio\n");
> > 
> > Remember to put the regulators from now on. Or grab them later.
> > 
> 
> Shouldn't that happen by default with devm_regulator* APIs?

Ah, I missed you were using the devm variant. Please ignore the comment
then.

-- 
Regards,

Sakari Ailus
