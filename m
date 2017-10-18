From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: media: xilinx: fix typo in example
Date: Wed, 18 Oct 2017 19:08:17 +0300
Message-ID: <1546677.fKvj0pB9W9@avalon>
References: <1507824214-17744-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507824214-17744-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JsYNTwtnfakRB7SZvlqPiA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Akinobu,

Thank you for the patch.

On Thursday, 12 October 2017 19:03:34 EEST Akinobu Mita wrote:
> Fix typo s/:/;/
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Good catch.

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Should I take this patch in my tree ?

> ---
>  Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
> b/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt index
> 9dd86b3..439351a 100644
> --- a/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
> +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,v-tpg.txt
> @@ -66,6 +66,6 @@ Example:
>  				tpg1_out: endpoint {
>  					remote-endpoint = <&switch_in0>;
>  				};
> -			}:
> +			};
>  		};
>  	};


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
