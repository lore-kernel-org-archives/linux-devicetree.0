From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Date: Fri, 5 Jul 2019 19:23:38 +0200
Message-ID: <20190705172338.GB2788@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jeffrey.

On Fri, Jul 05, 2019 at 09:56:55AM -0700, Jeffrey Hugo wrote:
> The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> new file mode 100644
> index 000000000000..3938c2847fe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> @@ -0,0 +1,27 @@
> +Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
> +
> +Required properties:
> +- compatible: should be "sharp,ld-d5116z01b"
> +- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
> +
> +This binding is compatible with the simple-panel binding.
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [1]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel: panel {
> +		compatible = "sharp,ld-d5116z01b";
> +		power-supply = <&vlcd_3v3>;
> +		no-hpd
The binding do not mention no-hpd - but it is part of panel-simple
binding. Is it included in the example for any special reason?

Also there is a syntax error, ";" is missing.


	Sam

> +
> +		port {
> +			panel_ep: endpoint {
> +				remote-endpoint = <&bridge_out_ep>;
> +			};
> +		};
> +	};
> -- 
> 2.17.1
