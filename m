From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/2] iio: chemical: bme680: Add device-tree support
Date: Sat, 19 Jan 2019 17:44:18 +0000
Message-ID: <20190119174418.32cb9a3f@archlinux>
References: <20190114201914.24572-1-sebastien.bourdelin@gmail.com>
        <20190115184713.GC10186@himanshu-Vostro-3559>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115184713.GC10186@himanshu-Vostro-3559>
Sender: linux-kernel-owner@vger.kernel.org
To: Himanshu Jha <himanshujha199640@gmail.com>
Cc: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2019 00:17:13 +0530
Himanshu Jha <himanshujha199640@gmail.com> wrote:

> On Mon, Jan 14, 2019 at 03:19:13PM -0500, Sebastien Bourdelin wrote:
> > This commit allow the driver to work with device-tree.
> > 
> > Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> > ---  
> 
> 	Acked-by: Himanshu Jha <himanshujha199640@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it and see if we missed anything.

Thanks,

Jonathan
> 
> Thanks!
> 
> > v2 -> v3:
> >   - remove of_match_ptr: Suggested by Jonathan Cameron <jic23@kernel.org>
> >   - minor style fixup
> >   - rebase on master
> > v1 -> v2:
> >   - add missing of.h header in bme680_spi.c
> > ---
> >  drivers/iio/chemical/bme680_i2c.c | 7 +++++++
> >  drivers/iio/chemical/bme680_spi.c | 8 ++++++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/iio/chemical/bme680_i2c.c b/drivers/iio/chemical/bme680_i2c.c
> > index 06d4be539d2e..b2f805b6b36a 100644
> > --- a/drivers/iio/chemical/bme680_i2c.c
> > +++ b/drivers/iio/chemical/bme680_i2c.c
> > @@ -70,10 +70,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
> >  
> > +static const struct of_device_id bme680_of_i2c_match[] = {
> > +	{ .compatible = "bosch,bme680", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, bme680_of_i2c_match);
> > +
> >  static struct i2c_driver bme680_i2c_driver = {
> >  	.driver = {
> >  		.name			= "bme680_i2c",
> >  		.acpi_match_table       = ACPI_PTR(bme680_acpi_match),
> > +		.of_match_table		= bme680_of_i2c_match,
> >  	},
> >  	.probe = bme680_i2c_probe,
> >  	.id_table = bme680_i2c_id,
> > diff --git a/drivers/iio/chemical/bme680_spi.c b/drivers/iio/chemical/bme680_spi.c
> > index c9fb05e8d0b9..d0b7bdd3f066 100644
> > --- a/drivers/iio/chemical/bme680_spi.c
> > +++ b/drivers/iio/chemical/bme680_spi.c
> > @@ -6,6 +6,7 @@
> >   */
> >  #include <linux/acpi.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/regmap.h>
> >  #include <linux/spi/spi.h>
> >  
> > @@ -110,10 +111,17 @@ static const struct acpi_device_id bme680_acpi_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(acpi, bme680_acpi_match);
> >  
> > +static const struct of_device_id bme680_of_spi_match[] = {
> > +	{ .compatible = "bosch,bme680", },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
> > +
> >  static struct spi_driver bme680_spi_driver = {
> >  	.driver = {
> >  		.name			= "bme680_spi",
> >  		.acpi_match_table	= ACPI_PTR(bme680_acpi_match),
> > +		.of_match_table		= bme680_of_spi_match,
> >  	},
> >  	.probe = bme680_spi_probe,
> >  	.id_table = bme680_spi_id,
> > -- 
> > 2.20.1
> >   
> 
