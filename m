From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS
 display support
Date: Fri, 2 Aug 2019 11:00:14 +0300
Message-ID: <20190802080014.GD5008@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Fri, Aug 02, 2019 at 08:34:00AM +0100, Fabrizio Castro wrote:
> Dual-link LVDS displays have two ports, therefore document this
> with the bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  .../bindings/display/panel/panel-lvds.txt          | 91 ++++++++++++++++------
>  1 file changed, 67 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> index 250850a..07795441 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> @@ -41,7 +41,8 @@ Required nodes:
>  
>  - panel-timing: See panel-common.txt.
>  - ports: See panel-common.txt. These bindings require a single port subnode
> -  corresponding to the panel LVDS input.
> +  (for a single link display) or two port subnodes (for a dual link display)
> +  corresponding to the panel LVDS input(s).

I think you should expand this a bit to explain what the ports
correspond to in the dual link mode.

>  LVDS data mappings are defined as follows.
> @@ -92,30 +93,72 @@ CTL3: 0
>  Example
>  -------
>  
> -panel {
> -	compatible = "mitsubishi,aa121td01", "panel-lvds";
> -
> -	width-mm = <261>;
> -	height-mm = <163>;
> -
> -	data-mapping = "jeida-24";
> -
> -	panel-timing {
> -		/* 1280x800 @60Hz */
> -		clock-frequency = <71000000>;
> -		hactive = <1280>;
> -		vactive = <800>;
> -		hsync-len = <70>;
> -		hfront-porch = <20>;
> -		hback-porch = <70>;
> -		vsync-len = <5>;
> -		vfront-porch = <3>;
> -		vback-porch = <15>;
> +Single port:
> +	panel {
> +		compatible = "mitsubishi,aa121td01", "panel-lvds";
> +
> +		width-mm = <261>;
> +		height-mm = <163>;
> +
> +		data-mapping = "jeida-24";
> +
> +		panel-timing {
> +			/* 1280x800 @60Hz */
> +			clock-frequency = <71000000>;
> +			hactive = <1280>;
> +			vactive = <800>;
> +			hsync-len = <70>;
> +			hfront-porch = <20>;
> +			hback-porch = <70>;
> +			vsync-len = <5>;
> +			vfront-porch = <3>;
> +			vback-porch = <15>;
> +		};
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds_encoder>;
> +			};
> +		};
>  	};
>  
> -	port {
> -		panel_in: endpoint {
> -			remote-endpoint = <&lvds_encoder>;
> +Two ports:
> +	panel {
> +		compatible = "advantech,idk-2121wr", "panel-lvds";
> +
> +		width-mm = <476>;
> +		height-mm = <268>;
> +
> +		data-mapping = "vesa-24";
> +
> +		panel-timing {
> +			clock-frequency = <148500000>;
> +			hactive = <1920>;
> +			vactive = <1080>;
> +			hsync-len = <44>;
> +			hfront-porch = <88>;
> +			hback-porch = <148>;
> +			vfront-porch = <4>;
> +			vback-porch = <36>;
> +			vsync-len = <5>;
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds0_panel_in: endpoint {

I would name the label panel_in0 and panel_in1 below to have a common
prefix showing that both refer to the same panel.

> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				lvds1_panel_in: endpoint {
> +					remote-endpoint = <&lvds1_out>;
> +				};
> +			};
>  		};
>  	};
> -};

-- 
Regards,

Laurent Pinchart
