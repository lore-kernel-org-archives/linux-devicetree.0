From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: bridge: lvds-transmitter:
 cleanup example
Date: Tue, 22 Jan 2019 22:45:34 +0200
Message-ID: <20190122204534.GE3264@pendragon.ideasonboard.com>
References: <20181229070649.21308-1-peda@axentia.se>
 <20181229070649.21308-3-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181229070649.21308-3-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Thank you for the patch.

On Sat, Dec 29, 2018 at 07:07:25AM +0000, Peter Rosin wrote:
> Drop #address-cells and #size-cells from the root node in the
> example, they are unused.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Peter Rosin <peda@axentia.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> index fd39ad34c383..36ce07c8d8e6 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> @@ -38,8 +38,6 @@ Example
>  
>  lvds-encoder {
>  	compatible = "lvds-encoder";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
>  
>  	ports {
>  		#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
