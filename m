From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: Add binding for Sitronix ST7735R
 display panels
Date: Fri, 8 Dec 2017 22:41:48 +0100
Message-ID: <0cade030-030c-f6da-6f79-6fbd520ad753@tronnes.org>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511924469-11448-2-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: limor@ladyada.net, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Den 29.11.2017 04.01, skrev David Lechner:
> This adds a new device tree binding for Sitronix ST7735R display panels,
> such as the Adafruit 1.8" TFT.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>   .../bindings/display/sitronix,st7735r.txt          | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>
> diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> new file mode 100644
> index 0000000..bbb8ba6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
> @@ -0,0 +1,35 @@
> +Sitronix ST7735R display panels
> +
> +This binding is for display panels using a Sitronix ST7735R controller in SPI
> +mode.
> +
> +Required properties:
> +- compatible:	"sitronix,st7735r-jd-t18003-t01"
> +- dc-gpios:	Display data/command selection (D/CX)
> +- reset-gpios:	Reset signal (RSTX)

I'm wondering if this should be optional.

Even though the display needs the reset line to be driven, it doesn't
have to be so by a gpio, I believe you can even get away with just
using a resistor as a reset circuit.

Not terribly important, it's up to you.

Noralf.


> +
> +The node for this driver must be a child node of a SPI controller, hence
> +all mandatory properties described in ../spi/spi-bus.txt must be specified.
> +
> +Optional properties:
> +- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> +- backlight:	phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
> +	}
> +
> +	...
> +
> +	display@0{
> +		compatible = "sitronix,st7735r-jd-t18003-t01";
> +		reg = <0>;
> +		spi-max-frequency = <32000000>;
> +		dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
> +		rotation = <270>;
> +		backlight = &backlight;
> +	};
