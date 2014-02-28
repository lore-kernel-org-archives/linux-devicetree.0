From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] of: add vendor prefix for SMSC
Date: Fri, 28 Feb 2014 09:08:14 +0000
Message-ID: <20140228090814.GA29264@e106331-lin.cambridge.arm.com>
References: <1393531494-25370-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393531494-25370-1-git-send-email-florian.vaussard-p8DiymsW2f8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 27, 2014 at 08:04:54PM +0000, Florian Vaussard wrote:
> Add a vendor prefix for Standard Microsystems Corporation, now part of
> Microchip.
> 
> Signed-off-by: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>

It's worth noting that this vendor prefix has been in active use for a
while, but was simply undocumented.

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Cheers,
Mark.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 40ce2df..7187c71 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -80,6 +80,7 @@ sil	Silicon Image
>  silabs	Silicon Laboratories
>  simtek
>  sirf	SiRF Technology, Inc.
> +smsc	Standard Microsystems Corporation
>  snps 	Synopsys, Inc.
>  spansion	Spansion Inc.
>  st	STMicroelectronics
> -- 
> 1.8.5.3
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
