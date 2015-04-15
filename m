From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: add vendor prefix for Artesyn
Date: Wed, 15 Apr 2015 07:53:26 -0500
Message-ID: <CAL_JsqJC_afcP6ue1nOx38JNqsCiApSpu44E+PhuXrTUEZVxWg@mail.gmail.com>
References: <1428483879-13949-1-git-send-email-alessio.bogani@elettra.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428483879-13949-1-git-send-email-alessio.bogani-9b6o1nMz89Julxpn9UvDqw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessio Igor Bogani <alessio.bogani-9b6o1nMz89Julxpn9UvDqw@public.gmane.org>
Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 8, 2015 at 4:04 AM, Alessio Igor Bogani
<alessio.bogani-9b6o1nMz89Julxpn9UvDqw@public.gmane.org> wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani-9b6o1nMz89Julxpn9UvDqw@public.gmane.org>
> ---
> https://www.artesyn.com/about-us/company-profile
>
> The prefix is already used in the MVME2500 powerpc system
> (arch/powerpc/boot/dts/mvme2500.dts).

This should have been in the commit msg.

Anyway, I've applied it.

Rob

>
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index fae26d0..404dc47 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -23,6 +23,7 @@ apm   Applied Micro Circuits Corporation (APM)
>  arasan Arasan Chip Systems
>  arm    ARM Ltd.
>  armadeus       ARMadeus Systems SARL
> +artesyn        Artesyn Embedded Technologies Inc.
>  asahi-kasei    Asahi Kasei Corp.
>  atmel  Atmel Corporation
>  auo    AU Optronics Corporation
> --
> 2.3.5
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
