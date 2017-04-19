From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] fpga: region: add missing DT documentation for config
 complete timeout
Date: Wed, 19 Apr 2017 10:16:03 -0700
Message-ID: <20170419171603.GA19240@tyrael.amer.corp.natinst.com>
References: <20170418134003.13830-1-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170418134003.13830-1-tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tobias,

On Tue, Apr 18, 2017 at 03:40:03PM +0200, Tobias Klauser wrote:
> Commit 42d5ec954719 ("fpga: add config complete timeout") introduced the
> config complete property but didn't include the corresponding DT binding
> documentation. Add it now.
> 
> Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Reviewed-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/fpga/fpga-region.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> index 81bf3adba24b..6db8aeda461a 100644
> --- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
> +++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
> @@ -193,6 +193,8 @@ Optional properties:
>  - region-freeze-timeout-us : The maximum time in microseconds to wait for
>  	bridges to successfully become disabled before the region has been
>  	programmed.
> +- config-complete-timeout-us : The maximum time in microseconds time for the
> +	FPGA to go to operating mode after the region has been programmed.
>  - child nodes : devices in the FPGA after programming.
>  
>  In the example below, when an overlay is applied targeting fpga-region0,
> -- 
> 2.12.2
> 
> 

Looks good to me, Maybe Rob has got something,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
