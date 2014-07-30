Return-Path: <alexander.sverdlin@nsn.com>
Message-ID: <53D91D13.9020305@nsn.com>
Date: Wed, 30 Jul 2014 18:28:03 +0200
From: Alexander Sverdlin <alexander.sverdlin@nsn.com>
MIME-Version: 1.0
Subject: Re: [PATCH v7 8/9] of: spi: Export single device registration method
 and accessors
References: <1404493168-8980-1-git-send-email-pantelis.antoniou@konsulko.com> <1404493168-8980-9-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1404493168-8980-9-git-send-email-pantelis.antoniou@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: ext Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, Joel Becker <jlbec@evilplan.org>, devicetree@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, Pete Popov <pete.popov@konsulko.com>, Dan Malek <dan.malek@konsulko.com>, Georgi Vlaev <georgi.vlaev@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "Wiebe, Wladislav (NSN - DE/Ulm)" <wladislav.wiebe@nsn.com>
List-ID: <devicetree@vger.kernel.org>

Hello Pantelis,

On 04/07/14 18:59, ext Pantelis Antoniou wrote:
> Dynamically inserting spi device nodes requires the use of a single
> device registration method. Rework and export it.
> 
> Methods to lookup a device/master using a device node are added
> as well, of_find_spi_master_by_node() & of_find_spi_device_by_node().
> 
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  drivers/spi/spi.c | 256 +++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 158 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index d4f9670..cd98bf2 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -1200,6 +1200,123 @@ err_init_queue:
>  /*-------------------------------------------------------------------------*/
>  
>  #if defined(CONFIG_OF)
> +
> +static struct spi_device *
> +of_register_spi_device(struct spi_master *master, struct device_node *node)

During the test Wladislav has found that node is actually not used,

> +{
> +	struct spi_device *spi;
> +	struct device_node *nc;

but non-initialized nc is used further in the code.
Should not nc be a parameter of the function instead of a local variable?

> +	int rc;
> +	u32 value;
> +
> +	/* Alloc an spi_device */
> +	spi = spi_alloc_device(master);
> +	if (!spi) {
> +		dev_err(&master->dev, "spi_device alloc error for %s\n",
> +			nc->full_name);
> +		rc = -ENOMEM;
> +		goto err_out;
> +	}
> +
> +	/* Select device driver */
> +	rc = of_modalias_node(nc, spi->modalias,
> +				sizeof(spi->modalias));
> +	if (rc < 0) {
> +		dev_err(&master->dev, "cannot find modalias for %s\n",
> +			nc->full_name);
> +		goto err_out;
> +	}
> +
> +	/* Device address */
> +	rc = of_property_read_u32(nc, "reg", &value);
> +	if (rc) {
> +		dev_err(&master->dev, "%s has no valid 'reg' property (%d)\n",
> +			nc->full_name, rc);
> +		goto err_out;
> +	}
> +	spi->chip_select = value;
> +
> +	/* Mode (clock phase/polarity/etc.) */
> +	if (of_find_property(nc, "spi-cpha", NULL))
> +		spi->mode |= SPI_CPHA;
> +	if (of_find_property(nc, "spi-cpol", NULL))
> +		spi->mode |= SPI_CPOL;
> +	if (of_find_property(nc, "spi-cs-high", NULL))
> +		spi->mode |= SPI_CS_HIGH;
> +	if (of_find_property(nc, "spi-3wire", NULL))
> +		spi->mode |= SPI_3WIRE;
> +	if (of_find_property(nc, "spi-lsb-first", NULL))
> +		spi->mode |= SPI_LSB_FIRST;
> +
> +	/* Device DUAL/QUAD mode */
> +	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
> +		switch (value) {
> +		case 1:
> +			break;
> +		case 2:
> +			spi->mode |= SPI_TX_DUAL;
> +			break;
> +		case 4:
> +			spi->mode |= SPI_TX_QUAD;
> +			break;
> +		default:
> +			dev_warn(&master->dev,
> +				"spi-tx-bus-width %d not supported\n",
> +				value);
> +			break;
> +		}
> +	}
> +
> +	if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
> +		switch (value) {
> +		case 1:
> +			break;
> +		case 2:
> +			spi->mode |= SPI_RX_DUAL;
> +			break;
> +		case 4:
> +			spi->mode |= SPI_RX_QUAD;
> +			break;
> +		default:
> +			dev_warn(&master->dev,
> +				"spi-rx-bus-width %d not supported\n",
> +				value);
> +			break;
> +		}
> +	}
> +
> +	/* Device speed */
> +	rc = of_property_read_u32(nc, "spi-max-frequency", &value);
> +	if (rc) {
> +		dev_err(&master->dev, "%s has no valid 'spi-max-frequency' property (%d)\n",
> +			nc->full_name, rc);
> +		goto err_out;
> +	}
> +	spi->max_speed_hz = value;
> +
> +	/* IRQ */
> +	spi->irq = irq_of_parse_and_map(nc, 0);
> +
> +	/* Store a pointer to the node in the device structure */
> +	of_node_get(nc);
> +	spi->dev.of_node = nc;
> +
> +	/* Register the new device */
> +	request_module("%s%s", SPI_MODULE_PREFIX, spi->modalias);
> +	rc = spi_add_device(spi);
> +	if (rc) {
> +		dev_err(&master->dev, "spi_device register error %s\n",
> +			nc->full_name);
> +		goto err_out;
> +	}
> +
> +	return spi;
> +
> +err_out:
> +	spi_dev_put(spi);
> +	return ERR_PTR(rc);
> +}
> +
>  /**
>   * of_register_spi_devices() - Register child devices onto the SPI bus
>   * @master:	Pointer to spi_master device
> @@ -1209,120 +1326,63 @@ err_init_queue:
>   */
>  static void of_register_spi_devices(struct spi_master *master)
>  {
> -	struct spi_device *spi;
>  	struct device_node *nc;
> -	int rc;
> -	u32 value;
> +	struct spi_device *spi;
>  
>  	if (!master->dev.of_node)
>  		return;
>  
>  	for_each_available_child_of_node(master->dev.of_node, nc) {
> -		/* Alloc an spi_device */
> -		spi = spi_alloc_device(master);
> -		if (!spi) {
> -			dev_err(&master->dev, "spi_device alloc error for %s\n",
> +		spi = of_register_spi_device(master, nc);
> +		if (IS_ERR(spi))
> +			dev_warn(&master->dev, "Failed to create SPI device for %s\n",
>  				nc->full_name);
> -			spi_dev_put(spi);
> -			continue;
> -		}
> +	}
> +}
>  
> -		/* Select device driver */
> -		if (of_modalias_node(nc, spi->modalias,
> -				     sizeof(spi->modalias)) < 0) {
> -			dev_err(&master->dev, "cannot find modalias for %s\n",
> -				nc->full_name);
> -			spi_dev_put(spi);
> -			continue;
> -		}
> +static int of_dev_node_match(struct device *dev, void *data)
> +{
> +	return dev->of_node == data;
> +}
>  
> -		/* Device address */
> -		rc = of_property_read_u32(nc, "reg", &value);
> -		if (rc) {
> -			dev_err(&master->dev, "%s has no valid 'reg' property (%d)\n",
> -				nc->full_name, rc);
> -			spi_dev_put(spi);
> -			continue;
> -		}
> -		spi->chip_select = value;
> -
> -		/* Mode (clock phase/polarity/etc.) */
> -		if (of_find_property(nc, "spi-cpha", NULL))
> -			spi->mode |= SPI_CPHA;
> -		if (of_find_property(nc, "spi-cpol", NULL))
> -			spi->mode |= SPI_CPOL;
> -		if (of_find_property(nc, "spi-cs-high", NULL))
> -			spi->mode |= SPI_CS_HIGH;
> -		if (of_find_property(nc, "spi-3wire", NULL))
> -			spi->mode |= SPI_3WIRE;
> -		if (of_find_property(nc, "spi-lsb-first", NULL))
> -			spi->mode |= SPI_LSB_FIRST;
> -
> -		/* Device DUAL/QUAD mode */
> -		if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {
> -			switch (value) {
> -			case 1:
> -				break;
> -			case 2:
> -				spi->mode |= SPI_TX_DUAL;
> -				break;
> -			case 4:
> -				spi->mode |= SPI_TX_QUAD;
> -				break;
> -			default:
> -				dev_warn(&master->dev,
> -					 "spi-tx-bus-width %d not supported\n",
> -					 value);
> -				break;
> -			}
> -		}
> +/* bah; the match functions differ just by const-ness */
> +static int of_dev_node_match_const(struct device *dev, const void *data)
> +{
> +	return dev->of_node == data;
> +}
>  
> -		if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
> -			switch (value) {
> -			case 1:
> -				break;
> -			case 2:
> -				spi->mode |= SPI_RX_DUAL;
> -				break;
> -			case 4:
> -				spi->mode |= SPI_RX_QUAD;
> -				break;
> -			default:
> -				dev_warn(&master->dev,
> -					 "spi-rx-bus-width %d not supported\n",
> -					 value);
> -				break;
> -			}
> -		}
> +/* must call put_device() when done with returned spi_device device */
> +struct spi_device *of_find_spi_device_by_node(struct device_node *node)
> +{
> +	struct device *dev;
>  
> -		/* Device speed */
> -		rc = of_property_read_u32(nc, "spi-max-frequency", &value);
> -		if (rc) {
> -			dev_err(&master->dev, "%s has no valid 'spi-max-frequency' property (%d)\n",
> -				nc->full_name, rc);
> -			spi_dev_put(spi);
> -			continue;
> -		}
> -		spi->max_speed_hz = value;
> +	dev = bus_find_device(&spi_bus_type, NULL, node,
> +					 of_dev_node_match);
> +	if (!dev)
> +		return NULL;
>  
> -		/* IRQ */
> -		spi->irq = irq_of_parse_and_map(nc, 0);
> +	return to_spi_device(dev);
> +}
> +EXPORT_SYMBOL(of_find_spi_device_by_node);
>  
> -		/* Store a pointer to the node in the device structure */
> -		of_node_get(nc);
> -		spi->dev.of_node = nc;
> +/* forward decl */
> +static struct class spi_master_class;
>  
> -		/* Register the new device */
> -		request_module("%s%s", SPI_MODULE_PREFIX, spi->modalias);
> -		rc = spi_add_device(spi);
> -		if (rc) {
> -			dev_err(&master->dev, "spi_device register error %s\n",
> -				nc->full_name);
> -			spi_dev_put(spi);
> -		}
> +/* the spi masters are not using spi_bus, so we find it with another way */
> +struct spi_master *of_find_spi_master_by_node(struct device_node *node)
> +{
> +	struct device *dev;
>  
> -	}
> +	dev = class_find_device(&spi_master_class, NULL, node,
> +				of_dev_node_match_const);
> +	if (!dev)
> +		return NULL;
> +
> +	/* reference got in class_find_device */
> +	return container_of(dev, struct spi_master, dev);
>  }
> +EXPORT_SYMBOL(of_find_spi_master_by_node);
> +
>  #else
>  static void of_register_spi_devices(struct spi_master *master) { }
>  #endif
> 

-- 
Best regards,
Alexander Sverdlin.
