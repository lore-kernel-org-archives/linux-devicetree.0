From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: Document Renesas R-Car FCP
 power-domains usage
Date: Fri, 10 Jun 2016 12:39:14 -0500
Message-ID: <20160610173914.GA20505@rob-hp-laptop>
References: <1465479695-18644-1-git-send-email-kieran@bingham.xyz>
 <1465479695-18644-3-git-send-email-kieran@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465479695-18644-3-git-send-email-kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 09, 2016 at 02:41:33PM +0100, Kieran Bingham wrote:
> The power domain must be specified to bring the device out of module
> standby. Document this in the example provided, so that new additions
> are not missed.
> 
> Signed-off-by: Kieran Bingham <kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> index 271dcfdb5a76..6a55f5215221 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -31,4 +31,5 @@ Device node example
>  		compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
>  		reg = <0 0xfea2f000 0 0x200>;
>  		clocks = <&cpg CPG_MOD 602>;
> +		power-domains = <&sysc R8A7795_PD_A3VP>;

This needs to be documented above too, not just the example.

>  	};
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
