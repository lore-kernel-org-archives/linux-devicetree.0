From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Update Renesas R-Car FCP DT binding
Date: Mon, 13 Jun 2016 15:17:41 +0300
Message-ID: <2159488.zJIIWenpjG@avalon>
References: <1465479695-18644-1-git-send-email-kieran@bingham.xyz> <1465479695-18644-2-git-send-email-kieran@bingham.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465479695-18644-2-git-send-email-kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kieran-7hKh/agyDeatmTQ+vhA3Yw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thursday 09 Jun 2016 14:41:32 Kieran Bingham wrote:
> The FCP driver, can also support the FCPF variant for FDP1 compatible
> processing.

With the comma dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> Signed-off-by: Kieran Bingham <kieran-SI8QzZ7I9JUn3X9lZQuFcg@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> b/Documentation/devicetree/bindings/media/renesas,fcp.txt index
> 6a12960609d8..271dcfdb5a76 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
> @@ -7,12 +7,14 @@ conversion of AXI transactions in order to reduce the
> memory bandwidth.
> 
>  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
> FCP for FDP (FCPF). Their configuration and behaviour depend on the module
> they -are paired with. These DT bindings currently support the FCPV only.
> +are paired with. These DT bindings currently support the FCPV and FCPF.
> 
>   - compatible: Must be one or more of the following
> 
>     - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
> +   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for
> FDP' - "renesas,fcpv" for generic compatible 'FCP for VSP'
> +   - "renesas,fcpf" for generic compatible 'FCP for FDP'
> 
>     When compatible with the generic version, nodes must list the
>     SoC-specific version corresponding to the platform first, followed by
> the

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
