From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: gpu: add Allwinner H6 Mali
 Midgard binding
Date: Tue, 11 Dec 2018 16:11:26 -0600
Message-ID: <20181211221126.GA12250@bogus>
References: <20181127074249.15204-1-icenowy@aosc.io>
 <20181127074249.15204-2-icenowy@aosc.io>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBEHMYDQAKGQECSPS64Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20181127074249.15204-2-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 03:42:49PM +0800, Icenowy Zheng wrote:
> Allwinner H6 SoC uses a Mali T720 GPU, which is one of the GPUs in the
> Midgard GPU product line.
> 
> Add binding for the H6 Mali Midgard GPU.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> index 02f870cd60e6..c897dd7be48f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -18,6 +18,7 @@ Required properties:
>      + "amlogic,meson-gxm-mali"
>      + "rockchip,rk3288-mali"
>      + "rockchip,rk3399-mali"
> +    + "allwinner,sun50i-h6-mali"
>  
>  - reg : Physical base address of the device and length of the register area.
>  
> @@ -44,6 +45,18 @@ Optional properties:
>    for details.
>  
>  
> +Vendor-specific bindings
> +------------------------
> +
> +The Mali GPU is integrated very differently from one SoC to
> +another. In order to accomodate those differences, you have the option

WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?                                                      
#50: FILE: Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt:52:                                             

> +to specify one more vendor-specific compatible, among:
> +
> +  - allwinner,sun50i-h6-mali
> +    Required properties:
> +      * resets: phandle to the reset line for the GPU
> +
> +
>  Example for a Mali-T760:
>  
>  gpu@ffa30000 {
> -- 
> 2.18.1
> 
