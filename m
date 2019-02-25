Return-Path: <robherring2@gmail.com>
Date: Mon, 25 Feb 2019 15:29:15 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] iio: gyro: add DT bindings to fxas2100x
Message-ID: <20190225212915.GA15828@bogus>
References: <20190204170012.13617-1-rui.silva@linaro.org>
 <20190204170012.13617-2-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190204170012.13617-2-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 04, 2019 at 05:00:08PM +0000, Rui Miguel Silva wrote:
> Add device tree bindings for the FXAS2100x gyroscope.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  .../bindings/iio/gyroscope/fxas2100x.txt           | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> new file mode 100644
> index 000000000000..2aeef9aafec4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
> @@ -0,0 +1,14 @@
> +* NXP FXAS2100X Gyroscope device tree bindings
> +
> +http://www.nxp.com/products/sensors/gyroscopes/3-axis-digital-gyroscope:FXAS21002C
> +
> +Required properties:
> +  - compatible : should be "nxp,fxas2100x"
> +  - reg : the I2C address of the sensor
> +
> +Example:
> +
> +fxas2100x@20 {

gyroscope@20

in addition to what's already been mentioned.

> +	compatible = "nxp,fxas2100x"
> +	reg = <0x20>;
> +};
> -- 
> 2.20.1
> 
