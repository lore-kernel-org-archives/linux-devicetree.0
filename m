Return-Path: <robherring2@gmail.com>
Date: Thu, 3 Jan 2019 15:12:40 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/12] media: i2c: mt9m001: dt: add binding for mt9m001
Message-ID: <20190103211240.GA31467@bogus>
References: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
 <1545498774-11754-3-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545498774-11754-3-git-send-email-akinobu.mita@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Dec 23, 2018 at 02:12:44AM +0900, Akinobu Mita wrote:
> Add device tree binding documentation for the MT9M001 CMOS image sensor.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/mt9m001.txt      | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/mt9m001.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9m001.txt b/Documentation/devicetree/bindings/media/i2c/mt9m001.txt
> new file mode 100644
> index 0000000..794b787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/mt9m001.txt
> @@ -0,0 +1,37 @@
> +MT9M001: 1/2-Inch Megapixel Digital Image Sensor
> +
> +The MT9M001 is an SXGA-format with a 1/2-inch CMOS active-pixel digital
> +image sensor. It is programmable through a simple two-wire serial
> +interface.

I2C?

> +
> +Required Properties:
> +
> +- compatible: shall be "onnn,mt9m001".
> +- clocks: reference to the master clock into sensor
> +
> +Optional Properties:
> +
> +- reset-gpios: GPIO handle which is connected to the reset pin of the chip.
> +  Active low.
> +- standby-gpios: GPIO handle which is connected to the standby pin of the chip.
> +  Active high.
> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.

You still need to state how many ports/endpoints and what they are.

> +
> +Example:
> +
> +	&i2c1 {
> +		mt9m001@5d {

camera-sensor@5d

> +			compatible = "onnn,mt9m001";
> +			reg = <0x5d>;
> +			reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +			standby-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +			clocks = <&camera_clk>;
> +			port {
> +				mt9m001_out: endpoint {
> +					remote-endpoint = <&vcap_in>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
