From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-ccn: Add bindings info for CCN-502
 compatible string
Date: Tue, 14 Feb 2017 17:48:33 +0000
Message-ID: <20170214174833.GK23718@leverpostej>
References: <1486759368-24067-1-git-send-email-velibor.markovski@broadcom.com>
 <1486759368-24067-2-git-send-email-velibor.markovski@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486759368-24067-2-git-send-email-velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, nd-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 12:42:47PM -0800, Velibor Markovski wrote:
> Add CCN-502 to the list of supported devices by ARM CCN PMU driver.
> 
> Signed-off-by: Velibor Markovski <velibor.markovski-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

I assume Pawel will take this along with the driver patch.

Thanks,
Mark.

> ---
>  Documentation/devicetree/bindings/arm/ccn.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ccn.txt b/Documentation/devicetree/bindings/arm/ccn.txt
> index b100d38..2980145 100644
> --- a/Documentation/devicetree/bindings/arm/ccn.txt
> +++ b/Documentation/devicetree/bindings/arm/ccn.txt
> @@ -3,6 +3,7 @@
>  Required properties:
>  
>  - compatible: (standard compatible string) should be one of:
> +	"arm,ccn-502"
>  	"arm,ccn-504"
>  	"arm,ccn-508"
>  
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
