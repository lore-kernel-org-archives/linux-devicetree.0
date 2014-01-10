From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] gpio: mcp23s08: Add irq functionality for i2c chips
Date: Fri, 10 Jan 2014 16:08:36 +0100
Message-ID: <20140110150836.GZ20094@book.gsilab.sittig.org>
References: <1389363750-25989-1-git-send-email-larsi@wh2.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389363750-25989-1-git-send-email-larsi-myOXECIRRCL4ajHJ1XSv27NAH6kLmebB@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars Poeschel <larsi-myOXECIRRCL4ajHJ1XSv27NAH6kLmebB@public.gmane.org>
Cc: poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 10, 2014 at 15:22 +0100, Lars Poeschel wrote:
> 
> --- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
> @@ -38,12 +38,37 @@ Required device specific properties (only for SPI chips):
>      removed.
>  - spi-max-frequency = The maximum frequency this chip is able to handle
>  
> -Example I2C:
> +Optional properties:
> +- #interrupt-cells : Should be two.
> +  - first cell is the pin number
> +  - second cell is used to specify flags.
> +- interrupt-controller: Marks the device node as a interrupt controller.
> +NOTE: The interrupt functionality is only supported for i2c versions of the
> +chips yet.

Is this "IRQ feature for I2C chips only" limitation specific to
the hardware or an implementation detail of the Linux driver?  I
could not determine this from either the binding text nor the
driver source.

If it's just the status of the Linux driver, then it should not
be in the binding document.  If it's a limitation of the
hardware, then it's appropriate in the binding but I suggest to
adjust the text to avoid the next person to ask the same
question. :)


> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -697,6 +697,7 @@ config GPIO_MCP23S08
>  	  SPI/I2C driver for Microchip MCP23S08/MCP23S17/MCP23008/MCP23017
>  	  I/O expanders.
>  	  This provides a GPIO interface supporting inputs and outputs.
> +	  The I2C versions of the chips can be used as interrupt-controller.
>  
>  config GPIO_MC33880
>  	tristate "Freescale MC33880 high-side/low-side switch"
> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
> index 2deb0c5..1346ea6 100644
> --- a/drivers/gpio/gpio-mcp23s08.c
> +++ b/drivers/gpio/gpio-mcp23s08.c
> @@ -1,5 +1,10 @@
>  /*
> - * MCP23S08 SPI/GPIO gpio expander driver
> + * MCP23S08 SPI/I2C GPIO gpio expander driver
> + *
> + * The inputs and outputs of the mcp23s08, mcp23s17, mcp23008 and mcp23017 are
> + * supported.
> + * For the I2C versions of the chips (mcp23008 and mcp23017) generation of
> + * interrupts is also supported.
>   */

Adjust these as well to reflect whether it's hardware or software
which limits the feature.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
