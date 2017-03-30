From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: Add binding for
 /secure-chosen/stdout-path
Date: Thu, 30 Mar 2017 17:28:46 -0500
Message-ID: <20170330222845.ewddsnmkxwrsposl@rob-hp-laptop>
References: <e3e007ef9ee6a622ae4ccc74fd0fca32b3c5dfb5.1488531370.git.jerome.forissier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e3e007ef9ee6a622ae4ccc74fd0fca32b3c5dfb5.1488531370.git.jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 10:24:33AM +0100, Jerome Forissier wrote:
> Some platforms may use a single device tree to describe two address
> spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
> for Secure-only devices"). For these platforms it makes sense to define
> a secure counterpart of /chosen, namely: /secure-chosen. This new node
> is meant to be used by the secure firmware to pass data to the secure
> OS. Only the stdout-path property is supported for now.
> 
> Signed-off-by: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/secure.txt | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> v2
> 
> - Clarify the expected behavior when /secure-chosen/stdout-path is not
> present (either the property or the node itself), as proposed by Peter
> and Robin. Note that I have made the fallback to /chosen optional.

I'm okay with this, but would like to hold off merging it until your are 
really using it. You did say you were "experimenting" and it doesn't 
sound like the DT usage in secure world is that far along. I just want 
to see if there are other issues that come up.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
