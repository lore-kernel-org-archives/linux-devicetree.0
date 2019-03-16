From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 11/11] staging: iio: ad7780: add device tree binding
Date: Sat, 16 Mar 2019 18:21:25 +0000
Message-ID: <20190316182125.5ba5d5fe@archlinux>
References: <cover.1552700652.git.renatogeh@gmail.com>
 <fce522fbe69b6d5ab8f06c70d18cf097f256711c.1552700652.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <fce522fbe69b6d5ab8f06c70d18cf097f256711c.1552700652.git.renatogeh@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: mark.rutland@arm.com, devel@driverdev.osuosl.org, lars@metafoo.de, pmeerw@pmeerw.net, Michael.Hennerich@analog.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, robh+dt@kernel.org, giuliano.belinassi@usp.br, stefan.popa@analog.com, knaack.h@gmx.de, alexandru.Ardelean@analog.com
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 23:16:13 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> Adds a device tree binding for the ad7780 driver.
> 
> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
Seems like a straight forward binding so applied to the togreg branch
of iio.git and pushed out as testing for the autobuilders to play with it.

Thanks,
Jonathan

> ---
>  .../bindings/iio/adc/adi,ad7780.txt           | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> new file mode 100644
> index 000000000000..440e52555349
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
> @@ -0,0 +1,48 @@
> +* Analog Devices AD7170/AD7171/AD7780/AD7781
> +
> +Data sheets:
> +
> +- AD7170:
> +	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7170.pdf
> +- AD7171:
> +	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7171.pdf
> +- AD7780:
> +	* https://www.analog.com/media/en/technical-documentation/data-sheets/ad7780.pdf
> +- AD7781:
> +	* https://www.analog.com/media/en/technical-documentation/data-sheets/AD7781.pdf
> +
> +Required properties:
> +
> +- compatible: should be one of
> +	* "adi,ad7170"
> +	* "adi,ad7171"
> +	* "adi,ad7780"
> +	* "adi,ad7781"
> +- reg: spi chip select number for the device
> +- vref-supply: the regulator supply for the ADC reference voltage
> +
> +Optional properties:
> +
> +- powerdown-gpios:  must be the device tree identifier of the PDRST pin. If
> +		    specified, it will be asserted during driver probe. As the
> +		    line is active high, it should be marked GPIO_ACTIVE_HIGH.
> +- adi,gain-gpios:   must be the device tree identifier of the GAIN pin. Only for
> +		    the ad778x chips. If specified, it will be asserted during
> +		    driver probe. As the line is active low, it should be marked
> +		    GPIO_ACTIVE_LOW.
> +- adi,filter-gpios: must be the device tree identifier of the FILTER pin. Only
> +		    for the ad778x chips. If specified, it will be asserted
> +		    during driver probe. As the line is active low, it should be
> +		    marked GPIO_ACTIVE_LOW.
> +
> +Example:
> +
> +adc@0 {
> +	compatible =  "adi,ad7780";
> +	reg =	      <0>;
> +	vref-supply = <&vdd_supply>
> +
> +	powerdown-gpios  = <&gpio 12 GPIO_ACTIVE_HIGH>;
> +	adi,gain-gpios   = <&gpio  5 GPIO_ACTIVE_LOW>;
> +	adi,filter-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
> +};
