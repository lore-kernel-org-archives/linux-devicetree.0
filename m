From: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v12 05/18] kunit: test: add the concept of expectations
Date: Mon, 12 Aug 2019 22:04:30 -0700
Message-ID: <CAFd5g44VBzDSjxHGUZ=8A9hempQ0_3Ym_8qzj0ETEJ8AzM6poA@mail.gmail.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-6-brendanhiggins@google.com> <20190812235701.533E82063F@mail.kernel.org>
 <20190813003352.GA235915@google.com> <20190813050206.2A49C206C2@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813050206.2A49C206C2@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, kunit-dev@googlegroups.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, open list:KERNEL SELFTEST FRAMEWORK
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 10:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 17:33:52)
> > On Mon, Aug 12, 2019 at 04:57:00PM -0700, Stephen Boyd wrote:
> > > Quoting Brendan Higgins (2019-08-12 11:24:08)
> > > > + */
> > > > +#define KUNIT_EXPECT_TRUE(test, condition) \
> > > > +               KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
> > >
> > > A lot of these macros seem double indented.
> >
> > In a case you pointed out in the preceding patch, I was just keeping the
> > arguments column aligned.
> >
> > In this case I am just indenting two tabs for a line continuation. I
> > thought I found other instances in the kernel that did this early on
> > (and that's also what the Linux kernel vim plugin wanted me to do).
> > After a couple of spot checks, it seems like one tab for this kind of
> > line continuation seems more common. I personally don't feel strongly
> > about any particular version. I just want to know now what the correct
> > indentation is for macros before I go through and change them all.
> >
> > I think there are three cases:
> >
> > #define macro0(param0, param1) \
> >                 a_really_long_macro(...)
> >
> > In this first case, I use two tabs for the first indent, I think you are
> > telling me this should be one tab.
>
> Yes. Should be one.
>
> >
> > #define macro1(param0, param1) {                                               \
> >         statement_in_a_block0;                                                 \
> >         statement_in_a_block1;                                                 \
> >         ...                                                                    \
> > }
> >
> > In this case, every line is in a block and is indented as it would be in
> > a function body. I think you are okay with this, and now that I am
> > thinking about it, what I think you are proposing for macro0 will make
> > these two cases more consistent.
> >
> > #define macro2(param0,                                                         \
> >                param1,                                                         \
> >                param2,                                                         \
> >                param3,                                                         \
> >                ...,                                                            \
> >                paramn) ...                                                     \
> >
> > In this last case, the body would be indented as in macro0, or macro1,
> > but the parameters passed into the macro are column aligned, consistent
> > with one of the acceptable ways of formatting function parameters that
> > don't fit on a single line.
> >
> > In all cases, I put 1 space in between the closing parameter paren and
> > the line continuation `\`, if only one `\` is needed. Otherwise, I align
> > all the `\s` to the 80th column. Is this okay, or would you prefer that
> > I align them all to the 80th column, or something else?
> >
>
> This all sounds fine and I'm not nitpicking this style. Just the double
> tabs making lines longer than required.

Sounds good. Will do.
