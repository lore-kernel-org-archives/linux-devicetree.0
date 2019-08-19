From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] libfdt: reduce the number of headers included from libfdt_env.h
Date: Mon, 19 Aug 2019 13:36:15 +0900
Message-ID: <CAK7LNASMwqy0ZUZ=kTJ7MJ6OJNa=+vbj5444xzmubJ8+6vO=sg@mail.gmail.com>
References: <20190617162123.24920-1-yamada.masahiro@socionext.com> <CAK7LNATtqhxPcDneW0QOkw-5NyPNP06Qv0bYTe7A_gCiHMiU7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNATtqhxPcDneW0QOkw-5NyPNP06Qv0bYTe7A_gCiHMiU7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 1, 2019 at 11:30 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, Jun 18, 2019 at 1:21 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Currently, libfdt_env.h includes <linux/kernel.h> just for INT_MAX.
> >
> > <linux/kernel.h> pulls in a lots of broat.
> >
> > Thanks to commit 54d50897d544 ("linux/kernel.h: split *_MAX and *_MIN
> > macros into <linux/limits.h>"), <linux/kernel.h> can be replaced with
> > <linux/limits.h>.
> >
> > This saves including dozens of headers.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> ping?

ping x2.




>
>
> >  include/linux/libfdt_env.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
> > index edb0f0c30904..2231eb855e8f 100644
> > --- a/include/linux/libfdt_env.h
> > +++ b/include/linux/libfdt_env.h
> > @@ -2,7 +2,7 @@
> >  #ifndef LIBFDT_ENV_H
> >  #define LIBFDT_ENV_H
> >
> > -#include <linux/kernel.h>      /* For INT_MAX */
> > +#include <linux/limits.h>      /* For INT_MAX */
> >  #include <linux/string.h>
> >
> >  #include <asm/byteorder.h>
> > --
> > 2.17.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
