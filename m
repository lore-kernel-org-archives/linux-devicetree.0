From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] libfdt: prefix header search paths with $(srctree)/
Date: Thu, 14 Mar 2019 02:35:39 +0900
Message-ID: <CAK7LNASfATE2zgm7Qz3i2Hm1vxTg_jE-jDwDDJ8ASVg19EdCXQ@mail.gmail.com>
References: <1548387699-9222-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNAQ6bRxhXuSgVS0DqZ_izMyKuujmQe9TVV8pDXve-gs90g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQ6bRxhXuSgVS0DqZ_izMyKuujmQe9TVV8pDXve-gs90g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: DTML <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 11, 2019 at 10:43 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Rob,
>
>
> On Fri, Jan 25, 2019 at 12:42 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Currently, the Kbuild core manipulates header search paths in a crazy
> > way [1].
> >
> > To fix this mess, I want all Makefiles to add explicit $(srctree)/ to
> > the search paths in the srctree. Some Makefiles are already written in
> > that way, but not all. The goal of this work is to make the notation
> > consistent, and finally get rid of the gross hacks.
> >
> > Having whitespaces after -I does not matter since commit 48f6e3cf5bc6
> > ("kbuild: do not drop -I without parameter").
> >
> > [1]: https://patchwork.kernel.org/patch/9632347/
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
> Could you apply this to your tree?


Anyway, this one is trivial Makefile change.

Applied to linux-kbuild now.





> Thanks.
>
> Masahiro
>
>
> > ---
> >
> >  lib/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/Makefile b/lib/Makefile
> > index e1b59da..05973c1 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -208,7 +208,7 @@ KCOV_INSTRUMENT_stackdepot.o := n
> >  libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o \
> >                fdt_empty_tree.o
> >  $(foreach file, $(libfdt_files), \
> > -       $(eval CFLAGS_$(file) = -I$(src)/../scripts/dtc/libfdt))
> > +       $(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
> >  lib-$(CONFIG_LIBFDT) += $(libfdt_files)
> >
> >  obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
> > --
> > 2.7.4
> >
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
