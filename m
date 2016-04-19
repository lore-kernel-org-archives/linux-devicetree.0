From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] of: Add Arrow Electronics to vendor prefix list
Date: Tue, 19 Apr 2016 17:23:20 -0500
Message-ID: <20160419222320.GA31467@rob-hp-laptop>
References: <1460453397-5597-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460453397-5597-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 12, 2016 at 10:29:56AM +0100, Srinivas Kandagatla wrote:
> This patch adds Arrow Electronics to vendor perfix list, as this vendor
> makes some of the Qualcomm SOC based 96boards like DB600c and DB410c.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 86740d4..f382061 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -27,6 +27,7 @@ aptina	Aptina Imaging
>  arasan	Arasan Chip Systems
>  arm	ARM Ltd.
>  armadeus	ARMadeus Systems SARL
> +arrow	Arrow Electronics
>  artesyn	Artesyn Embedded Technologies Inc.
>  asahi-kasei	Asahi Kasei Corp.
>  atlas	Atlas Scientific LLC
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
