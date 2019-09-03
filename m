From: Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Date: Tue, 3 Sep 2019 12:50:19 +0900
Message-ID: <CAAFQd5AWBFVF5Fh0OWpfkPid1wXYdi=MDdVukxaAKQg2dABnCA@mail.gmail.com>
References: <20190708100641.2702-1-dongchun.zhu@mediatek.com>
 <20190708100641.2702-3-dongchun.zhu@mediatek.com>
 <20190823081723.GA33937@chromium.org>
 <1567436507.21623.83.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1567436507.21623.83.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, shengnan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sj Huang <sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cao Bing Bu <bingbu.cao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "list-Y9sIeH5OGRo@public.gmane.org:IOMMU DRIVERS <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, " <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

On Tue, Sep 3, 2019 at 12:02 AM Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Hi Tomasz,
>
> On Fri, 2019-08-23 at 17:17 +0900, Tomasz Figa wrote:
> > Hi Dongchun,
> >
> > On Mon, Jul 08, 2019 at 06:06:41PM +0800, dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > > From: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > >
> > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > and provides control to set the desired focus.
> > >
> > > The DW9807 is a 10 bit DAC from Dongwoon, designed for linear
> > > control of voice coil motor.
> > >
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/media/i2c/Kconfig  |  10 +
> > >  drivers/media/i2c/Makefile |   1 +
> > >  drivers/media/i2c/dw9768.c | 458 +++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 470 insertions(+)
> > >  create mode 100644 drivers/media/i2c/dw9768.c
> > >
> >
> > Thanks for the patch! Please see my comments inline.
> >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8f6ac93..17152d7 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4877,6 +4877,7 @@ M:    Dongchun Zhu <dongchun.zhu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > >  L: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > >  T: git git://linuxtv.org/media_tree.git
> > >  S: Maintained
> > > +F: drivers/media/i2c/dw9768.c
> > >  F: Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
> > >
> > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 7793358..8ff6c95 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -1014,6 +1014,16 @@ config VIDEO_DW9714
> > >       capability. This is designed for linear control of
> > >       voice coil motors, controlled via I2C serial interface.
> > >
> > > +config VIDEO_DW9768
> > > +   tristate "DW9768 lens voice coil support"
> > > +   depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > +   depends on VIDEO_V4L2_SUBDEV_API
> > > +   help
> > > +     This is a driver for the DW9768 camera lens voice coil.
> > > +     DW9768 is a 10 bit DAC with 100mA output current sink
> > > +     capability. This is designed for linear control of
> > > +     voice coil motors, controlled via I2C serial interface.
> > > +
> > >  config VIDEO_DW9807_VCM
> > >     tristate "DW9807 lens voice coil support"
> > >     depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index d8ad9da..944fbf6 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
> > >  obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
> > >  obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
> > >  obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
> > > +obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
> > >  obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
> > >  obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
> > >  obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
> > > diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> > > new file mode 100644
> > > index 0000000..f5b5591
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/dw9768.c
> > > @@ -0,0 +1,458 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018 MediaTek Inc.
> > > + */
> > > +
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-subdev.h>
> > > +
> > > +#define DW9768_VOLTAGE_ANALOG                      2800000
> >
> > This is a platform detail and should be defined in the platform data, for
> > example DTS on platforms using DT.
> >
>
> Thanks for your reminder.
> This would be fixed in next release.
>
> > > +#define DW9768_NAME                                "dw9768"
> >
> > The chip we seem to be using this driver for is called gt9769. Shouldn't we
> > call the driver the same?
> >
>
> It is also called DW9768 from camera module specification, which was
> initially confirmed with vendor.
>

Okay, thanks for clarifying.

Best regards,
Tomasz
