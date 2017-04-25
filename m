From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] of: support dtc compiler flags for overlays
Date: Wed, 26 Apr 2017 07:04:52 +0900
Message-ID: <CAK7LNARd-XsCfSJhDj3JisH=u4XZm8DaPEa5Pg2ciWrq8Ueing@mail.gmail.com>
References: <1493075119-32026-1-git-send-email-frowand.list@gmail.com> <1493075119-32026-2-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493075119-32026-2-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-04-25 8:05 GMT+09:00  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>
> The dtc compiler version that adds initial support was available
> in 4.11-rc1.  Add the ability to set the dtc compiler flags needed
> by overlays.
>
> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
> ---


I know your motivation for 1/2 is overlay,
but this patch itself is more generic.
(support for per-file dtc compiler flag)

Could you reword the commit subject a little bit?

Otherwise,

Acked-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>



>  scripts/Makefile.lib | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a07f9014944..0bbec480d323 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -283,6 +283,8 @@ ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
>  DTC_FLAGS += -Wno-unit_address_vs_reg
>  endif
>
> +DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
> +
>  # Generate an assembly file to wrap the output of the device tree compiler
>  quiet_cmd_dt_S_dtb= DTB     $@
>  cmd_dt_S_dtb=                                          \
> --


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
