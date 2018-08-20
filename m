From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Mon, 20 Aug 2018 15:55:21 +0900
Message-ID: <CAK7LNAT+szUMMyftudykuxVA7ROk6VM+QUobptnLciwAb8pLJw@mail.gmail.com>
References: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,


2018-07-04 10:59 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> It is tedious to specify extra compiler options for every file.
> HOST_EXTRACFLAGS is useful to add options to all files in a
> directory.
>
> -I$(src)/libfdt is needed for all the files in this directory
> to include libfdt_env.h etc. from scripts/dtc/libfdt/.
>
> On the other hand, -I$(src) is used to include check-in headers
> from generated C files.  Thus, I added it only to dtc-lexer.lex.o
> and dtc-parser.tab.o .
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


I hope this is a good clean-up.

May I apply this to my kbuild tree for v4.19 ?


> ---
>
>  scripts/dtc/Makefile | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 9cac65b..1c943e0 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -9,21 +9,11 @@ dtc-objs      := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
>  dtc-objs       += dtc-lexer.lex.o dtc-parser.tab.o
>
>  # Source files need to get at the userspace version of libfdt_env.h to compile
> +HOST_EXTRACFLAGS := -I$(src)/libfdt
>
> -HOSTCFLAGS_DTC := -I$(src) -I$(src)/libfdt
> -
> -HOSTCFLAGS_checks.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_data.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_dtc.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_flattree.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_fstree.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_livetree.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_srcpos.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_treesource.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_util.o := $(HOSTCFLAGS_DTC)
> -
> -HOSTCFLAGS_dtc-lexer.lex.o := $(HOSTCFLAGS_DTC)
> -HOSTCFLAGS_dtc-parser.tab.o := $(HOSTCFLAGS_DTC)
> +# Generated files need one more search path to include headers in source tree
> +HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
> +HOSTCFLAGS_dtc-parser.tab.o := -I$(src)
>
>  # dependencies on generated files need to be listed explicitly
>  $(obj)/dtc-lexer.lex.o: $(obj)/dtc-parser.tab.h
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
