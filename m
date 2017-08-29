From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 1/2] media:imx274 device tree binding file
Date: Tue, 29 Aug 2017 11:58:49 +0300
Message-ID: <20170829085848.atlfarekyw4h43cl@valkosipuli.retiisi.org.uk>
References: <20170829014026.26551-1-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170829014026.26551-1-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Leon Luo <leonl@leopardimaging.com>
List-Id: devicetree@vger.kernel.org

Hi Sören,

On Mon, Aug 28, 2017 at 06:40:25PM -0700, Soren Brinkmann wrote:
> From: Leon Luo <leonl@leopardimaging.com>
> 
> The binding file for imx274 CMOS sensor V4l2 driver
> 
> Signed-off-by: Leon Luo <leonl@leopardimaging.com>
> Acked-by: Sören Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  .../devicetree/bindings/media/i2c/imx274.txt       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> new file mode 100644
> index 000000000000..9154666d1149
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/imx274.txt
> @@ -0,0 +1,32 @@
> +* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
> +
> +The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
> +an active array size of 3864H x 2202V. It is programmable through I2C
> +interface. The I2C address is fixed to 0x1a as per sensor data sheet.
> +Image data is sent through MIPI CSI-2, which is configured as 4 lanes
> +at 1440 Mbps.
> +
> +
> +Required Properties:
> +- compatible: value should be "sony,imx274" for imx274 sensor

"reg"

> +
> +Optional Properties:
> +- reset-gpios: Sensor reset GPIO
> +
> +For further reading on port node refer to
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +	imx274: sensor@1a{

Any use for the reference? If not, I'd omit it. For the endpoint you'll
need it.

> +		compatible = "sony,imx274";
> +		reg = <0x1a>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reset-gpios = <&gpio_sensor 0 0>;
> +		port@0 {

"@0" is redundant here, as is reg below.

> +			reg = <0>;
> +			sensor_out: endpoint {
> +				remote-endpoint = <&csiss_in>;
> +			};
> +		};
> +	};

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi
