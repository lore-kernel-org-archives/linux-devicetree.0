From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/4] Documentation: devicetree: bindings: Document
 deprecated vendor-prefix found by checkpatch.pl
Date: Fri, 26 Sep 2014 14:59:34 +0100
Message-ID: <20140926135934.GI7422@leverpostej>
References: <1411734292-10910-1-git-send-email-darshanapadmadas@gmail.com>
 <1411734292-10910-3-git-send-email-darshanapadmadas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411734292-10910-3-git-send-email-darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 26, 2014 at 01:24:50PM +0100, Darshana Padmadas wrote:
> This patch documents deprecated vendor name found by checkpatch warning for compatibility reasons.
> 
> Signed-off-by: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ac7269f..2c74874 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -69,6 +69,7 @@ intel	Intel Corporation
>  intercontrol	Inter Control Group
>  isee	ISEE 2007 S.L.
>  isl	Intersil
> +isil	Deprecated name, use isl instead

We have one other documented deprecated vendor-prefix (powervr), and it
would be nice to keep the style consistent between them.

There have been suggestions that we should get checkpatch to warn for
deprecated strings, and consitency will make it easier to do so whenever
someone gets the time to implement that.

So please change this to:

isil Intersil (deprecated, use isl)

And please place this before isl, so as to keep the list in alphabetical
order.

With that:

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Thanks,
Mark.

>  karo	Ka-Ro electronics GmbH
>  keymile	Keymile GmbH
>  lacie	LaCie
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
