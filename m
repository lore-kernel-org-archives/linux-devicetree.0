From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/7] misc: eeprom: 93xx46: Add DT bindings to
 eeprom_93xx46 driver.
Date: Tue, 17 Nov 2015 14:53:21 -0600
Message-ID: <20151117205321.GA7718@rob-hp-laptop>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447733796-15546-3-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447733796-15546-3-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 11:16:31PM -0500, Cory Tusar wrote:
> This commit documents bindings to be added to the eeprom_93xx46 driver
> which allow device word size and read-only attributes to be specified
> via devicetree.
> 
> Currently the only supported device is a generic "eeprom-93xx46", which
> mirrors the configuration options previously available as a platform
> device.
> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> ---
>  .../devicetree/bindings/misc/eeprom-93xx46.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> new file mode 100644
> index 0000000..ba493a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> @@ -0,0 +1,20 @@
> +EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
> +
> +Required properties:
> +- compatible : "eeprom-93xx46"

This should also have a compatible with the actual manufacturer.

> +- data-size : number of data bits per word (either 8 or 16)
> +
> +Optional properties:
> +- read-only : parameter-less property which disables writes to the EEPROM
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
> +
> +Example:
> +	93c46c@0 {
> +		compatible = "eeprom-93xx46";
> +		reg = <0>;
> +		spi-max-frequency = <1000000>;
> +		spi-cs-high;
> +		data-size = <8>;
> +	};
> -- 
> 2.4.10
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
