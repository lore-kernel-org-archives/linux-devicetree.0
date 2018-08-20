From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Mon, 20 Aug 2018 16:30:17 -0500
Message-ID: <CAL_Jsq+TpNPB5H3dUYjjiHjk5sPbCw8tJcNgzeN9XdKVNSvZuA@mail.gmail.com>
References: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com> <CAK7LNAT+szUMMyftudykuxVA7ROk6VM+QUobptnLciwAb8pLJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAT+szUMMyftudykuxVA7ROk6VM+QUobptnLciwAb8pLJw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2018 at 1:56 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Rob,
>
>
> 2018-07-04 10:59 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > It is tedious to specify extra compiler options for every file.
> > HOST_EXTRACFLAGS is useful to add options to all files in a
> > directory.
> >
> > -I$(src)/libfdt is needed for all the files in this directory
> > to include libfdt_env.h etc. from scripts/dtc/libfdt/.
> >
> > On the other hand, -I$(src) is used to include check-in headers
> > from generated C files.  Thus, I added it only to dtc-lexer.lex.o
> > and dtc-parser.tab.o .
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
>
> I hope this is a good clean-up.

Sorry, I missed this.

> May I apply this to my kbuild tree for v4.19 ?

Yes.

Reviewed-by: Rob Herring <robh@kernel.org>
