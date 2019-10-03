From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 2/3] media: i2c: Add IMX290 CMOS image sensor driver
Date: Thu, 3 Oct 2019 11:03:38 +0530
Message-ID: <20191003053338.GA7868@Mani-XPS-13-9360>
References: <20190830091943.22646-1-manivannan.sadhasivam@linaro.org>
 <20190830091943.22646-3-manivannan.sadhasivam@linaro.org>
 <20190923092209.GL5525@valkosipuli.retiisi.org.uk>
 <20191001184200.GA7739@Mani-XPS-13-9360>
 <20191002103715.GR896@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191002103715.GR896@valkosipuli.retiisi.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: devicetree@vger.kernel.org, c.barrett@framos.com, linux-kernel@vger.kernel.org, a.brela@framos.com, robh+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sakari,

On Wed, Oct 02, 2019 at 01:37:15PM +0300, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Wed, Oct 02, 2019 at 12:12:00AM +0530, Manivannan Sadhasivam wrote:
> > Hi Sakari,
> > 
> > On Mon, Sep 23, 2019 at 12:22:09PM +0300, Sakari Ailus wrote:
> > > Hi Manivannan,
> > > 
> > > On Fri, Aug 30, 2019 at 02:49:42PM +0530, Manivannan Sadhasivam wrote:
> > > > Add driver for Sony IMX290 CMOS image sensor driver. The driver only
> > > > supports I2C interface for programming and MIPI CSI-2 for sensor output.
> > > > 
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/media/i2c/Kconfig  |  11 +
> > > >  drivers/media/i2c/Makefile |   1 +
> > > >  drivers/media/i2c/imx290.c | 881 +++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 893 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/imx290.c
> > > > 
> > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > index 79ce9ec6fc1b..4ebb80b18748 100644
> > > > --- a/drivers/media/i2c/Kconfig
> > > > +++ b/drivers/media/i2c/Kconfig
> > > > @@ -595,6 +595,17 @@ config VIDEO_IMX274
> > > >  	  This is a V4L2 sensor driver for the Sony IMX274
> > > >  	  CMOS image sensor.
> > > >  
> > > > +config VIDEO_IMX290
> > > > +	tristate "Sony IMX290 sensor support"
> > > > +	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > > +	depends on MEDIA_CAMERA_SUPPORT
> > > 
> > > Please drop this line. It will be redundant very soon.
> > > 
> > 
> > okay.
> > 
> > > > +	help
> > > > +	  This is a Video4Linux2 sensor driver for the Sony
> > > > +	  IMX290 camera sensor.
> > > > +
> > > > +	  To compile this driver as a module, choose M here: the
> > > > +	  module will be called imx290.
> > > > +
> > > >  config VIDEO_IMX319
> > > >  	tristate "Sony IMX319 sensor support"
> > > >  	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > index fd4ea86dedd5..04411ddb4922 100644
> > > > --- a/drivers/media/i2c/Makefile
> > > > +++ b/drivers/media/i2c/Makefile
> > > > @@ -111,6 +111,7 @@ obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
> > > >  obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
> > > >  obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
> > > >  obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
> > > > +obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
> > > >  obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
> > > >  obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
> > > >  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > new file mode 100644
> > > > index 000000000000..db5bb0d69eb8
> > > > --- /dev/null
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -0,0 +1,881 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Sony IMX290 CMOS Image Sensor Driver
> > > > + *
> > > > + * Copyright (C) 2019 FRAMOS GmbH.
> > > > + *
> > > > + * Copyright (C) 2019 Linaro Ltd.
> > > > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > + */
> > > > +
> > > > +#include <linux/clk.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/pm_runtime.h>
> > > > +#include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > > +#include <media/media-entity.h>
> > > > +#include <media/v4l2-ctrls.h>
> > > > +#include <media/v4l2-device.h>
> > > > +#include <media/v4l2-fwnode.h>
> > > > +#include <media/v4l2-subdev.h>
> > > > +
> > > > +#define IMX290_STANDBY 0x3000
> > > > +#define IMX290_REGHOLD 0x3001
> > > > +#define IMX290_XMSTA 0x3002
> > > > +#define IMX290_GAIN 0x3014
> > > > +
> > > > +#define IMX290_DEFAULT_LINK_FREQ 445500000
> > > > +
> > > > +static const char * const imx290_supply_name[] = {
> > > > +	"vdda",
> > > > +	"vddd",
> > > > +	"vdddo",
> > > > +};
> > > > +
> > > > +#define IMX290_NUM_SUPPLIES ARRAY_SIZE(imx290_supply_name)
> > > > +
> > > > +struct imx290_regval {
> > > > +	u16 reg;
> > > > +	u8 val;
> > > > +};
> > > > +
> > > > +struct imx290_mode {
> > > > +	u32 width;
> > > > +	u32 height;
> > > > +	u32 pixel_rate;
> > > > +	u32 link_freq_index;
> > > > +
> > > > +	const struct imx290_regval *data;
> > > > +	u32 data_size;
> > > > +};
> > > > +
> > > > +struct imx290 {
> > > > +	struct device *dev;
> > > > +	struct clk *xclk;
> > > > +	struct regmap *regmap;
> > > > +
> > > > +	struct v4l2_subdev sd;
> > > > +	struct v4l2_fwnode_endpoint ep;
> > > > +	struct media_pad pad;
> > > > +	struct v4l2_mbus_framefmt current_format;
> > > > +	const struct imx290_mode *current_mode;
> > > > +
> > > > +	struct regulator_bulk_data supplies[IMX290_NUM_SUPPLIES];
> > > > +	struct gpio_desc *rst_gpio;
> > > > +
> > > > +	struct v4l2_ctrl_handler ctrls;
> > > > +	struct v4l2_ctrl *link_freq;
> > > > +	struct v4l2_ctrl *pixel_rate;
> > > > +
> > > > +	struct mutex lock;
> > > > +};
> > > > +
> > > > +struct imx290_pixfmt {
> > > > +	u32 code;
> > > > +};
> > > > +
> > > > +static const struct imx290_pixfmt imx290_formats[] = {
> > > > +	{ MEDIA_BUS_FMT_SRGGB10_1X10 },
> > > 
> > > You have a single format here. You don't need the entire array, do you?
> > > 
> > > Unless you have plans to add more, that is.
> > > 
> > 
> > Yes, the sensor supports RAW12 format as well and it will be added once
> > this driver is merged.
> 
> Ok. 
> 
> > 
> > > > +};
> > > > +
> > > > +static struct regmap_config imx290_regmap_config = {
> 
> Should this be const, too?
> 

yep

> > > > +	.reg_bits = 16,
> > > > +	.val_bits = 8,
> > > > +	.cache_type = REGCACHE_RBTREE,
> > > > +};
> 
> ...
> 
> > > > +static int imx290_write_buffered_reg(struct imx290 *imx290, u16 address_low,
> > > > +				     u8 nr_regs, u32 value)
> > > > +{
> > > > +	unsigned int i;
> > > > +	int ret;
> > > > +
> > > > +	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x01);
> > > > +	if (ret) {
> > > > +		dev_err(imx290->dev, "Error setting hold register\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < nr_regs; i++) {
> > > > +		ret = imx290_write_reg(imx290, address_low + i,
> > > > +				       (u8)(value >> (i * 8)));
> > > > +		if (ret) {
> > > > +			dev_err(imx290->dev, "Error writing buffered registers\n");
> > > > +			return ret;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	ret = imx290_write_reg(imx290, IMX290_REGHOLD, 0x00);
> > > > +	if (ret) {
> > > > +		dev_err(imx290->dev, "Error setting hold register\n");
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int imx290_set_gain(struct imx290 *imx290, u32 value)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	u32 adjusted_value = (value * 10) / 3;
> > > 
> > > What's the purpose of this? Why not to use the value directly?
> > > 
> > 
> > The gain register accepts the value 10/3 of the actual gain required. Hence,
> > we need to manually do the calculation before updating the value. I can
> > add a comment here to clarify.
> 
> It's better to use the register value directly. Otherwise the granularity
> won't be available to the user space.
> 

The sensor datasheet clearly defines that the 10/3'rd of the expected gain
should be set to this register. So, IMO we should be setting the value as
mentioned in the datasheet. I agree that we are missing the userspace
granularity here but sticking to the device limitation shouldn't be a problem.
As I said, I'll add a comment here to clarify.

> > 
> > > > +
> > > > +	ret = imx290_write_buffered_reg(imx290, IMX290_GAIN, 1, adjusted_value);
> > > > +	if (ret)
> > > > +		dev_err(imx290->dev, "Unable to write gain\n");
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int imx290_set_power_on(struct imx290 *imx290)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = clk_prepare_enable(imx290->xclk);
> > > 
> > > Please move the code from this function to the runtime PM runtime suspend
> > > callback. The same for imx290_set_power_off().
> > > 
> > 
> > May I know why? I think since this is being used only once, you're suggesting
> > to move to the callback function itself but please see the comment below. I
> > will reuse this function to power on the device during probe.
> 
> Yes, you can call the same function from probe, even if it's used as a
> runtime PM callback.
> 
> There's no need to have a function that acts as a wrapper for calling it
> with a different type of an argument.
> 

You mean directly calling imx290_runtime_resume() from probe is fine?

Thanks,
Mani

> -- 
> Kind regards,
> 
> Sakari Ailus
