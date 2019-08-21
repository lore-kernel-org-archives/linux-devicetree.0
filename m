From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [V3, 2/2] media: i2c: Add Omnivision OV02A10 camera sensor driver
Date: Wed, 21 Aug 2019 14:05:43 +0300
Message-ID: <20190821110542.GD31967@paasikivi.fi.intel.com>
References: <20190819034331.13098-1-dongchun.zhu@mediatek.com>
 <20190819034331.13098-3-dongchun.zhu@mediatek.com>
 <20190821103038.GA148543@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190821103038.GA148543@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tfiga@chromium.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Tomasz,

On Wed, Aug 21, 2019 at 07:30:38PM +0900, Tomasz Figa wrote:
...
> > +
> > +/*
> > + * xvclk 24Mhz
> 
> This seems to assume 24MHz, but the driver allows a range in probe. Is that
> correct?

I think it'd be better to check for an exact frequency: this is board
specific and its exact value is known.

...

> > +static int __ov02a10_power_on(struct ov02a10 *ov02a10)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > +	struct device *dev = &client->dev;
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(ov02a10->xvclk);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to enable xvclk\n");
> > +		return ret;
> > +	}
> 
> Is it really correct to enable the clock before the regulators?
> 
> According to the datasheet, it should be:
>  - PD pin HIGH,
>  - nRST pin LOW,
>  - DVDDIO and AVDD28 power up and stabilize,
>  - clock enabled,
>  - min 5 ms delay,
>  - PD pin LOW,
>  - min 4 ms delay,
>  - nRST pin HIGH,
>  - min 5 ms delay,
>  - I2C interface ready.
> 
> > +
> > +	/* Note: set 0 is high, set 1 is low */
> 
> Why is that? If there is some inverter on the way that should be handled
> outside of this driver. (GPIO DT bindings have flags for this purpose.
> 
> If the pins are nRESET and nPOWERDOWN in the hardware datasheet, we should
> call them like this in the driver too (+/- the lowercase and underscore
> convention).
> 
> According to the datasheet, the reset pin is called RST and inverted, so we should
> call it n_rst, but the powerdown signal, called PD, is not inverted, so pd
> would be the right name.

For what it's worth sensors generally have xshutdown (or reset) pin that is
active high. Looking at the code, it is not the case here. It's a bit odd
since the usual arrangement saves power when the camera is not in use; it's
not a lot but still. Oh well.

...

> > +static struct i2c_driver ov02a10_i2c_driver = {
> > +	.driver = {
> > +		.name = "ov02a10",
> > +		.pm = &ov02a10_pm_ops,
> > +		.of_match_table = ov02a10_of_match,
> 
> Please use of_match_ptr() wrapper.

Not really needed; the driver does expect regulators, GPIOs etc., but by
leaving out of_match_ptr(), the driver will also probe on ACPI based
systems.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
