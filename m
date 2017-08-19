From: Cao jin <caoj.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Date: Sat, 19 Aug 2017 19:31:06 +0800
Message-ID: <5998217A.1030305@cn.fujitsu.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503132577-24423-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Markus Heiser <markus.heiser-m1Uo1GnMJf0b1SvskN2V4Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, SeongJae Park <sj38.park-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
  I am stuck in a similar problem recent days by chance.
  I am just curious about the purpose of introduction of these *_shipped
file, are they just for user's convenience when user doesn't install the
those tools?

-- 
Sincerely,
Cao jin

On 08/19/2017 04:49 PM, Masahiro Yamada wrote:
> In Linux build system convention, we do not run tools such as
> flex, bison, gperf during the kernel building.  Instead, manage
> generated C files in the repository with _shipped suffixes.
> They are simply shipped (copied) removing the _shipped suffixes
> during the kernel building.
> 
> Commit 7373f4f83c71 ("kbuild: add implicit rules for parser generation")
> added a mechanism to regenerate intermediate C files easily.
> The build rules are surrounded with ifdef REGENERATE_PARSERS.
> So, we need to pass REGENERATE_PARSERS=1 from the command line
> when we want to update them.
> 
> Here is one question.  Is it acceptable to use those rules all the time?
> That is, generate those C files by flex, bison, gperf during the
> kernel building.
> 
> This means, the build system depends on more external tools.
>>From the users' point of view, they will need to install
> flex, bison, gperf in order to build the kernel.
>>From the developers' point of view, the advantage is
> we do not need to version-control generated files, i.e. _shipped files
> will be deleted.
> 
> I'd like to know if this is acceptable or not.
> 
> For example, currently some files are simply shipped (copied)
> when building the kconfig program.
> 
>   $ make mrproper; make defconfig
>     HOSTCC  scripts/basic/fixdep
>     HOSTCC  scripts/kconfig/conf.o
>     SHIPPED scripts/kconfig/zconf.tab.c
>     SHIPPED scripts/kconfig/zconf.lex.c
>     SHIPPED scripts/kconfig/zconf.hash.c
>     HOSTCC  scripts/kconfig/zconf.tab.o
>     HOSTLD  scripts/kconfig/conf
>   *** Default configuration is based on 'x86_64_defconfig'
>   #
>   # configuration written to .config
>   #
> 
> With this series, they are created from *real* sources
> (*.y, *.l, *.gperf files).
> 
>   $ make mrproper; make defconfig
>     HOSTCC  scripts/basic/fixdep
>     HOSTCC  scripts/kconfig/conf.o
>     YACC    scripts/kconfig/zconf.tab.c
>     LEX     scripts/kconfig/zconf.lex.c
>     GPERF   scripts/kconfig/zconf.hash.c
>     HOSTCC  scripts/kconfig/zconf.tab.o
>     HOSTLD  scripts/kconfig/conf
>   *** Default configuration is based on 'x86_64_defconfig'
>   #
>   # configuration written to .config
>   #
> 
> Note:
> The tool versions in Documentation/process/changes.rst are just
> place-holders for now.  We need to figure out the minimal versions
> if we like to switch to this approach.
> 
> 
> 
> Masahiro Yamada (3):
>   kbuild: generate *.hash.c during build
>   kbuild: generate *.lex.c during build
>   kbuild: generate *.tab.c and *.tab.h during build
> 
>  Documentation/process/changes.rst        |   36 +
>  scripts/Makefile.lib                     |   26 +-
>  scripts/dtc/Makefile                     |    6 +-
>  scripts/dtc/dtc-lexer.lex.c_shipped      | 2259 ---------------------------
>  scripts/dtc/dtc-parser.tab.c_shipped     | 2303 ----------------------------
>  scripts/dtc/dtc-parser.tab.h_shipped     |  125 --
>  scripts/genksyms/Makefile                |    4 +-
>  scripts/genksyms/keywords.hash.c_shipped |  230 ---
>  scripts/genksyms/lex.lex.c_shipped       | 2291 ---------------------------
>  scripts/genksyms/parse.tab.c_shipped     | 2394 -----------------------------
>  scripts/genksyms/parse.tab.h_shipped     |  119 --
>  scripts/kconfig/Makefile                 |    1 +
>  scripts/kconfig/zconf.hash.c_shipped     |  297 ----
>  scripts/kconfig/zconf.lex.c_shipped      | 2473 ------------------------------
>  scripts/kconfig/zconf.tab.c_shipped      | 2471 -----------------------------
>  15 files changed, 53 insertions(+), 14982 deletions(-)
>  delete mode 100644 scripts/dtc/dtc-lexer.lex.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped
>  delete mode 100644 scripts/genksyms/keywords.hash.c_shipped
>  delete mode 100644 scripts/genksyms/lex.lex.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.h_shipped
>  delete mode 100644 scripts/kconfig/zconf.hash.c_shipped
>  delete mode 100644 scripts/kconfig/zconf.lex.c_shipped
>  delete mode 100644 scripts/kconfig/zconf.tab.c_shipped
> 



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
