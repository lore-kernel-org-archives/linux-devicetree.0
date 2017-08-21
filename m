From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] kbuild: generate *.tab.c and *.tab.h during build
Date: Mon, 21 Aug 2017 12:12:31 -0500
Message-ID: <CAL_JsqKWX1kb58_cck5ACGJGg8p2irsZNXufq2ougbRDxnLhXw@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com> <1503132577-24423-4-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503132577-24423-4-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Michal Marek <mmarek-IBi9RG/b67k@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SeongJae Park <sj38.park-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 19, 2017 at 3:49 AM, Masahiro Yamada
<yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
> *.tab.[ch] files are artifacts generated from *.y by using bison.
> Instead of running bison, we conventionally version-control
> *.tab.[ch]_shipped files and copy them to *.tab.[ch] during build.
>
> It is true that this approach can minimize external tool dependency,
> but we need to update the shipped files from time to time.  This
> commit switches to build-time generation of the intermediate C files.

When do we need to update them?

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
>
>  Documentation/process/changes.rst    |   12 +
>  scripts/Makefile.lib                 |   14 +-
>  scripts/dtc/Makefile                 |    9 +-
>  scripts/dtc/dtc-parser.tab.c_shipped | 2303 -------------------------------
>  scripts/dtc/dtc-parser.tab.h_shipped |  125 --

The script to import dtc normally creates these. If you change this,
please make sure the script still works.

>  scripts/genksyms/Makefile            |    5 +-
>  scripts/genksyms/parse.tab.c_shipped | 2394 --------------------------------
>  scripts/genksyms/parse.tab.h_shipped |  119 --
>  scripts/kconfig/Makefile             |    2 +-
>  scripts/kconfig/zconf.tab.c_shipped  | 2471 ----------------------------------
>  10 files changed, 24 insertions(+), 7430 deletions(-)
>  delete mode 100644 scripts/dtc/dtc-parser.tab.c_shipped
>  delete mode 100644 scripts/dtc/dtc-parser.tab.h_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.c_shipped
>  delete mode 100644 scripts/genksyms/parse.tab.h_shipped
>  delete mode 100644 scripts/kconfig/zconf.tab.c_shipped
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
