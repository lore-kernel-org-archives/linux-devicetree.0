From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/6] kbuild: remove remaining use of undefined YACC_PREFIX
Date: Thu, 1 Mar 2018 13:20:24 +0900
Message-ID: <CAK7LNAQLq5MVhT5nZO_MTya7YhHee17UhJ7jnq51oeiJVL26QA@mail.gmail.com>
References: <20180228233249.26281-1-robh@kernel.org> <20180228233249.26281-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228233249.26281-2-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-03-01 8:32 GMT+09:00 Rob Herring <robh@kernel.org>:
> Commit eea199b445f6 ("kbuild: remove unnecessary LEX_PREFIX and
> YACC_PREFIX") removed YACC_PREFIX definition, but left one use of it. There
> was not any build error since there is no user of "cmd_bison_h" currently.
> Remove the last remaining occurrence of YACC_PREFIX.
>
> Fixes: eea199b445f6 ("kbuild: remove unnecessary LEX_PREFIX and YACC_PREFIX")
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

You can replace CC with my

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 5589bae34af6..1bc2f90cb8c0 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -217,7 +217,7 @@ $(filter %.tab.c,$(targets)): $(obj)/%.tab.c: $(src)/%.y FORCE
>         $(call if_changed,bison)
>
>  quiet_cmd_bison_h = YACC    $@
> -      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l -p $(YACC_PREFIX) $<
> +      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l $<
>
>  ifdef REGENERATE_PARSERS
>  .PRECIOUS: $(src)/%.tab.h_shipped
> --
> 2.14.1
>



-- 
Best Regards
Masahiro Yamada
