From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/ti: Add optional property to
 set memory bandwidth limit
Date: Thu, 26 Oct 2017 21:27:11 -0500
Message-ID: <20171027022711.624bnvldhfdq4rew@rob-hp-laptop>
References: <20171020131258.4092-1-peter.ujfalusi@ti.com>
 <20171020131258.4092-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171020131258.4092-2-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 04:12:56PM +0300, Peter Ujfalusi wrote:
> max-memory-bandwidth can be used to specify the maximum bandwidth dispc
> can use when reading display data from main memory.
> 
> In some SoC (am437x for example) we have memory bandwidth limitation
> which causes underflow in the display subsystem.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt  | 5 +++++
>  Documentation/devicetree/bindings/display/ti/ti,omap2-dss.txt | 4 ++++
>  Documentation/devicetree/bindings/display/ti/ti,omap3-dss.txt | 4 ++++
>  Documentation/devicetree/bindings/display/ti/ti,omap4-dss.txt | 4 ++++
>  Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++++
>  5 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
> index c30f9ec189ed..91279f1060fe 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
> +++ b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
> @@ -47,6 +47,11 @@ Required properties:
>  - clocks: handle to fclk
>  - clock-names: "fck"
>  
> +Optional properties:
> +- max-memory-bandwidth: Input memory (from main memory to dispc) bandwidth limit
> +			in bytes per second

Can we move this to a common location since we already have the same 
prop for ARM pl11x.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
