From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch 4/6] media: i2c: ov2659: Add optional powerdown gpio
 handling
Date: Sun, 15 Sep 2019 15:27:20 -0500
Message-ID: <20190915202720.63saxa7fbifn3qf3@ti.com>
References: <20190912130007.4469-1-bparrot@ti.com>
 <20190912130007.4469-5-bparrot@ti.com>
 <CA+V-a8stmX2WmJEQRvvdOfHiFNgmEbtPTWtn+Fuq2h8SW4N3Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+V-a8stmX2WmJEQRvvdOfHiFNgmEbtPTWtn+Fuq2h8SW4N3Hw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Sat [2019-Sep-14 11:33:42 +0100]:
> Hi Benoit,
> 
> On Thu, Sep 12, 2019 at 1:58 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > On some board it is possible that the sensor 'powerdown'
> > pin might be controlled with a gpio instead of being
> > tied to always powered.
> >
> > This patch add support to specify an optional gpio
> > which will be set at probe time and remained on.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/Kconfig  |  2 +-
> >  drivers/media/i2c/ov2659.c | 13 +++++++++++++
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 7eee1812bba3..315c1d8bdb7b 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -634,7 +634,7 @@ config VIDEO_OV2640
> >  config VIDEO_OV2659
> >         tristate "OmniVision OV2659 sensor support"
> >         depends on VIDEO_V4L2 && I2C
> > -       depends on MEDIA_CAMERA_SUPPORT
> > +       depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
> >         select V4L2_FWNODE
> >         help
> >           This is a Video4Linux2 sensor driver for the OmniVision
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index efbe6dc720e2..c64f73bef336 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -32,6 +32,8 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/uaccess.h>
> >  #include <linux/videodev2.h>
> > @@ -232,6 +234,8 @@ struct ov2659 {
> >         struct sensor_register *format_ctrl_regs;
> >         struct ov2659_pll_ctrl pll;
> >         int streaming;
> > +       /* used to control the sensor powerdownN pin */
> > +       struct gpio_desc *pwrdn_gpio;
> >  };
> >
> >  static const struct sensor_register ov2659_init_regs[] = {
> > @@ -1391,6 +1395,7 @@ static int ov2659_probe(struct i2c_client *client)
> >         struct v4l2_subdev *sd;
> >         struct ov2659 *ov2659;
> >         struct clk *clk;
> > +       struct gpio_desc *gpio;
> 
> you don't need the local var here you can just assign it directly to pwrdn_gpio.

Ok.

> 
> >         int ret;
> >
> >         if (!pdata) {
> > @@ -1414,6 +1419,14 @@ static int ov2659_probe(struct i2c_client *client)
> >             ov2659->xvclk_frequency > 27000000)
> >                 return -EINVAL;
> >
> > +       /* Optional gpio don't fail if not present */
> > +       gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> > +                                      GPIOD_OUT_HIGH);
> > +       if (IS_ERR(gpio))
> > +               return PTR_ERR(gpio);
> > +
> > +       ov2659->pwrdn_gpio = gpio;
> > +
> apart from assigning it you don't actually use it.
> 
> you will also have to read the reset gpio pin and implement
> ov2659_set_power() and
> call it in appropriate places/ s_power ?

Well I am not sure I want to go that far.
On most board I have the sensor is always powered as soon as the board gets
powered. Which is why we go through a S/W reset before starting a stream.

I didn't want to change the logic here too much.

I'll check this out a little more.

Benoit

> 
> Cheers,
> --Prabhakar Lad
