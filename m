From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add King Display KD035G6-54NT
 panel documentation
Date: Sun, 2 Jun 2019 20:23:19 +0200
Message-ID: <20190602182319.GA10060@ravnborg.org>
References: <20190602164844.15659-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190602164844.15659-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

Hi Paul.

As already said on irc, maybe add:

"The generic bindings for the SPI slaves documented in [1] also applies"
as we see other binding using spi already does.

Looking at: sitronix,st7789v.txt
should reg also be specified as required here?

	Sam

On Sun, Jun 02, 2019 at 06:48:43PM +0200, Paul Cercueil wrote:
> The KD035G6-54NT is a 3.5" 320x240 24-bit TFT LCD panel.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../panel/kingdisplay,kd035g6-54nt.txt        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
> new file mode 100644
> index 000000000000..a6e4a9af4925
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54nt.txt
> @@ -0,0 +1,27 @@
> +King Display KD035G6-54NT 3.5" (320x240 pixels) 24-bit TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "kingdisplay,kd035g6-54nt"
> +- power-supply: See panel-common.txt
> +- reset-gpios: See panel-common.txt
> +
> +Optional properties:
> +- backlight: see panel-common.txt
> +
> +Example:
> +
> +&spi {
> +	display-panel {
> +		compatible = "kingdisplay,kd035g6-54nt";
> +		reg = <0>;
> +
> +		spi-max-frequency = <3125000>;
> +		spi-3wire;
> +		spi-cs-high;
> +
> +		reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
> +
> +		backlight = <&backlight>;
> +		power-supply = <&ldo6>;
> +	};
> +};
> -- 
> 2.21.0.593.g511ec345e18
