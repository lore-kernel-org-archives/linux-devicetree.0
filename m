From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/6] dt-bindings: display: bridge: Add
 ICN6211 MIPI-DSI to RGB converter bridge
Date: Fri, 14 Jun 2019 11:40:36 -0600
Message-ID: <20190614174036.GA31068@bogus>
References: <20190524104317.20287-1-jagan@amarulasolutions.com>
 <20190524104317.20287-2-jagan@amarulasolutions.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBGFYR7UAKGQE6X6BWPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190524104317.20287-2-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 04:13:15PM +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> It has a flexible configuration of MIPI DSI signal input
> and produce RGB565, RGB666, RGB888 output format.
> 
> Add dt-bingings for it.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../display/bridge/chipone,icn6211.txt        | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> new file mode 100644
> index 000000000000..53a9848ef8b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> @@ -0,0 +1,78 @@
> +Chipone ICN6211 MIPI-DSI to RGB Converter Bridge
> +
> +ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> +It has a flexible configuration of MIPI DSI signal input
> +and produce RGB565, RGB666, RGB888 output format.
> +
> +Required properties for RGB:
> +- compatible: must be "chipone,icn6211"
> +- reg: the virtual channel number of a DSI peripheral
> +- reset-gpios: a GPIO phandle for the reset pin
> +
> +The device node can contain following 'port' child nodes,
> +according to the OF graph bindings defined in [1]:
> +  0: DSI Input, not required, if the bridge is DSI controlled
> +  1: RGB Output, mandatory
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel {
> +		compatible = "bananapi,s070wv20-ct16", "simple-panel";

'simple-panel' is not a valid compatible string.

> +		enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
> +		backlight = <&backlight>;
> +
> +		port {
> +			panel_out_bridge: endpoint {
> +				remote-endpoint = <&bridge_out_panel>;
> +			};
> +		};
> +	};
> +
> +&dsi {
> +	vcc-dsi-supply = <&reg_dcdc1>;		/* VCC-DSI */
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		dsi_out: port@0 {
> +			reg = <0>;
> +
> +			dsi_out_bridge: endpoint {
> +				remote-endpoint = <&bridge_out_dsi>;
> +			};
> +		};
> +	};
> +
> +	bridge@0 {
> +		compatible = "chipone,icn6211";
> +		reg = <0>;
> +		reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge_in: port@0 {
> +				reg = <0>;
> +
> +				bridge_out_dsi: endpoint {
> +					remote-endpoint = <&dsi_out_bridge>;
> +				};
> +			};
> +
> +			bridge_out: port@1 {
> +				reg = <1>;
> +
> +				bridge_out_panel: endpoint {
> +					remote-endpoint = <&panel_out_bridge>;
> +				};
> +			};
> +		};
> +	};
> +};
> -- 
> 2.18.0.321.gffc6fa0e3
> 
