From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: new binding for Himax HX8357D display
 panels
Date: Thu, 25 Oct 2018 16:42:34 -0500
Message-ID: <20181025214234.GA5036@bogus>
References: <20181024184313.2967-1-eric@anholt.net>
 <20181024184313.2967-2-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024184313.2967-2-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 11:43:11AM -0700, Eric Anholt wrote:
> This adds a new binding for Himax HX8357D display panels. It includes
> a compatible string for one display (more can be added in the future).
> 
> The YX350HV15 panel[1] is found in the Adafruit PiTFT 3.5" Touch
> Screen for Raspberry Pi.
> 
> [1] https://learn.adafruit.com/adafruit-pitft-3-dot-5-touch-screen-for-raspberry-pi/downloads
> 
> This binding is closely modeled after the ili9341 binding, for a
> similar product from adafruit.  The primary difference is that the
> hx8367d doesn't have a reset line that I can find in the schematics.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  .../bindings/display/himax,hx8357d.txt        | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/himax,hx8357d.txt b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
> new file mode 100644
> index 000000000000..48586e570be0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/himax,hx8357d.txt
> @@ -0,0 +1,25 @@
> +Himax HX8357D display panels
> +
> +This binding is for display panels using a Himax HX8357D controller in SPI
> +mode, such as the Adafruit 3.5" TFT for Raspberry Pi.
> +
> +Required properties:
> +- compatible:	"adafruit,yx350hv15", "himax,hx8357d"
> +- dc-gpios:	D/C pin

You forgot reg. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +The node for this driver must be a child node of a SPI controller, hence
> +all mandatory properties described in ../spi/spi-bus.txt must be specified.
> +
> +Optional properties:
> +- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> +- backlight:	phandle of the backlight device attached to the panel
> +
> +Example:
> +	display@0{
> +		compatible = "adafruit,yx350hv15", "himax,hx8357d";
> +		reg = <0>;
> +		spi-max-frequency = <32000000>;
> +		dc-gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +		rotation = <90>;
> +		backlight = <&backlight>;
> +	};
> -- 
> 2.19.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
