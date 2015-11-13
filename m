From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv5 2/3] devicetree: Add new ANX7814 SlimPort transmitter
 binding.
Date: Fri, 13 Nov 2015 08:37:36 -0600
Message-ID: <20151113143736.GA14327@rob-hp-laptop>
References: <1447416064-24989-1-git-send-email-enric.balletbo@collabora.com>
 <1447416064-24989-3-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447416064-24989-3-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com, djkurtz@chromium.org, drinkcat@chromium.org, laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com, jb.tsai@mediatek.com, cawa.cheng@mediatek.com, eddie.huang@mediatek.com, cjiao@analogixsemi.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 13, 2015 at 01:01:03PM +0100, Enric Balletbo i Serra wrote:
> The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> designed for portable devices.
> 
> You can add support to your board with current binding.
> 
> Example:
> 
> 	anx7814: anx7814@38 {
> 		compatible = "analogix,anx7814";
> 		reg = <0x38>;
> 		pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> 		reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> 	};
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../devicetree/bindings/video/bridge/anx7814.txt   | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
> 
> diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> new file mode 100644
> index 0000000..f7bdca9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
> @@ -0,0 +1,36 @@
> +Analogix ANX7814 SlimPort (Full-HD Transmitter)
> +-----------------------------------------------
> +
> +The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
> +designed for portable devices.
> +
> +Required properties:
> +
> + - compatible		: "analogix,anx7814"
> + - reg			: I2C address of the device
> + - cable-det-gpios	: Which GPIO to use for cable detection

Shouldn't this be an interrupt instead (to a gpio controller still)?

> + - pd-gpios		: Which GPIO to use for power down
> + - reset-gpios		: Which GPIO to use for reset
> +
> +Optional properties:
> +
> + - v10-gpios	: Which GPIO to use for V10 control.
> + - video interfaces: Device node can contain video interface port nodes.

Please specify how many ports and how many endpoints for each port.

> +
> +Example:
> +
> +	anx7814: anx7814@38 {
> +		compatible = "analogix,anx7814";
> +		reg = <0x38>;
> +		cable-det-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +		pd-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> +		v10-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +		ports {
> +			port@0 {

Either simplify to just port (dropping ports) or add a reg property 
here.

> +				anx7814_in: endpoint {
> +					remote-endpoint = <&hdmi0_out>;
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.1.0
> 
