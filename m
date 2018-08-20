From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] scripts/dtc: consolidate include path options in Makefile
Date: Mon, 20 Aug 2018 16:32:06 -0500
Message-ID: <CAL_Jsq+iAxmKvZ+RAD-VSOWirYOxc52mJHU5f5gybhWwQn2w_g@mail.gmail.com>
References: <1530669563-32637-1-git-send-email-yamada.masahiro@socionext.com> <cfb66b67-f423-0c26-0b22-0d57a581b44a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cfb66b67-f423-0c26-0b22-0d57a581b44a@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2018 at 1:55 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 07/03/18 18:59, Masahiro Yamada wrote:
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
> > ---
> >
> >  scripts/dtc/Makefile | 18 ++++--------------
> >  1 file changed, 4 insertions(+), 14 deletions(-)
> >
> > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > index 9cac65b..1c943e0 100644
> > --- a/scripts/dtc/Makefile
> > +++ b/scripts/dtc/Makefile
> > @@ -9,21 +9,11 @@ dtc-objs    := dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
> >  dtc-objs     += dtc-lexer.lex.o dtc-parser.tab.o
> >
> >  # Source files need to get at the userspace version of libfdt_env.h to compile
> > +HOST_EXTRACFLAGS := -I$(src)/libfdt
>
> Shouldn't that be += instead of :=?

I don't think so. The definition is local to the file (and reset
before each makefile is included).

Rob
