From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC resend 1/4] dt-bindings: display: mediatek: add drm binding
Date: Thu, 19 Oct 2017 15:53:37 +0300
Message-ID: <8477650.BPhWpTmuMS@avalon>
References: <20171019112610.13645-1-mbrugger@suse.com> <20171019112610.13645-2-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171019112610.13645-2-mbrugger-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

Thank you for the patch.

On Thursday, 19 October 2017 14:26:07 EEST Matthias Brugger wrote:
> DRM subysystem and clock driver shared the same compatible mmsys.
> This stopped does not work, as only the first driver for a compatible
> gets probed. We change the comaptible to the new DRM identifier to fix
> this.
> 
> Signed-off-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt          | 6 +++
>  1 file changed, 6 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 383183a89164..6db652463e64 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -27,6 +27,7 @@
> Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
> 
>  Required properties (all function blocks):
>  - compatible: "mediatek,<chip>-disp-<function>", one of
> +	"mediatek,<chip>-dispsys"    - central component for the DRM system
>  	"mediatek,<chip>-disp-ovl"   - overlay (4 layers, blending, csc)
>  	"mediatek,<chip>-disp-rdma"  - read DMA / line buffer
>  	"mediatek,<chip>-disp-wdma"  - write DMA
> @@ -71,6 +72,11 @@ mmsys: clock-controller@14000000 {
>  	#clock-cells = <1>;
>  };
> 
> +dispsys: display-system {
> +	compatible = "mediatek,mt2701-dispsys";
> +	mediatek,mmsys = <&mmsys>;
> +}

So this node doesn't correspond to an IP core but is meant as a top-level 
entry point for the operating system. This leads me to three questions.

1. Is there any IP core in the Mediatek display subsystem that could be 
considered (or at least used) as a top-level entry point ? That would be my 
preferred solution as I'm not fond of DT nodes not describing hardware.

2. If there's no such IP core, are all the display subsystem IP cores grouped 
together in one MMIO register range ? If so we could move them as children of 
this new display system node which, even if doesn't describe an IP core, would 
describe the way the display IP cores are grouped in the hardware, and would 
thus be a hardware description.

3. If the answer to the second question is also negative, shouldn't this 
display system node reference all other display IP DT nodes (through direct 
phandles and/or OF graph bindings) ?

>  ovl0: ovl@1400c000 {
>  	compatible = "mediatek,mt8173-disp-ovl";
>  	reg = <0 0x1400c000 0 0x1000>;

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
