From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] Documentation: devicetree: Add DT bindings to
 eeprom_93xx46 driver.
Date: Thu, 19 Nov 2015 08:59:22 -0600
Message-ID: <20151119145922.GA24560@rob-hp-laptop>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com>
 <1447903781-3910-3-git-send-email-cory.tusar@pid1solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447903781-3910-3-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cory Tusar <cory.tusar@pid1solutions.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org, jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 10:29:38PM -0500, Cory Tusar wrote:
> This commit documents bindings to be added to the eeprom_93xx46 driver
> which will allow:
> 
>   - Device word size and read-only attributes to be specified.
>   - A device-specific compatible string for use with Atmel AT93C46D
>     EEPROMs.
>   - Specifying a GPIO line to function as a 'select' or 'enable' signal
>     prior to accessing the EEPROM.
> 
> Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>

One nit, but:

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/misc/eeprom-93xx46.txt     | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> new file mode 100644
> index 0000000..8e116a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
> @@ -0,0 +1,25 @@
> +EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
> +
> +Required properties:
> +- compatible : shall be one of:
> +    "atmel,at93c46d"
> +    "eeprom-93xx46"
> +- data-size : number of data bits per word (either 8 or 16)
> +
> +Optional properties:
> +- read-only : parameter-less property which disables writes to the EEPROM
> +- select-gpios : if present, specifies the GPIO that will be asserted prior to
> +  each access to the EEPROM (e.g. for SPI bus multiplexing)
> +
> +Property rules described in Documentation/devicetree/bindings/spi/spi-bus.txt
> +apply.  In particular, "reg" and "spi-max-frequency" properties must be given.
> +
> +Example:
> +	93c46c@0 {

This should be eeprom@0.

> +		compatible = "eeprom-93xx46";
> +		reg = <0>;
> +		spi-max-frequency = <1000000>;
> +		spi-cs-high;
> +		data-size = <8>;
> +		select-gpios = <&gpio4 4 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 2.4.10
> 
