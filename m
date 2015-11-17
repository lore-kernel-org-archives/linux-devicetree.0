From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/7] misc: eeprom: 93xx46: Add DT binding for a GPIO
 'select' line.
Date: Tue, 17 Nov 2015 14:59:01 -0600
Message-ID: <20151117205901.GA10669@rob-hp-laptop>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447733796-15546-7-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447733796-15546-7-git-send-email-cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, afd-l0cyMroinI0@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 11:16:35PM -0500, Cory Tusar wrote:
> This commit documents an additional devicetree binding in the
> eeprom_93x46 driver allowing a GPIO line to function as a 'select'
> or 'enable' signal prior to accessing the EEPROM.

You can just fold all the DT binding patches into 1. They don't have to 
match up to driver changes.

> 
> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/misc/eeprom-93xx46.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> index 34a0cc2..75b16f4 100644
> --- a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> @@ -6,6 +6,8 @@ Required properties:
>  
>  Optional properties:
>  - read-only : parameter-less property which disables writes to the EEPROM
> +- select-gpio : if present, specifies the GPIO that will be asserted prior to
> +  each access to the EEPROM (e.g. for SPI bus multiplexing)

This should be "select-gpios".

>  
>  Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
>  apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
> @@ -17,4 +19,5 @@ Example:
>  		spi-max-frequency = <1000000>;
>  		spi-cs-high;
>  		data-size = <8>;
> +		select-gpio = <&gpio4 4 GPIO_ACTIVE_HIGH>;
>  	};
> -- 
> 2.4.10
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
