From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 4/6] dt-bindings: clock: mediatek: add "simple-mfd" in
 audsys documentation
Date: Fri, 5 Jan 2018 13:02:36 -0600
Message-ID: <20180105190236.bapetnwxd6dii7re@rob-hp-laptop>
References: <cover.1515038387.git.ryder.lee@mediatek.com>
 <bd1cb0aeaf07b4bf2cedbf00ef8fedc6ba01f9cb.1515038387.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bd1cb0aeaf07b4bf2cedbf00ef8fedc6ba01f9cb.1515038387.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 03:44:20PM +0800, Ryder Lee wrote:
> Add "simple-mfd" to support MFD device and add a compatible string for MT2701.
> 
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  .../bindings/arm/mediatek/mediatek,audsys.txt       | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> index 9b8f578..6e97552 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
> @@ -6,17 +6,25 @@ The MediaTek AUDSYS controller provides various clocks to the system.
>  Required Properties:
>  
>  - compatible: Should be one of:
> -	- "mediatek,mt7622-audsys", "syscon"
> +	- "mediatek,mt2701-audsys", "syscon", "simple-mfd"
> +	- "mediatek,mt7622-audsys", "syscon", "simple-mfd"
>  - #clock-cells: Must be 1

I don't think this is a simple-mfd. The AFE uses clocks created by its 
parent, right? So the parent should be probed first. You should have 
the parent instantiate the child nodes.

>  The AUDSYS controller uses the common clk binding from
>  Documentation/devicetree/bindings/clock/clock-bindings.txt
>  The available clocks are defined in dt-bindings/clock/mt*-clk.h.
>  
> +See ../sound/mt2701-afe-pcm.txt for details about required subnode.
> +
>  Example:
>  
> -audsys: audsys@11220000 {
> -	compatible = "mediatek,mt7622-audsys", "syscon";
> -	reg = <0 0x11220000 0 0x1000>;
> -	#clock-cells = <1>;
> -};
> +	audsys: audio-subsystem@11220000 {
> +		compatible = "mediatek,mt2701-audsys", "syscon", "simple-mfd";
> +		reg = <0 0x11220000 0 0x1000>;
> +		#clock-cells = <1>;
> +
> +		afe: audio-controller {
> +			compatible = "mediatek,mt2701-audio";
> +			...
> +		};
> +	};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
