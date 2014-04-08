From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: Fix the section mismatch warnings.
Date: Tue, 8 Apr 2014 07:55:26 -0500
Message-ID: <CAL_JsqKuvKwEv89hOSknc-0Pq3aiwyPFhB-kPA-cRjGK831oFQ@mail.gmail.com>
References: <1396936087-23043-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396936087-23043-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 8, 2014 at 12:48 AM, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> In tag next-20140407, building with CONFIG_DEBUG_SECTION_MISMATCH
> enabled, the following WARNING is occured:
>
> WARNING: drivers/built-in.o(.text.unlikely+0x2220): Section mismatch
> in reference from the function __reserved_mem_check_root() to the
> function .init.text:of_get_flat_dt_prop()
> The function __reserved_mem_check_root() references
> the function __init of_get_flat_dt_prop().
> This is often because __reserved_mem_check_root lacks a __init
> annotation or the annotation of of_get_flat_dt_prop is wrong.
>
> WARNING: vmlinux.o(.text.unlikely+0xb9d0): Section mismatch in reference
> from the function __reserved_mem_check_root() to the (unknown reference)
> .init.data:(unknown)
> The function __reserved_mem_check_root() references
> the (unknown reference) __initdata (unknown).
> This is often because __reserved_mem_check_root lacks a __initdata
> annotation or the annotation of (unknown) is wrong.
>
> This is cause by :
> 'drivers: of: add initialization code for dynamic reserved memory'.
>
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
