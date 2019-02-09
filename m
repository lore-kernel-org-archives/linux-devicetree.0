From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 2/2] iio:dac:dac7612: device tree bindings
Date: Sat, 9 Feb 2019 16:03:51 +0000
Message-ID: <20190209160351.5654f4d1@archlinux>
References: <20190204124833.18779-1-ricardo@ribalda.com>
        <20190204124833.18779-2-ricardo@ribalda.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204124833.18779-2-ricardo@ribalda.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  4 Feb 2019 13:48:33 +0100
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Bindings for dac7612.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Simple binding so I'm happy to take with out a DT review unless someone
feels like giving one.  Seems to have answered Rob's previous comments.

Applied to the togreg branch of iio.git with the tiny tweak of dropping
the extra blank line at the end of the file.

Thanks,

Jonathan
> ---
> v4 Changelog by Rob Herring <robh@kernel.org>
> 
> -Add ti, prefix to gpio
> -Fix example da@1
> -Fix partname
> 
>  .../bindings/iio/dac/ti,dac7612.txt           | 29 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> new file mode 100644
> index 000000000000..14a66c0dcdaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
> @@ -0,0 +1,29 @@
> +* Texas Instruments Dual, 12-Bit Serial Input Digital-to-Analog Converter
> +
> +The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with guaranteed
> +12-bit monotonicity performance over the industrial temperature range.
> +Is is programmable through an SPI interface.
> +
> +The internal DACs are loaded when the LOADDACS pin is pulled down.
> +
> +http://www.ti.com/lit/ds/sbas106/sbas106.pdf
> +
> +Required Properties:
> +- compatible: Should be one of:
> +		"ti,dac7612"
> +		"ti,dac7612u"
> +		"ti,dac7612ub"
> +- reg: Definition as per Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Optional Properties:
> +- ti,loaddacs-gpios: GPIO descriptor for the LOADDACS pin.
> +- spi-*: Definition as per Documentation/devicetree/bindings/spi/spi-bus.txt
> +
> +Example:
> +
> +	dac@1 {
> +		compatible = "ti,dac7612";
> +		reg = <0x1>;
> +		ti,loaddacs-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
> +	};
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30ba5435906b..e28e5afaae16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14882,6 +14882,7 @@ M:	Ricardo Ribalda <ricardo@ribalda.com>
>  L:	linux-iio@vger.kernel.org
>  S:	Supported
>  F:	drivers/iio/dac/ti-dac7612.c
> +F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.txt
>  
>  THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
>  M:	Hans Verkuil <hverkuil@xs4all.nl>
