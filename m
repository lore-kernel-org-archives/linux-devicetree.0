From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] rtc: add driver for RX6110SA real time clock
Date: Thu, 10 Dec 2015 12:01:19 +0100
Message-ID: <20151210110119.GD20212@pengutronix.de>
References: <1449568461-26016-1-git-send-email-s.trumtrar@pengutronix.de>
 <1449568461-26016-2-git-send-email-s.trumtrar@pengutronix.de>
 <1449570621.18374.1.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449570621.18374.1.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Dec 08, 2015 at 11:30:21AM +0100, Philipp Zabel wrote:
> Am Dienstag, den 08.12.2015, 10:54 +0100 schrieb Steffen Trumtrar:
> > The RX6110 comes in two different variants: SPI and I2C.
> > This driver only supports the SPI variant.
> > 
> > If the need ever arises to also support the I2C variant, this driver
> > could easily be refactored to support both cases.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> I have a few suggestions:
> 
> [...]
> > diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> > new file mode 100644
> > index 000000000000..aa9d89d5d2de
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-rx6110.c
> > @@ -0,0 +1,438 @@
> > +/*
> > + * Driver for the Epson RTC module RX-6110 SA
> > + *
> > + * Copyright(C) 2015 Pengutronix, Steffen Trumtrar <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > + * Copyright(C) SEIKO EPSON CORPORATION 2013. All rights reserved.
> > + *
> > + * This driver software is distributed as is, without any warranty of any kind,
> > + * either express or implied as further specified in the GNU Public License.
> > + * This software may be used and distributed according to the terms of the GNU
> > + * Public License, version 2 as published by the Free Software Foundation.
> > + * See the file COPYING in the main directory of this archive for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program. If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include <linux/bcd.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> 
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_gpio.h>
> 
> I think these three can be dropped.
> 

Okay.

> > +#include <linux/regmap.h>
> > +#include <linux/rtc.h>
> > +#include <linux/spi/spi.h>
> > +
> > +/* RX-6110 Register definitions */
> [...]
> > +
> > +static struct spi_driver rx6110_driver;
> 
> Several drivers do this. Instead of the forward declaration and using
> rx6110_driver.driver.name in devm_rtc_device_register below, why not
> just have a #define RX6110_DRIVER_NAME "rx6110-rtc" and reuse that?
> Actually, I think the "-rtc" suffix is superfluous in the rtc name.
> I'd just use "rx6110" as a parameter to devm_rtc_device_register.
>

Yeah, why not. The define seems to be a cleaner solution than the
forward declaration. Changed.

> > +struct rx6110_data {
> > +	struct rtc_device *rtc;
> > +	struct regmap *regmap;
> > +};
> [...]
> > +/**
> > + * rx6110_init - initialize the rx6110 registers
> > + *
> > + * @rx6110: pointer to the rx6110 struct in use
> > + *
> > + */
> > +static int rx6110_init(struct rx6110_data *rx6110)
> > +{
> > +	struct rtc_device *rtc = rx6110->rtc;
> > +	int ext;
> > +	int flags;
> > +	int ctrl;
> 
> ctrl is unused, except in the dev_dbg to print 0 below.
> 
> > +	int ret;
> > +
> > +	/* set reserved register 0x17 with specified value of 0xB8 */
> > +	ret = regmap_write(rx6110->regmap, RX6110_REG_RES1, 0xB8);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* set reserved register 0x30 with specified value of 0x00 */
> > +	ret = regmap_write(rx6110->regmap, RX6110_REG_RES2, 0x00);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* set reserved register 0x31 with specified value of 0x10 */
> > +	ret = regmap_write(rx6110->regmap, RX6110_REG_RES3, 0x10);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = regmap_write(rx6110->regmap, RX6110_REG_IRQ, 0x0);
> > +	if (ret)
> > +		return ret;
> 
> Maybe combine those using regmap_multi_reg_write? Not sure if the
> sequence can be reordered to also include the writes below.
>

Never heard of it, but it sounds like a good idea.

(...)

> > +/**
> > + * rx6110_probe - initialize rtc driver
> > + * @spi: pointer to spi device
> > + */
> > +static int rx6110_probe(struct spi_device *spi)
> > +{
> > +	struct rx6110_data *rx6110;
> > +	int err;
> > +
> > +	if ((spi->bits_per_word && spi->bits_per_word != 8)
> > +	    || (spi->max_speed_hz > 2000000)
> > +	    || (spi->mode != (SPI_CS_HIGH | SPI_CPOL | SPI_CPHA))) {
> > +		dev_warn(&spi->dev, "SPI settings: bits_per_word: %d, max_speed_hz: %d, mode: %xh\n",
> > +			spi->bits_per_word, spi->max_speed_hz, spi->mode);
> > +		dev_warn(&spi->dev, "driving device in an unsupported mode");
> > +	}
> > +
> > +	rx6110 = devm_kzalloc(&spi->dev, sizeof(*rx6110), GFP_KERNEL);
> > +	if (!rx6110)
> > +		return -ENOMEM;
> > +
> > +	rx6110->regmap = devm_regmap_init_spi(spi, &regmap_spi_config);
> > +	if (IS_ERR(rx6110->regmap)) {
> > +		dev_err(&spi->dev, "regmap init failed for rtc rx6110\n");
> 
> Maybe print the error code.
> 

Done.

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
