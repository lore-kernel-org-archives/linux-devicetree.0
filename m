From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v3 1/5] mfd/axp20x: rename files to support more devices
Date: Mon, 15 Sep 2014 09:28:17 -0700
Message-ID: <20140915092817.071fd722@ultegra>
References: <1410477357-6407-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1410477357-6407-2-git-send-email-jacob.jun.pan@linux.intel.com>
	<5414A264.8090100@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5414A264.8090100-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnuc>
List-Id: devicetree@vger.kernel.org

On Sat, 13 Sep 2014 21:00:36 +0100
Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On 12/09/14 00:15, Jacob Pan wrote:
> > More XPowers PMIC devices can be supported by extending this
> > driver, so rename it to axp2xx to cover axp288 variant.
> > 
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Signed-off-by: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> I'm not sure this rename is a good idea (or the original wild
> card was for that matter).
> 
> For example, just a quick look at the xpowers website shows there is
> a AXP228 which just got swept up by the name change.
> 
> Best plan, in my view, is to always name a driver after an individual
> part it supports and rely on Kconfig description to say what else is
> supported. Bit late here, but perhaps best not to make things worse!
> > ---
OK. I agree with this plan to keep axp20x name and modify Kconfig
description.

Lee is that OK with you? please help to make a decision here.


> >  drivers/mfd/Kconfig                      | 7 ++++---
> >  drivers/mfd/Makefile                     | 2 +-
> >  drivers/mfd/{axp20x.c => axp2xx.c}       | 6 +++---
> >  include/linux/mfd/{axp20x.h => axp2xx.h} | 6 +++---
> >  4 files changed, 11 insertions(+), 10 deletions(-)
> >  rename drivers/mfd/{axp20x.c => axp2xx.c} (97%)
> >  rename include/linux/mfd/{axp20x.h => axp2xx.h} (98%)
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index de5abf2..42a70a3 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -67,14 +67,15 @@ config MFD_BCM590XX
> >  	help
> >  	  Support for the BCM590xx PMUs from Broadcom
> >  
> > -config MFD_AXP20X
> > -	bool "X-Powers AXP20X"
> > +config MFD_AXP2XX
> > +	bool "X-Powers AXP2XX"
> >  	select MFD_CORE
> >  	select REGMAP_I2C
> >  	select REGMAP_IRQ
> >  	depends on I2C=y
> >  	help
> > -	  If you say Y here you get support for the X-Powers
> > AXP202 and AXP209.
> > +	  If you say Y here you get support for the X-Powers
> > AXP202, AXP209 and
> > +	  AXP288 power management IC (PMIC).
> >  	  This driver include only the core APIs. You have to
> > select individual components like regulators or the PEK (Power
> > Enable Key) under the corresponding menus.
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 3fcfdfc..8d0beb2 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -103,7 +103,7 @@ obj-$(CONFIG_PMIC_DA9052)	+= da9052-irq.o
> >  obj-$(CONFIG_PMIC_DA9052)	+= da9052-core.o
> >  obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
> >  obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
> > -obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
> > +obj-$(CONFIG_MFD_AXP2XX)	+= axp2xx.o
> >  
> >  obj-$(CONFIG_MFD_LP3943)	+= lp3943.o
> >  obj-$(CONFIG_MFD_LP8788)	+= lp8788.o lp8788-irq.o
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp2xx.c
> > similarity index 97%
> > rename from drivers/mfd/axp20x.c
> > rename to drivers/mfd/axp2xx.c
> > index dee6539..332a8a0 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp2xx.c
> > @@ -1,7 +1,7 @@
> >  /*
> > - * axp20x.c - MFD core driver for the X-Powers AXP202 and AXP209
> > + * axp2xx.c - MFD core driver for the X-Powers AXP202 and AXP209
> >   *
> > - * AXP20x comprises an adaptive USB-Compatible PWM charger, 2 BUCK
> > DC-DC
> > + * AXP2xx comprises an adaptive USB-Compatible PWM charger, 2 BUCK
> > DC-DC
> >   * converters, 5 LDOs, multiple 12-bit ADCs of voltage, current
> > and temperature
> >   * as well as 4 configurable GPIOs.
> >   *
> > @@ -21,7 +21,7 @@
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> >  #include <linux/regulator/consumer.h>
> > -#include <linux/mfd/axp20x.h>
> > +#include <linux/mfd/axp2xx.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> > diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp2xx.h
> > similarity index 98%
> > rename from include/linux/mfd/axp20x.h
> > rename to include/linux/mfd/axp2xx.h
> > index d0e31a2..a36d91b 100644
> > --- a/include/linux/mfd/axp20x.h
> > +++ b/include/linux/mfd/axp2xx.h
> > @@ -8,8 +8,8 @@
> >   * published by the Free Software Foundation.
> >   */
> >  
> > -#ifndef __LINUX_MFD_AXP20X_H
> > -#define __LINUX_MFD_AXP20X_H
> > +#ifndef __LINUX_MFD_AXP2XX_H
> > +#define __LINUX_MFD_AXP2XX_H
> >  
> >  enum {
> >  	AXP202_ID = 0,
> > @@ -177,4 +177,4 @@ struct axp20x_dev {
> >  	long				variant;
> >  };
> >  
> > -#endif /* __LINUX_MFD_AXP20X_H */
> > +#endif /* __LINUX_MFD_AXP2XX_H */
> > 

[Jacob Pan]
