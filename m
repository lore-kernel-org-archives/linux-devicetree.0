Return-Path: <SRS0=fvBO=QN=huawei.com=jonathan.cameron@kernel.org>
Date: Wed, 6 Feb 2019 12:53:54 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v2 1/5] iio: gyro: add DT bindings to fxas21002
Message-ID: <20190206125354.0000214e@huawei.com>
In-Reply-To: <20190205174333.17672-2-rui.silva@linaro.org>
References: <20190205174333.17672-1-rui.silva@linaro.org>
	<20190205174333.17672-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 5 Feb 2019 17:43:29 +0000
Rui Miguel Silva <rui.silva@linaro.org> wrote:

> Add device tree bindings for the FXAS21002 gyroscope.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../bindings/iio/gyroscope/fxas2100x.txt       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> new file mode 100644
> index 000000000000..df10a60aa533
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> @@ -0,0 +1,18 @@
> +* NXP FXAS2100X Gyroscope device tree bindings
> +
> +http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
> +
> +Required properties:
> +  - compatible : should be "nxp,fxas21002"
> +  - reg : the I2C address of the sensor

Given you provide spi support that might need expanding upon...


> +  - vdd-supply: phandle to the regulator that provides power to the sensor.
> +  - vddio-supply: phandle to the regulator that provides power to the bus.
> +
> +Example:
> +
> +fxas21002@20 {
> +	compatible = "nxp,fxas21002";
> +	reg = <0x20>;
> +	vdd-supply = <&reg_peri_3p15v>;
> +	vddio-supply = <&reg_peri_3p15v>;
> +};
