From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 4/9] dt-bindings: Add ANX6345 DP/eDP
 transmitter binding
Date: Thu, 18 Oct 2018 11:53:16 +0300
Message-ID: <1886367.eljNk7jKYl@avalon>
References: <20181018073327.64942-1-icenowy@aosc.io> <20181018073327.64942-5-icenowy@aosc.io>
Reply-To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDKM3GOS4YHBB5ETUHPAKGQE2RIFR4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181018073327.64942-5-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

Thank you for the patch.

On Thursday, 18 October 2018 10:33:22 EEST Icenowy Zheng wrote:
> The ANX6345 is an ultra-low power DisplayPort/eDP transmitter designed
> for portable devices.
> 
> Add a binding document for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  .../bindings/display/bridge/anx6345.txt       | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/anx6345.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.txt
> b/Documentation/devicetree/bindings/display/bridge/anx6345.txt new file
> mode 100644
> index 000000000000..0689d4eb5f65
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
> @@ -0,0 +1,39 @@
> +Analogix ANX6345 eDP Transmitter
> +--------------------------------
> +
> +The ANX6345 is an ultra-low power Full-HD eDP transmitter designed for
> +portable devices.
> +
> +Required properties:
> +
> + - compatible		: "analogix,anx6345"
> + - reg			: I2C address of the device
> + - reset-gpios		: Which GPIO to use for reset
> +
> +Optional properties:
> +
> + - dvdd12-supply	: Regulator for 1.2V digital core power.
> + - dvdd25-supply	: Regulator for 2.5V digital core power.

Shouldn't these to supplies be mandatory ?

> + - panel-supply		: Regulator for the power of the panel.

Shouldn't the panel supply for specified in the DT node of the panel ?

> + - edid			: verbatim EDID data block describing attached
> +			  panel, only used when the panel has no EDID info.

This should also be specified in the panel DT node.

> + - Video port for RGB input, using the DT bindings defined in [1].

I think you should also add a port for the output.

> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +anx6345: anx6345@38 {
> +	compatible = "analogix,anx6345";
> +	reg = <0x38>;
> +	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
> +	panel-supply = <&reg_dc1sw>;
> +	dvdd25-supply = <&reg_dldo2>;
> +	dvdd12-supply = <&reg_fldo1>;
> +
> +	port {
> +		anx6345_in: endpoint {
> +			remote-endpoint = <&tcon0_out_anx6345>;
> +		};
> +	};
> +};

-- 
Regards,

Laurent Pinchart
