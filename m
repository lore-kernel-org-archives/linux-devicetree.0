From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/6] kbuild: add dtc as dependency on .dtb files
Date: Thu, 1 Mar 2018 13:33:16 +0900
Message-ID: <CAK7LNAQSJ1uzgmta76rJwDpi08SB5gwcRPxu_TPw0u0XzgGaJA@mail.gmail.com>
References: <20180228233249.26281-1-robh@kernel.org> <20180228233249.26281-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

2018-03-01 8:32 GMT+09:00 Rob Herring <robh@kernel.org>:
> If dtc is rebuilt, we should rebuild .dtb files with the new dtc.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Rob Herring <robh@kernel.org>


Hmm, I am not 100% sure about this.

Is there a case where resulted DTBs
depend on DTC version?


If I understand correctly,
DTS and DTB are 1:1
Unlike CC, there is no room for optimization.


Some possibilities could be:
     - specification is updated.
    ( /dts-v1/ in DTS should be updated if so)
  - buggy DTC version generates broken DTBs.



> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1bc2f90cb8c0..6aeb91524c76 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -316,7 +316,7 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>
> -$(obj)/%.dtb: $(src)/%.dts FORCE
> +$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>         $(call if_changed_dep,dtc)
>
>  dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
