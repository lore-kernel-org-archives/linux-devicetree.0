From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: display: bridge: thc63lvdm83d: use
 standard powerdown-gpios
Date: Tue, 22 Jan 2019 22:54:49 +0200
Message-ID: <20190122205449.GG3264@pendragon.ideasonboard.com>
References: <20181229070649.21308-1-peda@axentia.se>
 <20181229070649.21308-4-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181229070649.21308-4-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

Thank you for the patch.

On Sat, Dec 29, 2018 at 07:07:31AM +0000, Peter Rosin wrote:
> The name powerdown-gpios is the standard property name for the
> functionality covered by the previous pwdn-gpios name. This rename
> should be safe to do since the linux driver supporting the binding
> (lvds-encoder.c) never implemented the property, and no dts file
> names it. At least not upstream.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> index 527e236e9a2a..fee3c88e1a17 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
> @@ -10,7 +10,7 @@ Required properties:
>  
>  Optional properties:
>  
> -- pwdn-gpios: Power down control GPIO
> +- powerdown-gpios: Power down control GPIO (the /PWDN pin, active low).
>  
>  Required nodes:
>  

-- 
Regards,

Laurent Pinchart
