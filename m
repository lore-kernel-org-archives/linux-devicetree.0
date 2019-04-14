Return-Path: <jic23@kernel.org>
Date: Sun, 14 Apr 2019 14:21:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v6 1/6] iio: gyro: add DT bindings to fxas21002c
Message-ID: <20190414142100.6153ac79@archlinux>
In-Reply-To: <20190412164901.2321-2-rui.silva@linaro.org>
References: <20190412164901.2321-1-rui.silva@linaro.org>
	<20190412164901.2321-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, 12 Apr 2019 17:48:56 +0100
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Add device tree bindings for the FXAS21002C gyroscope.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to ignore.

Thanks,

Jonathan

> ---
>  .../bindings/iio/gyroscope/nxp,fxas21002c.txt | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
> new file mode 100644
> index 000000000000..465e104bbf14
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/nxp,fxas21002c.txt
> @@ -0,0 +1,31 @@
> +* NXP FXAS21002C Gyroscope device tree bindings
> +
> +http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
> +
> +Required properties:
> +  - compatible : should be "nxp,fxas21002c"
> +  - reg : the I2C address of the sensor or SPI chip select number for the
> +          device.
> +  - vdd-supply: phandle to the regulator that provides power to the sensor.
> +  - vddio-supply: phandle to the regulator that provides power to the bus.
> +
> +Optional properties:
> +  - reset-gpios : gpio used to reset the device, see gpio/gpio.txt
> +  - interrupts : device support 2 interrupts, INT1 and INT2,
> +                 the interrupts can be triggered on rising or falling edges.
> +                 See interrupt-controller/interrupts.txt
> +  - interrupt-names: should contain "INT1" or "INT2", the gyroscope interrupt
> +                     line in use.
> +  - drive-open-drain: the interrupt/data ready line will be configured
> +                      as open drain, which is useful if several sensors share
> +                      the same interrupt line. This is a boolean property.
> +                      (This binding is taken from pinctrl/pinctrl-bindings.txt)
> +
> +Example:
> +
> +gyroscope@20 {
> +	compatible = "nxp,fxas21002c";
> +	reg = <0x20>;
> +	vdd-supply = <&reg_peri_3p15v>;
> +	vddio-supply = <&reg_peri_3p15v>;
> +};
