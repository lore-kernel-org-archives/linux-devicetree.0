From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/10] of: Add vendor prefix for General Electric
 Company
Date: Thu, 5 Nov 2015 14:23:45 -0600
Message-ID: <20151105202345.GA8352@rob-hp-laptop>
References: <1446747224-32514-1-git-send-email-akshay.bhat@timesys.com>
 <1446747224-32514-8-git-send-email-akshay.bhat@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1446747224-32514-8-git-send-email-akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 05, 2015 at 01:13:41PM -0500, Akshay Bhat wrote:
> This patch adds vendor prefix for General Electric Company
> 
> Signed-off-by: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2b3c5ac..71dcbd5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -87,6 +87,7 @@ fcs	Fairchild Semiconductor
>  firefly	Firefly
>  focaltech	FocalTech Systems Co.,Ltd
>  fsl	Freescale Semiconductor
> +ge	General Electric Company

This is short too, but it is well known and the stock ticker so:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
>  gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
>  geniatech	Geniatech, Inc.
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
