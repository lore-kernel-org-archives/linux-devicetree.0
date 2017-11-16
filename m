From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: display/ti: Add optional property to
 set memory bandwidth limit
Date: Wed, 15 Nov 2017 22:37:43 -0600
Message-ID: <20171116043743.fawfoaij4pvv2fxk@rob-hp-laptop>
References: <20171114124755.14277-1-peter.ujfalusi@ti.com>
 <20171114124755.14277-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171114124755.14277-2-peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 14, 2017 at 02:47:53PM +0200, Peter Ujfalusi wrote:
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

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
