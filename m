From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: Add docs for AD7768-1
Date: Sat, 12 Jan 2019 18:13:40 +0000
Message-ID: <20190112181340.0efe0ea0@archlinux>
References: <1546867609-4273-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546867609-4273-1-git-send-email-stefan.popa@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Popa <stefan.popa@analog.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 7 Jan 2019 15:26:49 +0200
Stefan Popa <stefan.popa@analog.com> wrote:

> Document support for AD7768-1 Analog to Digital Converter.
> 
> Signed-off-by: Stefan Popa <stefan.popa@analog.com>

A few comments inline.

J
> ---
>  .../devicetree/bindings/iio/adc/adi,ad7768-1.txt   | 34 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
> new file mode 100644
> index 0000000..bf619fa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
> @@ -0,0 +1,34 @@
> +Analog Devices AD7768-1 ADC device driver
> +
> +Required properties for the AD7768-1:
> +
> +- compatible: Must be "adi,ad7768-1"
> +- reg: SPI chip select number for the device
> +- spi-max-frequency: Max SPI frequency to use
> +	see: Documentation/devicetree/bindings/spi/spi-bus.txt
> +- clocks: phandle to the master clock (mclk)
> +	see: Documentation/devicetree/bindings/clock/clock-bindings.txt
> +- clock-names: Must be "mclk".
> +- interrupts: IRQ line for the ADC
> +	see: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +- vref-supply: vref supply can be used as reference for conversion
> +- adi,sync-in-gpios: must be the device tree identifier of the SYNC-IN pin. A pulse
> +	is always required if the configuration is changed in any way, for example
> +	if the filter decimation rate changes. As the line is active low, it should
> +	be marked GPIO_ACTIVE_LOW.
Should mention it's also used for simultaneous sampling.  The name makes that
kind of obvious, but then the comment doesn't mention it.

There are some other potential gpios it seems.  Good to get them in the binding
now even if we don't do anything much with them.  Reset definitely.  The others
maybe not as we are only supporting the spi control mode and I can't see why
we would want to do anything different. I suppose there might be boards wired
with it set to pin mode but hopefully not.

> +
> +Example:
> +
> +	adc@0 {
> +		compatible = "adi,ad7768-1";
> +		reg = <0>;
> +		spi-max-frequency = <2000000>;
> +		spi-cpol;
> +		spi-cpha;
> +		vref-supply = <&adc_vref>;
> +		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-parent = <&gpio>;
> +		adi,sync-in-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
> +		clocks = <&ad7768_mclk>;
> +		clock-names = "mclk";
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ba3811..e5613b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -868,6 +868,7 @@ L:	linux-iio@vger.kernel.org
>  W:	http://ez.analog.com/community/linux-device-drivers
>  S:	Supported
>  F:	drivers/iio/adc/ad7768-1.c
> +F:	Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.txt
>  
>  ANALOG DEVICES INC AD9389B DRIVER
>  M:	Hans Verkuil <hans.verkuil@cisco.com>
