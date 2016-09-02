From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 03/22] usb: ulpi: Support device discovery via device
 properties
Date: Fri, 2 Sep 2016 17:09:22 +0300
Message-ID: <20160902140922.GC21737@kuha.fi.intel.com>
References: <20160901004036.23936-1-stephen.boyd@linaro.org>
 <20160901004036.23936-4-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160901004036.23936-4-stephen.boyd@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <stephen.boyd@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Aug 31, 2016 at 05:40:17PM -0700, Stephen Boyd wrote:
> @@ -174,14 +219,37 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
>  	ulpi->id.product = ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
>  	ulpi->id.product |= ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
>  
> +	return 0;
> +}
> +
> +static int ulpi_register(struct device *dev, struct ulpi *ulpi)
> +{
> +	int ret;
> +
>  	ulpi->dev.parent = dev;
>  	ulpi->dev.bus = &ulpi_bus;
>  	ulpi->dev.type = &ulpi_dev_type;
>  	dev_set_name(&ulpi->dev, "%s.ulpi", dev_name(dev));
>  
> +	if (IS_ENABLED(CONFIG_OF)) {

I don't think you need to check that in this case.

> +		ret = ulpi_of_register(ulpi);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));

ACPI_COMPANION_SET will overwrite the primary fwnode unconditionally,
so just to play it safe, do this before you call ulpi_of_register().

> -	request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
> +	ret = ulpi_read_id(ulpi);
> +	/*
> +	 * Ignore failure in case of DT node because the device may
> +	 * not be powered up yet but we can still match by compatible
> +	 */
> +	if (ret && !ulpi->dev.of_node)
> +		return ret;
> +
> +	if (of_device_request_module(&ulpi->dev))
> +		request_module("ulpi:v%04xp%04x", ulpi->id.vendor,
> +			       ulpi->id.product);

I don't think this works in all cases. If of_device_request_module()
fails and we don't have the id.vendor/product set, we should not
register the device. It also looks a bit messy.

How about just using of_device_request_module() call as fallback in
ulpi_read_id() and moving also request_module() call there:

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index 30ea770..667246c 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -205,14 +205,14 @@ static int ulpi_read_id(struct ulpi *ulpi)
        /* Test the interface */
        ret = ulpi_write(ulpi, ULPI_SCRATCH, 0xaa);
        if (ret < 0)
-               return ret;
+               goto err;
 
        ret = ulpi_read(ulpi, ULPI_SCRATCH);
        if (ret < 0)
-               return ret;
+               goto err;
 
        if (ret != 0xaa)
-               return -ENODEV;
+               goto err;
 
        ulpi->id.vendor = ulpi_read(ulpi, ULPI_VENDOR_ID_LOW);
        ulpi->id.vendor |= ulpi_read(ulpi, ULPI_VENDOR_ID_HIGH) << 8;
@@ -220,7 +220,11 @@ static int ulpi_read_id(struct ulpi *ulpi)
        ulpi->id.product = ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
        ulpi->id.product |= ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
 
+       request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
+
        return 0;
+err:
+       return of_device_request_module(&ulpi->dev);
 }
 
 static int ulpi_register(struct device *dev, struct ulpi *ulpi)
@@ -232,25 +236,15 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
        ulpi->dev.type = &ulpi_dev_type;
        dev_set_name(&ulpi->dev, "%s.ulpi", dev_name(dev));
 
-       if (IS_ENABLED(CONFIG_OF)) {
-               ret = ulpi_of_register(ulpi);
-               if (ret)
-                       return ret;
-       }
-
        ACPI_COMPANION_SET(&ulpi->dev, ACPI_COMPANION(dev));
 
-       ret = ulpi_read_id(ulpi);
-       /*
-        * Ignore failure in case of DT node because the device may
-        * not be powered up yet but we can still match by compatible
-        */
-       if (ret && !ulpi->dev.of_node)
+       ret = ulpi_of_register(ulpi);
+       if (ret)
                return ret;
 
-       if (of_device_request_module(&ulpi->dev))
-               request_module("ulpi:v%04xp%04x", ulpi->id.vendor,
-                              ulpi->id.product);
+       ret = ulpi_read_id(ulpi);
+       if (ret)
+               return ret;
 
        ret = device_register(&ulpi->dev);
        if (ret)


Cheers,

-- 
heikki
