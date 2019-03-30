From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v7 2/3] iio:temperature:max31856:Add device tree bind
 info
Date: Sat, 30 Mar 2019 16:43:38 +0000
Message-ID: <20190330164338.620238b9@archlinux>
References: <20190326111842.12399-1-patrick.havelange@essensium.com>
        <20190326111842.12399-2-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326111842.12399-2-patrick.havelange@essensium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Havelange <patrick.havelange@essensium.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, Matt Weber <matthew.weber@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Mar 2019 12:18:41 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch added device tree binding info for MAX31856 driver.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan

> ---
> Changes
> v1 -> v2
> [Matt
>  - Removed comment block and added possibilities of
>    thermocouple type in device tree binding doc.
> 
> v2 -> v3
>  - Rebased
> 
> v3 -> v4
>  - Removed one-shot property related information.
>  - Used standard name 'temp-sensor'
> 
> v4 -> v5
> [Patrick
>  - Rename thermocouple type to maxim,thermocouple-type for DT entry
> 
> v5 -> v6
> [Patrick
>  - use generic thermocouple-type for DT entry
> 
> v6 -> v7
> [Patrick
>  - None
> ---
>  .../bindings/iio/temperature/max31856.txt     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/max31856.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/temperature/max31856.txt b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> new file mode 100644
> index 000000000000..06ab43bb4de8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> @@ -0,0 +1,24 @@
> +Maxim MAX31856 thermocouple support
> +
> +https://datasheets.maximintegrated.com/en/ds/MAX31856.pdf
> +
> +Optional property:
> +	- thermocouple-type: Type of thermocouple (THERMOCOUPLE_TYPE_K if
> +		omitted). Supported types are B, E, J, K, N, R, S, T.
> +
> +Required properties:
> +	- compatible: must be "maxim,max31856"
> +	- reg: SPI chip select number for the device
> +	- spi-max-frequency: As per datasheet max. supported freq is 5000000
> +	- spi-cpha: must be defined for max31856 to enable SPI mode 1
> +
> +	Refer to spi/spi-bus.txt for generic SPI slave bindings.
> +
> + Example:
> +	temp-sensor@0 {
> +		compatible = "maxim,max31856";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		spi-cpha;
> +		thermocouple-type = <THERMOCOUPLE_TYPE_K>;
> +	};
