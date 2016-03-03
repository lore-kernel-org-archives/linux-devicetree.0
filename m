From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH Resend] Input: ads7846: Add description how to use
 internal reference (ADS7846)
Date: Thu, 3 Mar 2016 17:39:51 -0600
Message-ID: <20160303233950.GA15264@rob-hp-laptop>
References: <1456729595-32023-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456729595-32023-1-git-send-email-alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Cc: Pawel-ihh4Xogjf8b2iF0jqypphg/WZsTnP+MUkuwNSG5dpIY@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 29, 2016 at 08:06:35AM +0100, Alexander Stein wrote:
> By simply setting vref-mv to 0 the internal reference will be used.
> Document that!
> 
> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/input/ads7846.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/ads7846.txt b/Documentation/devicetree/bindings/input/ads7846.txt
> index 33a1638..c6cfe2e 100644
> --- a/Documentation/devicetree/bindings/input/ads7846.txt
> +++ b/Documentation/devicetree/bindings/input/ads7846.txt
> @@ -29,6 +29,8 @@ Optional properties:
>  	ti,vref-delay-usecs		vref supply delay in usecs, 0 for
>  					external vref (u16).
>  	ti,vref-mv			The VREF voltage, in millivolts (u16).
> +					Set to 0 to use internal refernce
> +					(ADS7846).
>  	ti,keep-vref-on			set to keep vref on for differential
>  					measurements as well
>  	ti,swap-xy			swap x and y axis
> -- 
> 2.4.10
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
