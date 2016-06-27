From: Stephen Boyd <stephen.boyd@linaro.org>
Subject: Re: [PATCH 02/21] usb: ulpi: Support device discovery via DT
Date: Mon, 27 Jun 2016 15:10:40 -0700
Message-ID: <146706544012.30684.15569003844798199881@sboyd-linaro>
References: <20160626072838.28082-1-stephen.boyd@linaro.org>
 <20160626072838.28082-3-stephen.boyd@linaro.org>
 <20160627143422.GB21398@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160627143422.GB21398@kuha.fi.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Heikki Krogerus (2016-06-27 07:34:22)
> Hi,
> 
> I'm fine with most of the patch, except..
> 
> On Sun, Jun 26, 2016 at 12:28:19AM -0700, Stephen Boyd wrote:
> > @@ -39,7 +42,10 @@ static int ulpi_match(struct device *dev, struct device_driver *driver)
> >       struct ulpi *ulpi = to_ulpi_dev(dev);
> >       const struct ulpi_device_id *id;
> >  
> > -     for (id = drv->id_table; id->vendor; id++)
> > +     if (of_driver_match_device(dev, driver))
> > +             return 1;
> 
> I don't like this part. We should match separately like that only
> if the bus does not support native enumeration, and of course ULPI
> with its vendor and product IDs does. There really should always be
> IDs to match with here. So exceptions have to be solved before we
> attempt matching.
> 
> Since we also have to support platforms where the PHY is initially
> powered off and reading the IDs from the registers is not possible
> because of that, I think we should consider getting the product and
> vendor IDs optionally from device properties. Something like this:

Ok, I'm a little worried about conflating the powered off problem with
this product/vendor ID missing problem. But if you're ok with that I'll
combine the two patches into one using your approach below.

> 
> 
> diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
> index 01c0c04..6228a85 100644
> --- a/drivers/usb/common/ulpi.c
> +++ b/drivers/usb/common/ulpi.c
> @@ -152,7 +152,7 @@ EXPORT_SYMBOL_GPL(ulpi_unregister_driver);
>  
>  /* -------------------------------------------------------------------------- */
>  
> -static int ulpi_register(struct device *dev, struct ulpi *ulpi)
> +static int ulpi_read_id(struct ulpi *ulpi)
>  {
>         int ret;
>  
> @@ -174,6 +174,21 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
>         ulpi->id.product = ulpi_read(ulpi, ULPI_PRODUCT_ID_LOW);
>         ulpi->id.product |= ulpi_read(ulpi, ULPI_PRODUCT_ID_HIGH) << 8;
>  
> +       return 0;
> +}
> +
> +static int ulpi_register(struct device *dev, struct ulpi *ulpi)
> +{
> +       int ret;
> +
> +       ret = device_property_read_u16(dev, "ulpi-vendor", &ulpi->id.vendor);
> +       ret |= device_property_read_u16(dev, "ulpi-product", &ulpi->id.product);
> +       if (ret) {
> +               ret = ulpi_read_id(ulpi);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         ulpi->dev.parent = dev;
>         ulpi->dev.bus = &ulpi_bus;
>         ulpi->dev.type = &ulpi_dev_type;
> 
> 
> That should cover both cases. You would just have to create the IDs
> yourself in this case.
> 

Right, I would have to make up some IDs in this case. I suppose I can
use the qcom vendor ID 0x05c6 and then product ids 0 and 1 for HS phy
and HSIC phy? That doesn't make me feel great because it's all made up,
but I guess there's no other option. I hope they don't decide to start
populating these ids in the future though and then we may have
conflicting product ids. If that happens I suppose we can do a
workaround based on compatible strings in the DT node. Fun!

Nice side effect of all that is I can drop requesting the module by DT
aliases and things become simpler. I'll try this out.
