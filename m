From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 1/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 12:21:48 +0900
Message-ID: <CAK7LNAQBjkZe05Vmm7mPhYWEM7ExMb7J3f8m5UYP_goMUW+75Q@mail.gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com> <1517194414-19932-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517194414-19932-2-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

2018-01-29 11:53 GMT+09:00  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> index df697976740a..2b7ee68c908e 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -3,6 +3,21 @@ DTC_FLAGS_testcases := -Wno-interrupts_property
>  obj-y += testcases.dtb.o
>
>  obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
> +                           overlay_0.dtb.o \
> +                           overlay_1.dtb.o \
> +                           overlay_2.dtb.o \
> +                           overlay_3.dtb.o \
> +                           overlay_4.dtb.o \
> +                           overlay_5.dtb.o \
> +                           overlay_6.dtb.o \
> +                           overlay_7.dtb.o \
> +                           overlay_8.dtb.o \
> +                           overlay_9.dtb.o \
> +                           overlay_10.dtb.o \
> +                           overlay_11.dtb.o \
> +                           overlay_12.dtb.o \
> +                           overlay_13.dtb.o \
> +                           overlay_15.dtb.o \
>                             overlay_bad_phandle.dtb.o \
>                             overlay_bad_symbol.dtb.o \
>                             overlay_base.dtb.o
> @@ -14,6 +29,7 @@ DTC_FLAGS_overlay := -@
>  DTC_FLAGS_overlay_bad_phandle := -@
>  DTC_FLAGS_overlay_bad_symbol := -@
>  DTC_FLAGS_overlay_base := -@
> +DTC_FLAGS_testcases := -@
>

This overwrites '-Wno-interrupts_property' a few lines above.

Perhaps, do you want to do like this?

     DTC_FLAGS_testcases += -@

or

     DTC_FLAGS_testcases := -Wno-interrupts_property -@





-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
