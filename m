Return-Path: <SRS0=5kAC=QL=gmail.com=festevam@kernel.org>
MIME-Version: 1.0
References: <20190204170012.13617-1-rui.silva@linaro.org> <20190204170012.13617-2-rui.silva@linaro.org>
In-Reply-To: <20190204170012.13617-2-rui.silva@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 4 Feb 2019 16:16:53 -0200
Message-ID: <CAOMZO5A80yZmE36s1QFX=8uuZ4ctdTVSUoJYUj49t2HcbOKCjQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: gyro: add DT bindings to fxas2100x
Content-Type: text/plain; charset="UTF-8"
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rui,

On Mon, Feb 4, 2019 at 3:25 PM Rui Miguel Silva <rui.silva@linaro.org> wrote:
>
> Add device tree bindings for the FXAS2100x gyroscope.

Please name it after the real part number: FXAS21002.

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

We usually don't put x in the end. Better put the real part number
instead: "nxp,fxas21002"


> +  - reg : the I2C address of the sensor

Please describe the VDD and VDDIO regulators as well in the
dt-bindings and also add support for enabling them in the driver.
