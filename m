From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] libfdt: prefix header search paths with $(srctree)/
Date: Wed, 13 Mar 2019 13:14:38 -0500
Message-ID: <CAL_JsqJm6RP5KNt8tYOa=8Uj2V9EFJMjw=xoabSfEzX-YQEZgA@mail.gmail.com>
References: <1548387699-9222-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNAQ6bRxhXuSgVS0DqZ_izMyKuujmQe9TVV8pDXve-gs90g@mail.gmail.com> <CAK7LNASfATE2zgm7Qz3i2Hm1vxTg_jE-jDwDDJ8ASVg19EdCXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNASfATE2zgm7Qz3i2Hm1vxTg_jE-jDwDDJ8ASVg19EdCXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: DTML <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 13, 2019 at 12:36 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Mon, Feb 11, 2019 at 10:43 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Hi Rob,
> >
> >
> > On Fri, Jan 25, 2019 at 12:42 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > Currently, the Kbuild core manipulates header search paths in a crazy
> > > way [1].
> > >
> > > To fix this mess, I want all Makefiles to add explicit $(srctree)/ to
> > > the search paths in the srctree. Some Makefiles are already written in
> > > that way, but not all. The goal of this work is to make the notation
> > > consistent, and finally get rid of the gross hacks.
> > >
> > > Having whitespaces after -I does not matter since commit 48f6e3cf5bc6
> > > ("kbuild: do not drop -I without parameter").
> > >
> > > [1]: https://patchwork.kernel.org/patch/9632347/
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> >
> > Could you apply this to your tree?
>
>
> Anyway, this one is trivial Makefile change.
>
> Applied to linux-kbuild now.

Sorry, I missed this. It tends to happen with things outside my normal
search path.

Rob
