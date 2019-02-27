From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] iio:temperature:max31856:Add device tree bind info
Date: Wed, 27 Feb 2019 17:59:47 -0600
Message-ID: <20190227235947.GA27130@bogus>
References: <20190226150214.19467-1-patrick.havelange@essensium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190226150214.19467-1-patrick.havelange@essensium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Havelange <patrick.havelange@essensium.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, Matt Weber <matthew.weber@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 04:02:13PM +0100, Patrick Havelange wrote:
> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This patch added device tree binding info for MAX31856 driver.
> 
> Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
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
> ---
>  .../bindings/iio/temperature/max31856.txt     | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/temperature/max31856.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/temperature/max31856.txt b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> new file mode 100644
> index 000000000000..b4396069b8fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> @@ -0,0 +1,29 @@
> +Maxim MAX31856 thermocouple support
> +
> +https://datasheets.maximintegrated.com/en/ds/MAX31856.pdf
> +
> +Required properties:
> +	- compatible: must be "maxim,max31856"
> +	- reg: SPI chip select number for the device
> +	- spi-max-frequency: As per datasheet max. supported freq is 5000000
> +	- spi-cpha: must be defined for max31856 to enable SPI mode 1
> +	- maxim,thermocouple-type: Type of thermocouple (By default is K-Type)
> +		0x00 : TYPE_B
> +		0x01 : TYPE_E
> +		0x02 : TYPE_J
> +		0x03 : TYPE_K (default)
> +		0x04 : TYPE_N
> +		0x05 : TYPE_R
> +		0x06 : TYPE_S
> +		0x07 : TYPE_T

These appear to be standard types. Perhaps this should be a common 
property instead?

> +
> +	Refer to spi/spi-bus.txt for generic SPI slave bindings.
> +
> + Example:
> +	temp-sensor@0 {
> +		compatible = "maxim,max31856";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		spi-cpha;
> +		maxim,thermocouple-type = <0x03>;
> +	};
> -- 
> 2.19.1
> 
