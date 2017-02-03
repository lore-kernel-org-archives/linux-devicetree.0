From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH RESEND v7 1/2] Add OV5647 device tree documentation
Date: Fri, 3 Feb 2017 22:19:18 +0200
Message-ID: <20170203201917.GB18086@kekkonen.localdomain>
References: <cover.1486136893.git.roliveir@synopsys.com>
 <d1dc3b91af73fbcfcae54fdc80cb38389cc9bacf.1486136893.git.roliveir@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d1dc3b91af73fbcfcae54fdc80cb38389cc9bacf.1486136893.git.roliveir@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ramiro Oliveira <Ramiro.Oliveira@synopsys.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, CARLOS.PALMINHA@synopsys.com, Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Hans Verkuil <hans.verkuil@cisco.com>, Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Ramiro,

On Fri, Feb 03, 2017 at 06:18:32PM +0000, Ramiro Oliveira wrote:
> Create device tree bindings documentation.
> 
> Signed-off-by: Ramiro Oliveira <roliveir@synopsys.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5647.txt       | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> new file mode 100644
> index 000000000000..57fd40036c26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
> @@ -0,0 +1,35 @@
> +Omnivision OV5647 raw image sensor
> +---------------------------------
> +
> +OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
> +and CCI (I2C compatible) control bus.
> +
> +Required properties:
> +
> +- compatible		: "ovti,ov5647".
> +- reg			: I2C slave address of the sensor.
> +- clocks		: Reference to the xclk clock.
> +- clock-names		: Should be "xclk".
> +- clock-frequency	: Frequency of the xclk clock.
> +
> +The common video interfaces bindings (see video-interfaces.txt) should be
> +used to specify link to the image data receiver. The OV5647 device
> +node should contain one 'port' child node with an 'endpoint' subnode.
> +
> +Example:
> +
> +	i2c@2000 {
> +		...
> +		ov: camera@36 {
> +			compatible = "ovti,ov5647";
> +			reg = <0x36>;
> +			clocks = <&camera_clk>;
> +			clock-names = "xclk";
> +			clock-frequency = <30000000>;

For what it's worth, the spec documents the supported frequency range as
6--27 MHz. Most units could still work on frequencies slightly off the
range though.

> +			port {
> +				camera_1: endpoint {
> +					remote-endpoint = <&csi1_ep1>;
> +				};
> +			};
> +		};
> +	};

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
