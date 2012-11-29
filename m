From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V4 Resend 3/3] mfd: stmpe: Update DT support in stmpe
 driver
Date: Thu, 29 Nov 2012 09:24:50 +0000
Message-ID: <20121129092450.GU2013@gmail.com>
References: <d1f012d7bb2835f696fc100073f2eb16d9f6204d.1354128258.git.viresh.kumar@linaro.org>
 <eb65ded18560f902b0713d9df57c43e07704b5ec.1354128258.git.viresh.kumar@linaro.org>
 <20121129092308.GT2013@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121129092308.GT2013@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sameo@linux.intel.com, grant.likely@secretlab.ca, rabin.vincent@stericsson.com, shiraz.hashim@st.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, linus.walleij@linaro.org, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Thu, 29 Nov 2012, Lee Jones wrote:

> On Thu, 29 Nov 2012, Viresh Kumar wrote:
>=20
> > From: Vipul Kumar Samar <vipulkumar.samar@st.com>
> >=20
> > This patch extends existing DT support for stmpe devices. This upda=
tes:
> > - DT support from stmpe SPI and I2C drivers
> > - missing header files in stmpe.c
> > - stmpe_of_probe() with pwm, rotator and new bindings.
> > - Bindings are updated in binding document.
> >=20
> > Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V3->V4:
> > - Remove need to pass irq type and polarity from DT.
> > - Remove need to pass id from platform data.
> >=20
> >  Documentation/devicetree/bindings/mfd/stmpe.txt |  9 ++++++---
> >  drivers/mfd/stmpe-i2c.c                         | 15 +++++++++++++=
++
> >  drivers/mfd/stmpe-spi.c                         | 15 +++++++++++++=
++
> >  drivers/mfd/stmpe.c                             | 22 +++++++++++++=
+++------
> >  4 files changed, 52 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/stmpe.txt b/Docu=
mentation/devicetree/bindings/mfd/stmpe.txt
> > index 8f0aeda..d2d88d9 100644
> > --- a/Documentation/devicetree/bindings/mfd/stmpe.txt
> > +++ b/Documentation/devicetree/bindings/mfd/stmpe.txt
> > @@ -1,8 +1,11 @@
> > -* STMPE Multi-Functional Device
> > +* ST Microelectronics STMPE Multi-Functional Device
> > +
> > +STMPE is an MFD device which may expose following inbuilt devices:=
 gpio, keypad,
> > +touchscreen, adc, pwm, rotator.
> > =20
> >  Required properties:
> > - - compatible                   : "st,stmpe[811|1601|2401|2403]"
> > - - reg                          : I2C address of the device
> > + - compatible                   : "st,stmpe[610|801|811|1601|2401|=
2403]"
> > + - reg                          : I2C/SPI address of the device
> > =20
> >  Optional properties:
> >   - interrupts                   : The interrupt outputs from the c=
ontroller
> > diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
> > index c734dc3..003c49b 100644
> > --- a/drivers/mfd/stmpe-i2c.c
> > +++ b/drivers/mfd/stmpe-i2c.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/types.h>
> >  #include "stmpe.h"
> > =20
> > @@ -81,6 +82,19 @@ static const struct i2c_device_id stmpe_i2c_id[]=
 =3D {
> >  };
> >  MODULE_DEVICE_TABLE(i2c, stmpe_id);
> > =20
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id stmpe_dt_ids[] =3D {
> > +	{ .compatible =3D "st,stmpe610", .data =3D &stmpe_i2c_id[0], },
> > +	{ .compatible =3D "st,stmpe801", .data =3D &stmpe_i2c_id[1], },
> > +	{ .compatible =3D "st,stmpe811", .data =3D &stmpe_i2c_id[2], },
> > +	{ .compatible =3D "st,stmpe1601", .data =3D &stmpe_i2c_id[3], },
> > +	{ .compatible =3D "st,stmpe2401", .data =3D &stmpe_i2c_id[4], },
> > +	{ .compatible =3D "st,stmpe2403", .data =3D &stmpe_i2c_id[5], },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, stmpe_dt_ids);
> > +#endif
> > +
> >  static struct i2c_driver stmpe_i2c_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "stmpe-i2c",
> > @@ -88,6 +102,7 @@ static struct i2c_driver stmpe_i2c_driver =3D {
> >  #ifdef CONFIG_PM
> >  		.pm =3D &stmpe_dev_pm_ops,
> >  #endif
> > +		.of_match_table =3D of_match_ptr(stmpe_dt_ids),
> >  	},
> >  	.probe		=3D stmpe_i2c_probe,
> >  	.remove		=3D __devexit_p(stmpe_i2c_remove),
> > diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
> > index 9edfe86..1e2bff0 100644
> > --- a/drivers/mfd/stmpe-spi.c
> > +++ b/drivers/mfd/stmpe-spi.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/types.h>
> >  #include "stmpe.h"
> > =20
> > @@ -119,6 +120,19 @@ static const struct spi_device_id stmpe_spi_id=
[] =3D {
> >  };
> >  MODULE_DEVICE_TABLE(spi, stmpe_id);
> > =20
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id stmpe_dt_ids[] =3D {
> > +	{ .compatible =3D "st,stmpe610", .data =3D (void *)STMPE610, },
> > +	{ .compatible =3D "st,stmpe801", .data =3D (void *)STMPE801, },
> > +	{ .compatible =3D "st,stmpe811", .data =3D (void *)STMPE811, },
> > +	{ .compatible =3D "st,stmpe1601", .data =3D (void *)STMPE1601, },
> > +	{ .compatible =3D "st,stmpe2401", .data =3D (void *)STMPE2401, },
> > +	{ .compatible =3D "st,stmpe2403", .data =3D (void *)STMPE2403, },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, stmpe_dt_ids);
> > +#endif
> > +
> >  static struct spi_driver stmpe_spi_driver =3D {
> >  	.driver =3D {
> >  		.name	=3D "stmpe-spi",
> > @@ -126,6 +140,7 @@ static struct spi_driver stmpe_spi_driver =3D {
> >  #ifdef CONFIG_PM
> >  		.pm	=3D &stmpe_dev_pm_ops,
> >  #endif
> > +		.of_match_table =3D of_match_ptr(stmpe_dt_ids),
> >  	},
> >  	.probe		=3D stmpe_spi_probe,
> >  	.remove		=3D __devexit_p(stmpe_spi_remove),
> > diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> > index 10819e6..88cd8e5 100644
> > --- a/drivers/mfd/stmpe.c
> > +++ b/drivers/mfd/stmpe.c
> > @@ -7,12 +7,15 @@
> >   * Author: Rabin Vincent <rabin.vincent@stericsson.com> for ST-Eri=
csson
> >   */
> > =20
> > +#include <linux/err.h>
> >  #include <linux/gpio.h>
> >  #include <linux/export.h>
> >  #include <linux/kernel.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqdomain.h>
> > +#include <linux/of.h>
> > +#include <linux/of_gpio.h>
> >  #include <linux/pm.h>
> >  #include <linux/slab.h>
> >  #include <linux/mfd/core.h>
> > @@ -1021,6 +1024,12 @@ void __devinit stmpe_of_probe(struct stmpe_p=
latform_data *pdata,
> >  {
> >  	struct device_node *child;
> > =20
> > +	/*
> > +	 * Distinct names of same cell-type within multiple instances of =
stmpe
> > +	 * will be guaranteed by DT.
> > +	 */
> > +	pdata->id =3D -1;
>=20
> And what if we're not booting with DT?

Ah, we're in *_of_probe(), ignore this.

Instead:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
