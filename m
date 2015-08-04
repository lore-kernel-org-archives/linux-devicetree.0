From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: temperature: add max6675 thermocouple converter
 driver
Date: Tue, 4 Aug 2015 09:18:56 -0400
Message-ID: <20150804131856.GM15004@beef>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
 <1438635410-3757-3-git-send-email-mporter@konsulko.com>
 <1438680636.8734.45.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438680636.8734.45.camel-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Linux IIO List <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 04, 2015 at 11:30:36AM +0200, Paul Bolle wrote:
> On ma, 2015-08-03 at 16:56 -0400, Matt Porter wrote:
> > --- /dev/null
> > +++ b/drivers/iio/temperature/max6675.c
> > +static const struct spi_device_id max6675_spi_ids[] = {
> > +	{"max6675", 0},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(spi, max6675_spi_ids);
> 
> > +MODULE_ALIAS("spi:max6675");
> 
> For the "spi" alias this is "belt and suspenders":
>     modinfo ./max6675.ko | grep alias
>     alias:          spi:max6675
>     alias:          acpi*:MXIM6675:*
>     alias:          of:N*T*Cmaxim,max6675*
>     alias:          spi:max6675
> 
> I'd drop the MODULE_ALIAS().

Ok, given that it generates a redundant alias I'll drop it.

> (Mark Brown made it quite clear I shouldn't nag people about the origin
> of the various strings used in these module aliases. So I won't. But if
> you'd volunteer to explain me where "max6675" might come from for the
> spi alias that would, at least, satisfy my curiosity.)

Sure, one might hotplug in an entire SPI master and this SPI slave device
via any discoverable bus and need the alias to match the module. It's
also typically used in a board file on embedded x86 stuff where overriding
the DSDT is not desirable.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
